---
title: "Performance basics"
summary: "In general and in Java"
author: "Christina Unger"
tags: ["performance"]
weight: 1
math: false
toc: true
draft: false
---

# Computer architecture and main performance bottlenecks

Modern digital computers build on the basic von Neumann architecture and consist of the following main components:

* A CPU (Central Processing Unit), the computational core of the computer, comprising a control unit, an arithmetic and logic unit, and registers.
* Memory that stores data and instructions.
* Input and output devices.

These basic components are nowadays extended by several levels of caches and are usually multiplied - both putting several cores on one CPU (around 8 on a standard laptop, and 20-50 on compute machines), and connecting several CPUs on one node (usually two).

Also, modern processors can contain SIMD (Single Instruction Multiple Data) elements that can perform the same instruction on several data points simultaneously.

Each CPU has its own memory bank, i.e. part of the shared memory. Other CPUs on the same node can also access that memory bank, but then data has to transit via a memory bus, which makes the path longer.

{{< rawhtml >}}
<img src="/images/docs/perf-computer-architecture.png" alt="Modern computer architecture" width="100%" style="display: block; margin: auto; padding: 10px;" />
{{< /rawhtml >}}

_Simplified architecture of modern computers, here consisting of two CPUs with multiple cores. The main performance bottlenecks are 1) computational capacity, and 2) memory bandwidth._

The performance of an application or algorithm can hit two main bottlenecks, concerning the following two machine capabilities.

1. Computational capacity refers to the speed of the processor, more specifically how many floating-point operations it can do per second (FLOP/s, or more commonly GFLOP/s).
2. CPUs access memory via a memory bus. Memory bandwidth refers to the amount of data that can be transferred between CPU and memory (GB/s).

If computational capacity is the main bottleneck, we call the application or algorithm **compute-bound**, i.e. it is limited by how many operations the CPU can do. In this case, parallelization to spread workload across more cores is a straightforward option to reduce pressure on this bottleneck.

If memory bandwidth is the main bottleneck, we call the application or algorithm **memory-bound**, i.e. it is limited by how fast data can be transferred to the CPU. This means the CPU could do more work but spends time waiting for data. So, parallelization across more on the same node would not increase performance meaningfully, as the memory bandwidth is already saturated. In this case, improving data locality and cache behavior is more promising.

# Memory hierarchy and data locality

The main trade-off with memory is between size and speed of access. Modern computers therefore contain different kinds of memory, each allowing a different decision for that trade-off. The general hierarchy of the main types of memory comprises registers and caches on the CPU, random-access memory (RAM), and persisted memory on disk.

{{< rawhtml >}}
<img src="/images/docs/perf-memory-hierarchy.png" alt="Memory hierarchy" width="360" style="display: block; margin: auto; padding: 10px;" />
{{< /rawhtml >}}

The higher in the hierarchy, the faster is memory access but the smaller is memory size. Vice versa, the lower in the hierarchy, the bigger is memory size but the slower is memory access.

For fast computations, we want the data required for those computations as high up in the hierarchy as possible, i.e. as close to the processor as possible, ideally in caches on the CPU. This is often referred to as data locality.

Computers have a cache management policy for loading and keeping data in cache, which depends mainly on two locality properties:

