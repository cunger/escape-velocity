---
title: "Algebraic structures"
summary: "The gist of it. Draft."
date: 2020-10-21
weight: 2
math: true
toc: true
draft: false
---

Algebra is a way to reason about the properties of mathematical objects under certain operations.

# Algebraic structures

Algebraic structures are sets of mathematical objects together with operations (i.e. rules on how to combine them), so that the set is closed under those operations and the operations satisfy certain conditions.

## Fields

A _field_ (_Körper_) is a set {{< katex "\mathbb{F}" >}} with two operations {{< katex "+" >}} and {{< katex "\times" >}}, and two distinct elements 0 and 1, such that:
* {{< katex "+" >}} is commutative and associative, has 0 as neutral element, and is invertible for each element of {{< katex "\mathbb{F}" >}}.
* {{< katex "\times" >}} is commutative and associative, has 1 as neutral element, and is invertible for each element of {{< katex "\mathbb{F}" >}} (with the possible exception of 0).
* {{< katex "\times" >}} distributes over {{< katex "+" >}}.

So fields are collections of mathematical objects, for which addition and multiplication are defined and behave in the way we are used to from the real numbers.

{{< katex "\mathbb{Q}" >}}, {{< katex "\mathbb{R}" >}} and {{< katex "\mathbb{C}" >}} with addition and multiplication are fields,
while {{< katex "\mathbb{N}" >}} and {{< katex "\mathbb{Z}" >}} are not (because not all elements have an inverse with respect to multiplication, in {{< katex "\mathbb{N}" >}} not even with respect to addition).

### Galois fields

Example: {{< katex "F_2" >}}

## Groups

Groups capture the notion of symmetry.

## Vector spaces

A _vector space_ (also called _linear space_) is a collection {{< katex "V" >}} of _vectors_ together with two operations: addition ({{< katex "V\times V\to V" >}}) and scalar multiplication ({{< katex "\mathbb{F}\times V\to V" >}} with {{< katex "\mathbb{F}" >}} a field), that satisfy the following conditions:
* Addition is commutative and associative, has a neutral element (the zero vector 0) and is invertible for every vector.
* Scalar multiplication is associative and has a neutral element (the scalar 1).
* Scalar multiplication distributes over addition.

Vectors can be anything we can take linear combinations of (i.e. that we can add and scale by the elements of a field): coordinates or arrows in {{< katex "n" >}}-dimensional space, matrices, functions.
So a vector space is not so much determined not by what the vectors look like, but by what properties they have.

# Linear operations

A map (_Abbildung_) {{< katex "F" >}} between vector spaces is _linear_ if it respects the vector spaces' linear structure,
i.e. if it distributes over addition and scalar multiplication:
* {{< katex "F(ax) = aF(x)" >}}, i.e. scaling the input is the same as scaling the output
* {{< katex "F(x+y) = F(x)+F(y)" >}}, i.e. adding inputs is the same as adding the outputs

This way, linear operations allow one to divide work on complex inputs into work on simpler inputs.

Examples of linear operations:
* The mapping of each derivable function {{< katex "f(x)" >}} to its derivative {{< katex "\frac{df}{dx}" >}} over the vector space of functions from {{< katex "\mathbb{R}^n" >}} to {{< katex "\mathbb{R}^m" >}} with addition and scalar multiplication defined the usual way.

**Note:** There are [two distinct senses of _linear_](https://en.wikipedia.org/wiki/Linear_function). Polynomials of degree {{< katex "\leq 1" >}}, i.e. functions of the form {{< katex "f(x) = ax + b" >}}, are also called linear functions, as their graph is a line. But they're not linear in the above sense, for example {{< katex "f(2x)=2ax+b\neq 2(ax+b)=2f(x)" >}}.

# Applications

## Matrices as transformations on vectors
