---
title: "Ada for the curious"
author: "Christina Unger"
tags: ["ada"]
date: 2024-06-22
toc: true
draft: false
---

This post is for developers who are curious about Ada.

Contrary to some associations you might have (🦕?), Ada is a modern language,
with modules, a strong type system, and easy-to-use concurrency. 
It's blazing fast (🚀!), backed by a cool community, and it's easy to learn.

Instead of giving an extensive introduction to syntax you can easily look up yourself,
I want to highlight some of the aspects that make Ada worth looking into. 

Consider it a teaser that gets you to know Ada enough to decide whether you like it or not,
and provides pointers where to explore further if you do.

Let's skip ["Hello, world!"](https://en.wikibooks.org/wiki/Ada_Programming/Basic#%22Hello,_world!%22_programs) 
and start with a countdown instead:
```
with Ada.Text_IO; use Ada.Text_IO;

procedure Countdown is
begin
   for I in reverse 1 .. 10 loop
      Put_Line (Integer'Image (I));
   end loop;

   Put_Line ("Lift off!");
end Countdown;
```

Ada might look unfamiliar if you grew up with C-family languages,
because its syntax was based on Pascal. But it's a classical procedural language.

So what's special about it?

# What makes Ada different

The development of Ada was originally sponsored by the US Department of Defense, 
when they noticed they spend way too much money on building and fixing embedded systems. 
Since the first version in 1983, the language has developed continuously and far beyond embedded systems,
but the most important point to understand about Ada's origin is:

**Ada was designed specifically for safety-critical software.**

More than anything else, this has shaped who Ada is.

You notice it when looking at the main application areas of Ada: aircrafts, ships, 
railway control, medical devices, defense, space.
But you also notice it as a programmer using Ada.

Ada wants you to produce correct programs. Therefore:

* Ada wants to make it easy for you to properly engineer a solution. 
* Ada wants to make it easy for you to express your intent
  clearly - both towards the compiler and towards your fellow humans.
* Ada wants to make it hard for you to make errors.

**As a consequence, Ada is easy to understand and easy to get right.**

I let you judge yourself. 
For me, personally, Ada feels very different in a subtle way.
And that's because the language is working with you, and not against you.
It gently forces you to design when you code. And it provides safety nets everywhere.

Of course this comes at a cost. 
It means that Ada is not ideal for fast prototyping or for dynamic meta-programming.
Ada was made to write well-designed, solid code, that works well and 
that your colleagues can still read when coming back to it after years.

That's where Ada shines.

But that doesn't mean you can't use it for small fun projects.

If you prefer designing over debugging, I bet you will enjoy Ada.

{{< youtube 3e-BGblAMC4 >}}

# What makes Ada fun

Here are a few characteristics of Ada that many people like about it.
This is subjective, of course, but it gives you a taste of why Ada might be worthwhile exloring.

## Separation of concerns

Like separating header and implementation in C, Ada separates packages into a specification (`.ads`) and a body (`.adb`),
which tends to blend design and code.
This approach is not specific to Ada, of course, but it emphasizes Ada's focus on engineering software: 

> Ada as an engineering tool, requires the software developers to adopt an engineering attitude to using it. It is not enough to simply be a good computer programmer when human safety is at risk. Software at that level of risk must be engineered.

(Richard Riehle: Ada Distilled)

