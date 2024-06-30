---
title: "Ada for the curious"
author: "Christina Unger"
tags: ["ada"]
date: 2024-06-22
toc: true
draft: true
---

This booklet is for developers who are curious about Ada.

Contrary to some associations you might have (🦕?), Ada is alive and kicking.
It's a modern language, with modules, a strong type system, and easy-to-use concurrency. 
It's blazing fast, backed by a cool community, and it's easy to learn.

Instead of giving an extensive introduction, showing you all the boring stuff that 
you can easily look up yourself,
I want to highlight some of the aspects that make Ada worth looking into,
according to the people who love it.

Consider it a teaser that gets you to know Ada enough to decide whether you like it or not,
as well as an entry point in case you're unsure where to start or where to go to explore further.

If you have suggestions, find errors, or simply want to get in touch, [please reach out]().

# Meet Ada

Ada was designed specifically for safety-critical software, and this has shaped who Ada is.

One of Ada's goals is to enable you to express your intent clearly and unambiguously 
- both towards the compiler and towards your fellow humans.
Many people find Ada very easy to read, and that's because it tries hard to be.
Of course you can write obscure code, but Ada does a pretty good job to meet you half way,
making it more effortless to write ... code than other languages (not looking at any in particular).

Instead of shouting hello to the world, we are starting with a count down to lift-off:
```ada
with Ada.Text_IO; use Ada.Text_IO;

procedure Countdown is
begin
   for I in reverse 1 .. 10 loop
      Put_Line (Integer'Image (I));
   end loop;

   Put_Line ("Lift off! 🚀");
end Countdown;
```

```
10
9
8
7
6
5
4
3
2
1
Lift off! 🚀
```