* **Spatial locality:** If data is accessed, nearby data is likely to be accessed as well, so it is pre-fetched (possibly dropping data farther away to free cache space).
* **Temporal locality:** If data is accessed now, it is likely to be accessed again soon, so it is kept in cache (possibly dropping data that hasn't been accessed for a longer time).

For example, iterating over an array benefits from spatial locality if the array is stored consecutively in memory, while pre-computed local variables used in each iteration benefit from temporal locality.

Important to note about two-dimensional arrays is that they need to be stored linearly in memory. This can happen either in row-major order (storing one row after the other, for example done in C) or in column-major order (storing one column after the other, for example done in Fortran). This has a big impact on spatial locality when iterating over all elements of a two-dimensional array: Since Fortran stores it in column-major order, the inner loop should be over the column index, so that it can benefit from pre-fetching memory-adjacent data.

{{< rawhtml >}}
<img src="/images/docs/perf-row-column-major-order.png" alt="Row-major and columns-major order" width="600" style="display: block; margin: auto; padding: 10px;" />
{{< /rawhtml >}}

_Illustration of row-major order (left) and column-major order (right). (Source: Wikimedia)_

# Java performance

In order to understand performance of a Java application, both in terms of speed and in terms of resource usage, it helps to have a general understanding of the JVM, the memory model it uses, and how that memory is managed.

## JVM

Here is a rough schematic of how the JVM works internally.

{{< rawhtml >}}
<img src="/images/docs/perf-jvm.png" alt="JVM schematics" width="600" style="display: block; margin: auto; padding: 10px;" />
{{< /rawhtml >}}

The primary Java compiler is `javac`. It compiles source code (in `.java` files) into bytecode (in `.class` files). Bytecode comprises different instruction types, such as object creation and manipulation, method invocation and return, type conversion, arithmetic operations, stack management, and control transfer. It is not machine code; for example, it does not contain instructions to allocate or access specific memory addresses.

The idea behind bytecode is to have a compact representation that runs predictable on any system with a compatible JVM ("write once, run everywhere"), in a memory-safe way.

At runtime, bytecode is loaded by the classloader and is run by the JVM interpreter.

At the same time, the JVM profiles what happens, to see which parts of the code would benefit from optimization, for example what methods are used often, with what arguments, and so on. These parts are then compiled into machine code by the just-in-time (JIT) compiler. The result of JIT compilation is often more efficient than ahead-of-time compilation because it can take into account the actual runtime behavior of your program. It also means that it's not easy to reason about performance of single methods in isolation.
Memory

When the JVM starts up, it requests memory from the operating system and separates that into three main areas.

{{< rawhtml >}}
<img src="/images/docs/perf-memory.png" alt="Memory organization" width="260" style="display: block; margin: auto; padding: 10px;"/>
{{< /rawhtml >}}

The stack is used to store method calls, local variables, and references to objects in the heap. It really is a stack (last in first out). You see part of the stack when you inspect the stack trace of an exception, which shows the call hierarchy that was on the stack when the exception occurred.

You would get a stack overflow when you try to run an infinite recursion, putting a method and its arguments on the stack again and again and again without ever removing them.

The heap is dynamically allocated memory. It constitutes the main pool of memory of an application; all objects your Java program creates live there. The JVM allocates space on the heap when it creates new objects, and garbage collection later frees it again (if possible). The JVM extends or shrinks heap space depending on the memory needs of the running application, within the configured limits.

An `OutOfMemoryError` happens when heap space is full, garbage collection fails to free any of it, and it cannot be extended.

Each thread has its own stack, while heap space is shared among threads.

The metaspace contains metadata about classes: their names, types, attributes, method names, etc. This is also garbage collected but much less often than the heap, because it's usually quite long-lived information.

## Garbage collection

The garbage collector looks at heap memory, identifies which objects are still used – meaning some reachable part of your program still holds a pointer to that object – and deletes the ones which are not referenced anymore, to reclaim the memory.

To make this process efficient, the JVM separates heap space into several regions, following a so-called generational model, based on the observation that most objects are actually quite short-lived.

{{< rawhtml >}}
<img src="/images/docs/perf-java-memory.png" alt="JVM memory organization" width="700" style="display: block; margin: auto; padding: 10px;" />
{{< /rawhtml >}}

All objects are allocated in the Young Generation part. When this fills up, minor garbage collection runs. Minor garbage collection looks only at the Young Generation space, deleting the dead objects there and moving the surviving ones into the survivor space – and, when they reach a certain age, eventually into the Old Generation.

Slower and thus less often executed is a major (or full) garbage collection, which looks at all live objects, including the Old Generation part and the metaspace.

Garbage collection can be a "stop the world" event, meaning that all application threads are paused until the operation is done. This makes it a trade-off between how fast you free up memory and how often you interrupt the application.

Garbage collectors try to find an optimal balance of how often they run and how much space is freed with each run. Since what is considered optimal depends on the type of application, there are different algorithms and you can configure what you want to optimize for.

Note that calling `System.gc()` manually is only a suggestion to the JVM; it doesn't mean that garbage is executed immediately.

## Memory leaks

Performance issues can arise when objects are not needed anymore but are still referenced and thus their memory cannot be reclaimed by garbage collection. If you either grow such objects over time or keep creating more and more of them, this can lead to a memory leak, when the application takes up more and more memory which cannot be freed.

**Static references**

Static fields belong to the class, not to individual instances. Instances are frequently garbage collected, while classes and their static fields can remain in memory for the whole lifetime of the application.
So if you have static objects, especially lists or maps, that you keep growing, this leads to trouble.

Note that static references are not bad per se. With singletons, for example, we intentionally decide to create an object as static reference (possibly a large one or one that is expensive to load), so we know we have exactly one instance throughout the lifetime of the application and don't have to create several instances repeatedly.

Use static fields and large collections wisely.

**Unclosed resources**

When you open resources such as file streams or database connections, they take up memory. If these resources are not closed, this can lead to resource leaks.

Always close resources after use, also in case an exception occurs. Ideally use try-with-resource statements for automatic resource management.

**Inner classes**

Non-static inner classes hold an implicit reference to their outer class. If instances of these inner classes are passed around and kept alive in the application, they can keep their outer class instances in memory too.

**Caching**

The whole point of a cache is to keep stuff that is used often in memory, to make accessing it more efficient. Obviously, this works well only as long as the cache does not keep growing without ever being cleared.

## Tools

* [VisualVM](https://visualvm.github.io/)
* Java Flight Recorder (JFR) & Java Mission Control (JMC): JFR is used for collecting diagnostic and profiling data about a running Java application, while JMC is used for analyzing this data.

# References

* Georg Hager & Gerhard Wellein: Introduction to High Performance Computing for Scientists and Engineers .