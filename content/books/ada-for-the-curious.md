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
Of course you can write obscure code, but Ada does a pretty good job to meet you half way,
making it more effortless to write ... code than other languages (not looking at any in particular).

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

But it's neither dead nor (eingestaubt). The latest version is from 2022,
and it's a pretty modern language,
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

https://github.com/ohenley/awesome-ada

# Gems

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
𝚝𝚢𝚙𝚎 𝚃𝚎𝚖𝚙𝚎𝚛𝚊𝚝𝚞𝚛𝚎_𝙲𝚎𝚕𝚌𝚒𝚞𝚜 𝚒𝚜 𝚗𝚎𝚠 𝙵𝚕𝚘𝚊𝚝 𝚛𝚊𝚗𝚐𝚎 -𝟸𝟽𝟹.𝟷𝟻..𝟹𝟶𝟶_𝟶𝟶𝟶_𝟶𝟶𝟶.𝟶;
```
Anything below -𝟸𝟽𝟹.𝟷𝟻 is not a valid temperature, and it's not something you have to remember to check yourself; Ada checks it for you at compile time and runtime.
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

## How to not get tripped up when coming from Java

### Pass by reference or copy? 

# Setting up tests

meh (it's not easy to set up tests. but it's still easier to get the code right.)

AUnit

a less powerful but low-effort way

Setting up e2e tests in Python

# Enough Ada to do Advent of Code

## Project template

## Reading input from files

# Let SPARK prove you right

The step from code to proof is surprisingly small.

# Run Ada in the browser

WASM
