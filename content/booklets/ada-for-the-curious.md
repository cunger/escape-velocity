---
title: "Ada for the curious"
author: "Christina Unger"
tags: ["ada"]
date: 2024-06-22
toc: true
draft: false
---

This booklet is for developers who are curious about Ada.

Contrary to some 🦕 associations you might have, Ada is a modern language,
with modules, a strong type system, and easy-to-use concurrency. 
It's blazing fast, backed by a cool community, and it's easy to learn.

Instead of giving an extensive introduction to everything you can easily look up yourself,
I want to highlight some of the aspects that make Ada worth looking into. 

Consider it a teaser that gets you to know Ada enough to decide whether you like it or not,
and provides pointers where to explore further.

# Meet Ada

Ada was designed specifically for safety-critical software, and this has shaped who Ada is.
Especially in two ways.

**Ada enables you to express your intent clearly and unambiguously - both towards the compiler and towards your fellow humans.**

Many people find Ada very easy to read, and that's because it tries hard to be.
Of course you can still write obscure code, but Ada does a pretty good job to meet you half way.

Let's start with a countdown:
```
with Ada.Text_IO; use Ada.Text_IO;

procedure Countdown is
begin
   for I in reverse 1 .. 10 loop
      Put_Line (Integer'Image (I));
   end loop;

   Put_Line ("Lift off! 🚀");
end Countdown;
```

Ada might look slighlty archane if you grew up with C-family languages,
because it looks like Pascal.
(More on this below, in [Wirth's legacy](#wirths-legacy).)
Don't be deceived by this. 

**Ada wants to make it hard for you to make errors.**

When C feels like walking through a mine field, Ada feels like having extra safety nets everywhere.

It does this in a lot of small things. For example, you cannot re-assign loop variables,
a case statement must contain a case for each value, and you don't fall through to the next one.

And it does this in bigger things, most notably in its strong type system
and all the compile- and run-time checks you can include.
More on both below.

As a result, Ada is not ideal for fast prototyping or for dynamic meta-programming.
Ada was designed for code that absolutely has to work. So it was made to allow you to write well-designed,
solid code, that you can still read when coming back to it after a year.
That's where Ada shines.

But that doesn't mean you cannot use it for hobby projects or during Advent of Code.
If you prefer designing over debugging, I bet you will enjoy Ada.

## Wirth's legacy

Ada is a classical procedural language with a syntax based on Pascal.

TODO History

building blocks
```
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

There is [a very nice interview](https://inf.ethz.ch/news-and-events/spotlights/infk-news-channel/2021/11/niklaus-wirth-video-interview.html) 
with Niklaus Wirth (the Swiss computer scientist who invented Pascal),
where he remembers that during his time, all existing programming languages were unneccessarily complex.
He wanted to design a language that is as simple as possible, of course without losing power. 

In Ada, you see some of this legacy.
For example, you define an exception like this:
```
Timestamp_Is_In_The_Past : exception;
```
You raise it like this: 
```
raise Timestamp_Is_In_The_Past;
```
Or, if you want to include more information, like this: 
```
raise Timestamp_Is_In_The_Past with "Input timestamp cannot be in the past";
```
That's it. For basic exceptions, this is arguably all you need. 

## The community

That Ada is alive and kicking is most obvious when you get to know the community.
It's admittedly one of the smallest but also one of the friendliest and most welcoming
programming language communities I have come across.

**Forum:**

**Discord:**

**Reddit:**

**Monthly Meetup:** 

## The road to Ada

The Ada ecosystem can be a bit confusing in the beginning.
But the core is simple:
Ada is a free language. It's an ISO standard and not owned by any company.

There are free and proprietary compilers.
The one you will come across first and most often is called [GNAT](https://gcc.gnu.org/wiki/GNAT), 
a free Ada compiler integrated into GCC. 

AdaCore is a driving force behind many current developments in Ada.
They have [a collection of excellent tutorials](https://learn.adacore.com/) for people from different perspectives,
which allow you to play with Ada directly in the browser.
I highly recommend them as starting point.

The next great entry point, when you want to build and run Ada on your own machine,
is [ada-lang.io](https://ada-lang.io/). 
It provides not only resources but also the package manager Alire,
built by the community exactly for people like you.
Starting can be as easy as:
* Download Alire.
* Select the default toolchain.
* Create a new repository.
* Build and run it.

I provide a project template below in [Enough Ada to do Advent of Code](enough-ada-to-do-advanet-of-code).

Once you want to know the language in more depth, there is no way around 
[Programming in Ada 2012](https://doi.org/10.1017/9781009181358) by John Barnes,
and the [Ada Reference Manual (ARM)](http://ada-auth.org/standards/22rm/html/RM-TOC.html)
(or a [prettier version of it](https://ada-lang.io/docs/arm/)).
Both are very extensive and quite accessible,
but feel free to not worry about them in the beginning - even though people will probably point you 
to both if you ask for pointers.

If you want to explore the rest of the iceberg, [Awesome Ada](https://github.com/ohenley/awesome-ada)
provides a pretty comprehensive list of resources.

## Ada code worth reading

Ada is an industrial language used in aerospace, defence, rails, medicine, and a couple of other fields.
So most Ada code - especially most well-written, fire-proven Ada code - is not on GitHub.
(That's also why Ada doesn't show up in the TIOBE index.)

Still, here are a few repositories worth exploring if you want to get a feeling
for bigger Ada projects.

...

# Sneak peaks

## Separation of specification and body

and how this blends design and implementation

## Imagine there is an integer type and nobody is using it

Ada offers a few safety nets. One of the nicest is baked into the type system; Richard Riehle calls it precision datatypes.

First, you can derive one type from another. Both types are different, and you will never be able to mix them.
For example, if you define: 
```
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
```
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
```
 type Some_Float is new Float range Float'Range;
```
This means your derived type has the same range as `Float`, but excluding anything that is not in its range: NaN, infinity, or whatever non-numeric values your machine defines. So if your code ends up with something that is not a number, numeric operations raise a constraint error instead of propagating the non-numeric value through your whole program.

## Array indices

## Variant records

## What you want to know when coming from Java

Pass by reference or copy.

## What you want to know when coming from C

It might be hard to let go, but in Ada you don't need pointers.

Seriously. 
Almost everything you want to do, you can do without pointers - and usually more safely so.
([Jeff would even tell you that you never need them for anything ever.]())

## Tasking, or how to do concurrency in an easy way

Since 83, btw.

# High-level vs low-level

# Enough Ada to do Advent of Code

## Project template

## Reading input from files

# Setting up tests

(It's less easy to set up tests than in other languages. But it's still easier to get the code right.)

AUnit

a less powerful but low-effort way

Setting up e2e tests in Python

# Run Ada in the browser

WASM

# Let SPARK prove you right

The step from code to proof is surprisingly small.

State-of-the-art formal verification.

# Are there jobs in Ada?

You can find some of the companies using Ada when checking [the list of customers of AdaCore](https://www.adacore.com/company/our-customers).
This list is certainly not complete, but the picture is pretty representative. 

Companies range from big names, like Thales, Airbus, and the Automotive Team at NVIDIA,
to start-ups you probably never heard of, like [Latence Tech](https://www.latencetech.com/).

Unfortunately, Ada jobs are often not heavily advertised. Even if you look at open positions at companies that hire Ada programmers, Ada might be mentioned as a nice-to-have experience, but it’s almost never in the job title. 

One good strategy in addition to looking for jobs is to put yourself out there as Ada developer, writing and talking about Ada, so recruiters can find you. 
