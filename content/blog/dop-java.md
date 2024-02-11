---
title: "Something catchy..."
description: "Data-oriented programming in Java"
author: "Christina Unger"
tags: ["java"]
date: 2022-01-28
lastmod: 2022-01-28
draft: true
---

* Separate behavior from data.
* Data is immutable.
* Collect data in generic data structures.

Import:

* Lombok
* Paguro

```
@Value @Accessors(fluent=true)
public class Isotope {

    String ref; // e.g. "Pu-239" or "Th-90*"

    int A;    // mass number
    int Z;    // number of protons
    int N() { // number of neutrons
      return A - Z;
    }

    // No methods!
    // Behavior is implemented in code modules.
}
```

Generic collections of entities:
vec, tup, set, etc.

```
public class Module {

  static boolean function(Entity e, int n) {
    // ...
  }

  static Integer indexOf(Collection<Entity> es, Entity e) {
    // ...
  }
}
```