Ada might look slighlty archane if you grew up with C-family languages,
because it looks like Pascal.
Don't be deceived by this. Ada is more different than you think.
(More on this below, in [Wirth's legacy].)

Another one of Ada's goals is to make it hard for you to make errors.
When C feels like walking through a mine field, Ada feels like having extra safety nets everywhere.

in small things like for you don't fall through in case statements,
and a case statement must contain a case for each value.

and in bigger things like the strong type system.
I thought I knew strong type systems, but Ada's is the moste useful I have seen.
and A LOT of checks you can include (pre, post conditions, etc.)
more on this below

As a result, Ada is not perfect for fast prototyping or for dynamic meta-programming.
Ada was designed for code that has to work. So it was made to allow you to write well-designed,
solid code, that you can still read when coming back to it after a year.
That's where Ada can shine.

But that doesn't mean you cannot use it for hobby projects or playing around, like ... Advent of Code.
I will show you below.
In fact, if you prefer designing over debugging, you might actually enjoy Ada.

## Wirth's legacy

Ada is a classical procedural language with a syntax based on Pascal.

TODO History

building blocks
```ada
declare
   -- local declarations (visible within this unit but nowhere else)
   -- can include constants, variables,functions, procedures
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
It's admittedly one of the smallest but also one of the friendliest and most welcoming
programming language communities I have come across.

Forum:

Discord:

Reddit:

Monthly Meetup: Drop by and say Hi.

## The road to Ada

The Ada ecosystem ...

Ada is a free language. It's an ISO standard and not owned by any company.

There are free and proprietary compilers.
The Ada compiler is called GNAT, a front-end for GCC. (https://gcc.gnu.org/wiki/GNAT)

AdaCore is a driving force behnd many current developments in Ada.
They set up [excellent tutorials](https://learn.adacore.com/) for people from different perspectives,
which allow you to play with Ada directly in the browser.

A great entry point, built by the community exactly for people like you,
is [ada-lang.io](https://ada-lang.io/).
Download Alire,
select a toolchain,
create a repository,
build and run it.

(project template below in ...)

https://www.youtube.com/watch?v=dJ0Pdv1gMzU

Once you want to know the language in more depth, there is no way around 
[Programming in Ada 2012](https://doi.org/10.1017/9781009181358) by John Barnes,
and the [Ada Reference Manual (ARM)](http://ada-auth.org/standards/22rm/html/RM-TOC.html)
(or a [prettier version of it](https://ada-lang.io/docs/arm/)).
Both are very extensive and quite accessible,
but feel free to not worry about them as entry points 
(although people will probably point you to both if you ask for resources).

https://github.com/ohenley/awesome-ada

# Sneak peaks

## Separation of specification and body

and how this blends design and implementation

## Imagine there is an integer type and nobody is using it

Ada offers a few safety nets. One of the nicest is baked into the type system; Richard Riehle calls it precision datatypes.

First, you can derive one type from another. Both types are different, and you will never be able to mix them.
For example, if you define: 
```ada
𝚝𝚢𝚙𝚎 𝙿𝚘𝚞𝚗𝚍_𝚂𝚎𝚌𝚘𝚗𝚍𝚜 𝚒𝚜 𝚗𝚎𝚠 𝙵𝚕𝚘𝚊𝚝;
𝚝𝚢𝚙𝚎 𝙽𝚎𝚠𝚝𝚘𝚗_𝚂𝚎𝚌𝚘𝚗𝚍𝚜 𝚒𝚜 𝚗𝚎𝚠 𝙵𝚕𝚘𝚊𝚝;
```
Then providing `Pound_Seconds` when a function expects `Newton_Seconds`, or taking the sum of both, will not work. You need to explicitely convert one into the other. (I'm sure [the Mars Climate Orbiter]() would have liked this.)

What is even better is that you can define the range that the type should cover. 
For example, we can define temperature like this:
```ada
𝚝𝚢𝚙𝚎 𝚃𝚎𝚖𝚙𝚎𝚛𝚊𝚝𝚞𝚛𝚎_𝙲 𝚒𝚜 𝚗𝚎𝚠 𝙵𝚕𝚘𝚊𝚝 𝚛𝚊𝚗𝚐𝚎 -𝟸𝟽𝟹.𝟷𝟻..𝟹𝟶𝟶_𝟶𝟶𝟶_𝟶𝟶𝟶.𝟶;
𝚝𝚢𝚙𝚎 𝚃𝚎𝚖𝚙𝚎𝚛𝚊𝚝𝚞𝚛𝚎_K 𝚒𝚜 𝚗𝚎𝚠 𝙵𝚕𝚘𝚊𝚝 𝚛𝚊𝚗𝚐𝚎 0..Float'Last;
```
Anything below -𝟸𝟽𝟹.𝟷𝟻 degrees Celcius or 0 Kelvin is not a valid temperature, and it's not something you have to remember to check yourself; Ada checks it for you at compile time and runtime.
(If you are not building a fusion reactor, your accepted range might be much smaller, of course.)

This way of specifying conditions directly in the types allows you to express your intent as clearly and unambiguously as possible.
For example:
```ada
type Latitude  is new Float range 0.0 .. 360.0;
type Longitude is new Float range 0.0 .. 360.0;

type Coordinate is record
   Lat  : Latitude;
   Long : Longitude;
end record;
```
Now you have to work hard to mix up latitude and longitude in your code.

This is helpful even if you don't want to restrict the data range.
Consider the neat trick of declaring floating-point types like this:
```ada
 type Some_Float is new Float range Float'Range;
```
This means your derived type has the same range as `Float`, but excluding anything that is not in its range: NaN, infinity, or whatever non-numeric values your machine defines. So if your code ends up with something that is not a number, numeric operations raise a constraint error instead of propagating the non-numeric value through your whole program.

## Array indices

## Variant records

## How to not get tripped up when coming from Java

Pass by reference or copy.

## How to not get tripped up when coming from C

If you come from C, you are a master of pointers.

It's hard to let go.
But in Ada, you don't need pointers.
Most things you want to do, you can do without pointers (and more safely so). 
[Jeff would even tell you that you never need them for anything ever.]()

## Tasking, or how to do concurrency in an easy way

Since 83, btw.

# High-level vs low-level

# Setting up tests

meh (it's not easy to set up tests. but it's still easier to get the code right.)

AUnit

a less powerful but low-effort way

Setting up e2e tests in Python

# Enough Ada to do Advent of Code

When I did Advent of Code in Ada, what surprised me most

## Project template

## Reading input from files

# Ada code worth reading

Ada is an industrial language used in aerospace, defence, rails, and a couple of other fields.
So most Ada code - and most very well-written, fire proven Ada code is not on GitHub.
(That's also why it doesn't show up in the TIOBE index.)

Still,
...

# Run Ada in the browser

WASM

# Let SPARK prove you right

The step from code to proof is surprisingly small.

state-of-the-art formal verification

# Are there jobs in Ada?

Here are a few companies that use Ada:
Airbus,
NVIDIA,
...


see also https://www.adacore.com/company/our-customers

It's hidden.
Ada jobs are less advertised, and they often mention Ada only as a nice-to-have experience - if at all. 

chicken and egg problem:
Companies don't ... because there are hardly any Ada programmers. And there are hardly any Ada programmers, because there are no jobs.