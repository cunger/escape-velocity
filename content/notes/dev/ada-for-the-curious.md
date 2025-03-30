---
title: "Ada for the curious"
summary: "For developers curious about Ada"
author: "Christina Unger"
tags: ["ada"]
date: 2024-12-01
toc: true
draft: false
weight: 1
---

This post is for developers who are curious about Ada.

Contrary to some associations you might have (🦕?), Ada is a modern language,
with modules, a strong type system, and easy-to-use concurrency. 
It's blazing fast (🚀!), backed by a small but friendly community, and it's easy to learn.

Instead of giving an extensive introduction to syntax you can easily look up yourself,
I want to highlight some of the aspects that make Ada worth looking into. 
Consider it a teaser that gets you to know Ada enough to decide whether you like it or not,
and provides pointers where to explore further if you do.

Let's start with a countdown:
{{< highlight ada >}}
-- countdown.adb

with Ada.Text_IO; use Ada.Text_IO;

procedure Countdown is
begin
   for I in reverse 1 .. 10 loop
      Put_Line (Integer'Image (I));
   end loop;

   Put_Line ("Lift off!");
end Countdown;
{{</ highlight >}}

Ada might look unfamiliar if you grew up with C-family languages,
because its syntax was based on Pascal. But it's a classical procedural language.

So what's special about it?

# What makes Ada different

The development of Ada was originally sponsored by the US Department of Defense, 
when they noticed they spend way too much money on building and fixing embedded systems.
{{< rawhtml >}}
<span class="hover_img">
  <a href="#">(Here's how I imagine it must have started.)<span><img src="/images/blog/ada-1.png" alt="History of Ada" width="600" /></span></a>
</span>
{{< /rawhtml >}}

Since the first version in 1983, the language has developed continuously and far beyond embedded systems,
but the most important point to understand about Ada's origin is that:

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
Ada was made to write well-designed, solid code, that works and 
that can still be read when coming back to it after years.

That's where Ada shines.

But that doesn't mean you can't use it for small fun projects.

If you prefer designing over debugging, I bet you will enjoy Ada.

{{< youtube 3e-BGblAMC4 >}}

# What makes Ada fun

Here are a few characteristics of Ada that many people like about it.
This is subjective, of course, but it gives you a taste of why Ada might be worthwhile exloring.

## The type system

Yes, we start the list of fun features with the type system.
Because one of the nicest safety nets that Ada offers is range restrictions on the type level.

Let's assume you deal with temperature readings.
Instead of using a generic floating-point type and check whether the values you get are in your expected range, 
Ada lets you define a custom type as having floating-point values within a specific range - and the compiler 
and runtime check this range for you.
For example:
```ada
type Temperature_Celcius is digits 9 range -273.15 .. 300_000_000.0;
type Temperature_Kelvin  is digits 9 range 0.0 .. 300_000_000.0;
```
Any values below -𝟸𝟽𝟹.𝟷𝟻 degrees Celcius or 0 Kelvin are not a valid temperature. 
(If you are not building a fusion reactor, your accepted range might be much smaller, of course.)

Or:
```ada
type Latitude  is new Float range 0.0 .. 360.0;
type Longitude is new Float range 0.0 .. 360.0;
```

This is not only incredibly handy, it also makes the range restrictions very clear to anyone working with your code.

Range restrictions in types are, in fact, helpful even if you don't want to restrict the data range.
Consider the following neat trick. You can declaring a custom floating-point type like this:
```ada
type Some_Float is new Float range Float'Range;
```
This means your derived type has the same range as `Float`, but excluding anything that is not in its range: NaN, infinity, or whatever non-numeric values your machine defines. So if your code ends up with something that is not a number, numeric operations raise a constraint error instead of propagating the non-numeric value through your whole program.

## Array indices

One of the good ideas that Ada adopted from Pascal is the fact that array indices can come from any enumerable, bounded type.
So it doesn't matter whether you believe array indices should start with 0 or 1. You define how they start. And whether they use integers at all.

It actually means you get arrays and maps in one datatype, which feels very natural once you have it.
When defining an array type, you simply specify the index type as well as the value type.

Here is an example where we use integers within a specific range as index:
```ada
type Position is range 100 .. 999;
type State is (Open, Closed, Unknown);

type Valves is array (Position) of State;

Example : Valves := (
   100    => Open,
   101    => Open,
   102    => Closed,
   103    => Open,
   others => Unknown
);
```

Attributes like `'First`, `'Last`, and `'Range` make it possible to define loops in a way that's hard to get wrong even if you change the underlying index range later.

```ada
for Pos in Position'First .. Position'Last loop
   ...
end loop;

-- This is equivalent to:
for Pos in Positions'Range loop
   ...
end loop;
```

Most importantly, arrays are memory-safe. The index type and range is part of the array, and both compiler and runtie check that all reads and writesare within the bounds of the array.

## Separation of concerns

Like separating header and implementation in C, Ada separates packages into a specification (`.ads`) and a body (`.adb`),
which tends to blend design and code.
This approach is not specific to Ada, of course, but it emphasizes Ada's focus on engineering software.
Richard Riehle put it like this:

> Ada as an engineering tool, requires the software developers to adopt an engineering attitude to using it. It is not enough to simply be a good computer programmer when human safety is at risk. Software at that level of risk must be engineered.

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
He wanted to design a language that is as simple as possible without losing power. 

In Ada, you see some of this legacy. One example are exceptions.

In Ada, exceptions are like objects, not types. You define an exception like this:
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
That's it. For basic exceptions, this is arguably all you need. (With the exception of an error hierarchy maybe.)

## Safe real-time programming

Concurrent and real-time programming are standard parts of Ada since its beginning.
Their semantics is the same independent of whether you execute them on Linux, an RTOS, or on a bare metal target.
And it's as deterministic and safe as you can get. [Read more about it.](https://blog.adacore.com/theres-a-mini-rtos-in-my-language)

# The ecosystem and community

The Ada ecosystem can be a bit confusing in the beginning.
But the core is simple:
Ada is a free language. It's an ISO standard and not owned by any company.

There are free and proprietary compilers.
The one you will come across first and most often is called [GNAT](https://gcc.gnu.org/wiki/GNAT), 
a free Ada compiler integrated into GCC. 

Ada has a small but friendly and welcoming community.

**Forum:** https://forum.ada-lang.io/

**Discord:** https://discord.gg/edM2czVKN4

**Reddit:** https://www.reddit.com/r/ada 

There is also a **monthly meetup**, usually at the beginning of each month, which is accounced in the forum and on Discord. 

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

Once you want to know the language in more depth, there is no way around 
[Programming in Ada 2012](https://doi.org/10.1017/9781009181358) by John Barnes,
and the [Ada Reference Manual (ARM)](http://ada-auth.org/standards/22rm/html/RM-TOC.html)
(or a [prettier version of it on ada-lang.io](https://ada-lang.io/docs/arm/)).
Both are very extensive and quite accessible,
but feel free to not worry about them in the beginning - even though people will probably point you 
to both if you ask for pointers.

To explore the rest of the iceberg, [Awesome Ada](https://github.com/ohenley/awesome-ada)
provides a pretty comprehensive list of resources.

If you want to dive into existing Ada code bases, here are a few suggestions:

* [John Perry (AoC 2023)](https://github.com/johnperry-math/AoC2023/blob/2df768bacb3c7f5c0ee23a495c3b5fe0c7464284/More_Detailed_Comparison.md) 
did many Advent of Code puzzles in both Ada and Rust, and wrote a detailed comparison.
* [GNATcoll](https://github.com/AdaCore/gnatcoll-core/tree/master/core/src) is a collection of components, like for working with JSON data or file systems in Ada. It's clean and well-documented code.
* The [Apollo 11 lunar lander simulator](https://github.com/Fabien-Chouteau/eagle-lander) is equally well organized and fun to read.
* [AdaChess](https://github.com/adachess/AdaChess/tree/main) is a chess engine written in Ada.
* Jeffrey Carter implements [binary trees without access types](https://github.com/jrcarter/Binary_Trees),
  to demonstrate how you can do without pointers even in cases whether you would tend to grab for them.
* A lot more in [the list of Ada crates](https://alire.ada.dev/crates.html).

For a still small but growing collection of notes on how to do what in Ada, see my [Ada cookbook](../../notes/dev/ada-cookbook/).

## Are there jobs in Ada?

You can find some of the companies using Ada when checking [the list of customers of AdaCore](https://www.adacore.com/company/our-customers).
This list is certainly not complete, but the picture is pretty representative. 

Companies range from big names, like Thales, Airbus, and the Automotive Team at NVIDIA,
to start-ups you probably never heard of, like [Latence Tech](https://www.latencetech.com/).

Unfortunately, Ada jobs are often not heavily advertised. Even if you look at open positions at companies that hire Ada programmers, Ada might be mentioned as a nice-to-have experience, but it’s almost never in the job title.