Here is an example. Assume we wanted to implement Conway's Game of Life.
We could start thinking about how to call it from a main procedure:
```ada
-- main.adb
with Game_Of_Life;
use  Game_Of_Life;

procedure Main is
begin

   Init_Board (
      Rows    => 800,
      Columns => 600,
      Pattern => Glider_Collision
   );

   Run;

end Main;
```
This defines what we need in the public part of our package specification:
```ada
-- game_of_life.ads
package Game_Of_Life is

    type Patterns is (
       Ants,
       Blinker,
       Dart,
       Fountain,
       Glider_Collision,
       Herschel_Climber,
       Spaceship
    );
    -- Predefined patterns, taken from the pattern catalogue at playgameoflife.com/lexicon.
    -- Their size is adapted to the board size.

    procedure Init_Board (Rows : Positive, Columns : Positive, Pattern : Patterns);
    -- Creates a game board with the specified number of rows and columns,
    -- and initializes the living cells according to the given start pattern.
    -- TODO: Requires a minimum size to fit the pattern.

    procedure Run;
    -- Runs the simulation.

private
   
    -- Specifications of all private types, functions, and procedures.

end Game_Of_Life;
```
If you have a specification file with proper comments, this can serve as a very helpful 
documentation of a library.
(Check the `.ads` files in [the gnatcoll-core repository](https://github.com/AdaCore/gnatcoll-core/blob/master/core/src/gnatcoll-email-utils.ads) 
for examples.)

Then we mirror the specification in the body, providing the actual implementation of the procedures. 
Doing so would usually inform which private specifications we need in the package specification.
```ada
-- game_of_life.adb
package body Game_Of_Life is

    procedure Init_Board (Rows : Positive, Columns : Positive) is
    begin
       -- Implementation left out.
       null;
    end Init_Board;

    procedure Load_Pattern (Start_Pattern : Pattern) is
    begin
       -- Implementation left out.
       null;
    end Load_Pattern;

    procedure Run is
    begin
       -- Implementation left out.
       null;
    end Run;

end Game_Of_Life;
```

## Simplicity

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

...
building blocks
```
declare
   -- local declarations of constants and variables
   -- (possibly including functions and procedures)
begin
   -- sequence of statements or nested blocks
exception
   -- handling exceptions
end;
```

## The type system

I never thought the answer to what are the cool features of a language would be: its type system.
I also thought I knew strong typing.
Until I met Ada.

Imagine there is an integer type and nobody is using it.

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

0-based? 1-based? Anything-based!

One of the nice features that Ada adopted from Pascal is the fact that array indices can come from any enumerable, bounded type. (The index type can be unbound when declaring the array but needs to be constrained before the array is used.)

So no discussion necessary whether array indices should start with 0 or 1. You define how they start. And whether they use integers at all.

It actually simply means you get arrays and maps in one datatype, which feels very natural once you have it.

```ada
-- When defining an array type, you specify the index type
-- as well as the value type.

type Sensor_Id is range 100 .. 999;
type Sensor_Status is (Active, Inactive);

type Sensors is array (Sensor_Id) of Sensor_Status;

-- When initializing such an array, you can set the values by position,
-- like (Active, Active, Active, Inactive),
-- or by index:
Initial_Status : constant Sensors := (
   101 => Active,
   235 => Active,
   470 => Active,
   999 => Active,
   others => Inactive
);
```

Finally, attributes like `'First`, `'Last`, and `'Range` make it possible to define loops in a way that's hard to get wrong even if you change the underlying index range later.

```ada
for Id in Sensor_Id'First .. Sensor_Id'Last loop
   if Sensors (Id) = Active then
      Sensors (Id) := Inactive;
   end if;
end loop;

-- equivalent to:
for Id in Sensors'Range loop
   -- ...
end loop;
```

## Variant records

## Tasking, or how to do concurrency in an easy way

Since 83, btw.

# The ecosystem and community

The Ada ecosystem can be a bit confusing in the beginning.
But the core is simple:
Ada is a free language. It's an ISO standard and not owned by any company.

There are free and proprietary compilers.
The one you will come across first and most often is called [GNAT](https://gcc.gnu.org/wiki/GNAT), 
a free Ada compiler integrated into GCC. 

Ada has a small but friendly and ... community.

**Forum:**

**Discord:**

**Reddit:**

**Monthly Meetup:** 

# Resources to learn Ada

Similar to this post, David Given has written an overview of Ada features called
[A random walk through Ada](https://cowlark.com/2014-04-27-ada/index.html).

But if you want to get your hands wet instead, there are two entry points
I would recommend.

AdaCore, a driving force behind many current developments in Ada, 
has [a collection of excellent tutorials](https://learn.adacore.com/) for people from different perspectives,
which allow you to play with Ada directly in the browser.
I highly recommend these tutorials as starting point.

The next great entry point, when you want to build and run Ada on your own machine,
is [ada-lang.io](https://ada-lang.io/). 
It provides not only resources but also the package manager Alire,
built by the community exactly for people like you.

Starting can be as easy as:
* Download Alire.
* Select the default toolchain.
* Create a new repository.
* Build and run it.

I provide an Alire project template below in [Enough Ada to do Advent of Code](enough-ada-to-do-advanet-of-code).

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

https://alire.ada.dev/crates.html

If you want, peak at my [code that generates a random Minesweeper board](https://github.com/cunger/100hoursofada/blob/main/minesweeper/src/board/minesweeper-boards-generation.adb).

[Lunar lander simulator](https://github.com/Fabien-Chouteau/eagle-lander)

# A note for C programmers

The most important change when coming from C is that in Ada you don't need pointers.

Seriously. **You do not need pointers.**

Almost everything you want to do, you can do without pointers - and usually more safely so.
Avoid pointers in the beginning; come back to them only later for more advanced stuff.

# Enough Ada to do Advent of Code

## Project template

## Reading input from files

# TODO Move to different resources

## Setting up tests

(It's less easy to set up tests than in other languages. But it's still easier to get the code right.)

AUnit

a less powerful but low-effort way

Setting up e2e tests in Python

## Run Ada in the browser

WASM

## Let SPARK prove you right

The step from code to proof is surprisingly small.

State-of-the-art formal verification.

## Are there jobs in Ada?

You can find some of the companies using Ada when checking [the list of customers of AdaCore](https://www.adacore.com/company/our-customers).
This list is certainly not complete, but the picture is pretty representative. 

Companies range from big names, like Thales, Airbus, and the Automotive Team at NVIDIA,
to start-ups you probably never heard of, like [Latence Tech](https://www.latencetech.com/).

Unfortunately, Ada jobs are often not heavily advertised. Even if you look at open positions at companies that hire Ada programmers, Ada might be mentioned as a nice-to-have experience, but it’s almost never in the job title. 

One good strategy in addition to looking for jobs is to put yourself out there as Ada developer, writing and talking about Ada, so recruiters can find you. 
