---
title: "Ada cookbook"
summary: "Common things to do in Ada"
author: "Christina Unger"
tags: ["ada"]
weight: 1
math: false
toc: true
draft: false
---

# String handling

## Iterating over all characters in a string

```ada
declare
   Str  : constant String := "Fnord";
   Char : Character;
begin
   for I in Str'Range loop
      Char := Str (I);
   end loop;
end;
```

## Matching a regex

```ada
with GNAT.Regpat; use GNAT.Regpat;

declare
   Pattern : constant Pattern_Matcher := Compile ("(\d+)x(\d+)x(\d+)");
   Example : constant String := "10x2x3";
   Matches : Match_Array (0 .. 3);
   Length  : Natural;
   Width   : Natural;
   Height  : Natural;
begin
   Match (Pattern, Line, Matches);
   if Matches (0) /= No_Match then
      Length := Natural'Value (Example (Matches (1).First .. Matches (1).Last));
      Width  := Natural'Value (Example (Matches (2).First .. Matches (2).Last));
      Height := Natural'Value (Example (Matches (3).First .. Matches (3).Last));
   end if;
end;
```

# Files

## Reading input from a file

```ada
with Ada.Text_IO;

procedure Process_Input is
   Input : Ada.Text_IO.File_Type;
begin
   -- Open the input file in read mode.
   Ada.Text_IO.Open (Input, Ada.Text_IO.In_File, "input.txt");

   -- Walk through the file line by line.
   while not Ada.Text_IO.End_Of_File (Input) loop
      declare
         Line : constant String := Ada.Text_IO.Get_Line (Input);
      begin
         -- Do something with Line.
      end;
   end loop;

   -- Finally, close the file again.
   Ada.Text_IO.Close (Input);
end Process_Input;
```