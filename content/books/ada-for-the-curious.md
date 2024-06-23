---
title: "Ada for the curious"
author: "Christina Unger"
tags: ["ada"]
date: 2024-06-22
toc: true
draft: true
---

This booklet is for seasoned developers who are curious about Ada.

I want to highlight some of the aspects of Ada that are different from other languages
and that make Ada worth looking into. Consider it a teaser that gets you to know Ada
enough to decide whether you like it or not, with pointers in case you want to
explore the language further.

It is not an extensive introduction to Ada. In [The road to Ada]() below,
I will point to better resources for that.

If you have suggestions, find errors, or disagree, please [get in touch]().

And if you like it, consider buying me a coffee.
(I write early in the morning, so coffee will have a real effect on speed.)

{{< buymeacoffee >}}

# Meet Ada

Ada was designed specifically for safety-critical software, and this has shaped who Ada is.

One of Ada's goals is to enable you to express your intent clearly and unambiguously 
- both towards the compiler and towards your fellow humans.
Many people find Ada very easy to read, and that's because it tries hard to be.
Of course you can write obscure code, but Ada does a pretty good job to meet you half way.

(In my experience, writing clear code feels more effortless in Ada than in most other languages.)

TODO code example
```ada
...
```

Another one of Ada's goals is to not trip you up.
When C feels like walking through a mine field, Ada feels like having extra safety nets everywhere.

for example:
* you don't fall through in case statements

## Wirth's legacy

Ada might look slighlty archane if you grew up with C-family languages. 🦕

But it's neither dead nor ... The latest version is from 2022, and it's a pretty modern language,
with X, Y, concurrency and all shit you want to have.

It just looks like Pascal.

```ada
declare
   -- local declarations (visible within this unit but nowhere else)
   -- can include functions, procedures, and variables
   -- note that declared variables are not initialized by default
begin
   -- sequence of statements or nested blocks
exception
   -- handling exceptions
end;
```

There is [a very nice interview]() with Niklaus Wirth (the Swiss computer scientist who invented Pascal),
where he points out that during his time, all existing programming languages were unneccessarily complex.
He wanted to design a language that is as powerful but also as simple as possible. 

... In Ada, you see some of this legacy.
example: 
defining an exception `All_Is_Not_Fine : exception;`
raising an exception: ` raise All_Is_Not_Fine;` 
or `raise All_Is_Not_Fine with "Ooops";`
For basic exception ..., this is arguably all you need. 

## The community

That Ada is alive and kicking is most obvious when you get to know the community.
It's admittedly one of the smallest, but also one of the friendliest and most welcoming
programming language communities I have come across.

Forum:

Discord:

Reddit:

## The road to Ada

The Ada ecosystem ...

Alire
(project template below in ...)

AdaCore

John Barnes

# Imagine there is an integer type and nobody is using it

# Array indices

# How to not get tripped up when coming from Java

## Pass by reference or copy? 

# Setting up tests

meh (it's not easy to set up tests. but it's still easier to get the code right.)

AUnit

a less powerful but low-effort way

Setting up e2e tests in Python

# Enough Ada to do Advent of Code

## Project template

## Reading input from files

# Let SPARK prove you right

the step from code to proof is really small

pre- and post-conditions

# Run Ada in the browser

WASM
