---
title: "Rust"
summary: "Coming soon."
date: 2022-01-17
weight: 7
math: false
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

## Variables and constants

Variables are immutable, unless explicitly specified as mutable.

```
let var : i32 = 1;
let var = 1;                   // type is inferred

let mut var = 1;             
let mut str = String::new();   // growable UTF-8 string

const SOME_CONSTANT : i32 = 0; // no type inference for constants
```

**Shadowing** is a trick to re-use a variable name, possibly with a different type.
