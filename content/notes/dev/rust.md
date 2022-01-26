---
title: "Rust"
summary: "Coming soon."
date: 2022-01-17
weight: 7
math: true
toc: true
draft: true
---

### Comments

```
// Comment

/// Documentation comment
/// (can include Markdown)
```

### Cargo

```
cargo new project-name  // creates new project,
                        // including git init

cargo build             // compiles project and creates an executable:
                        // target/debug/project-name

cargo build --release   // compiles project with optimization and creates an executable:
                        // target/release/project-name

cargo check             // = cargo build, but without executable
                        // (for quick check, whether the code compiles)

cargo run               // = cargo build and run executable

cargo update            // automatically updating creates and regenerating Cargo.lock
```

# Types

Rust is statically typed.

* Signed integers `i8`, `i16`, `i32` (default), `i64`, `i128` (for size {{< katex "n" >}}, the type can store integers from {{< katex "-(2^{n-1})" >}} to {{< katex "2^{n-1}-1" >}}, e.g. `i32`, stores integers from {{< katex "-2^{31}" >}} to {{< katex "2^{31}-1" >}})
* Unsigned integers `u8`, `u16`, `u32`, `u64`, `u128` (for size {{< katex "n" >}}, the type can store integers from {{< katex "0" >}} to {{< katex "2^n - 1" >}})
* Floating-point numbers: `f32` (single precision), `f64` (double precision, default)
* Boolean: `bool` (with values `true` and `false`)
* Unicode character: `char`

Integer division `/`

# Expressions and statements

Expressions evaluate to a value, statements do not.

A block is an expression that consists of a list of statements, possibly followed by one expression.
For example:
```
let y = {
  let x = 0;
  x + 1
};
// y is 1
```

## Variables and constants

Variables are immutable, unless explicitly specified as mutable.

```
let one: i32 = 1;
let one_million = 1_000_000;   // type is inferred

let mut var = 1;             
let mut str = String::new();   // growable UTF-8 string

const SOME_CONSTANT: i32 = 0; // no type inference for constants
```

**Shadowing** is a trick to re-use a variable name, possibly with a different type.

## Tuples, arrays, vectors

## Pattern matching and destructuring

# Functions

A return value is given by either a `return` statement or if the last line of the function body is an expression (without a semicolon, otherwise it would be a statement!).
A function without a return value implicitly returns the empty tuple `()`.

```
// Entry point of the program
fn main() {
  say_hello_to("world");
}

fn say_hello_to(x: &str) {
  println!("Hello {}!", x);
  println!("Yours, {}", signature());
}

fn signature() -> char {
  '😬'  // Important: If this line ends with a semicolon, it is a statement, not a return value!
}
```

# Control flow

```
if <boolean condition> {

} else if <boolean condition> {

} else {

}

let number = if <condition> { 1 } else { 2 };
```

* `break;`
* `break <expression>`;
* `break 'loop-name`;

```
'counting_up: loop {
  loop {
    // ...
    break 'counting_up;
  }

  break;
}

let mut counter = 0;
let result = loop {
  counter += 1;

  if counter > 10 {
    break counter;
  }
}
```

```
let xs = [1, 2, 3, 4, 5];
for x in xs {
  // ...
}

for number in (1..10) {
  // ...
}
```
