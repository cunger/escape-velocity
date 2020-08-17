---
title: "Numbers"
summary: "And arithmetics."
date: 2020-01-10
weight: 1
math: true
toc: true
---

# Bits and byte ranges

The smallest unit of information are the bits (_binary digits_) 1 and 0.

Most computers don't access individual bits in memory, but use blocks of 8 bits (_bytes_) as smallest addressable unit of memory.

**Byte ranges:**

* In binary notation: from `00000000` to `11111111`
* In decimal notation: from `0` to `255` (there are `2^8 = 256` combinations of eight `0`s and `1`s)
* In hexadecimal notation: from `00` to `FF`

```
Hex 0    1    2    3    4    5    6    7    8    9    A    B    C    D    E    F
Dec 0    1    2    3    4    5    6    7    8    9    10   11   12   13   14   15
Bin 0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
```

Bytes are combined into _words_ of 1 to 8 bytes. Most common architectures today use 32 or 64 bits in groups of 4 and 8 bytes, respectively, for addressing memory.

# Integers

Integers are represented using a series of bits, i.e. in a base-2 system.

For example:
```
8    4    2    1     =
2^3  2^2  2^1  2^0
0    0    0    0     0
0    0    0    1     1
0    0    1    0     2
0    0    1    1     3
0    1    0    0     4
0    1    0    1     5
0    1    1    0     6
0    1    1    1     7
1    0    0    0     8
1    0    0    1     9
1    0    1    0    10
1    0    1    1    11
1    1    0    0    12
1    1    0    1    13
1    1    1    0    14
1    1    1    1    15
```

If integers are represented using 4 bytes (32 bits), then the range of integers that can be represented is {{< katex "0\ldots 2^{32}-1 = 0\ldots 4\,294\,967\,295" >}}. Including negative numbers, the range is {{< katex "-2^{31}\ldots 2^{31}-1 = -2\,147\,483\,648\ldots 2\,147\,483\,647" >}} (because {{< katex "2^{32} / 2 = 2^{31}" >}}).

Negative numbers can be included in several ways:

* _Sign and magnitude_: The left-most bit represents the sign and the rest denotes the number.
* _One's complement_: A negative number is the result of applying bitwise NOT to its positive counterpart.
* _Two's complement_: Extension of one's complement that avoids two representations for 0 and the need for end-around carry. Used on most computing devices today.
* _Base -2_, which gives alternating signs (because {{< katex "(-2)^0=1" >}}, {{< katex "(-2)^1=-2" >}}, {{< katex "(-2)^2=4" >}}, and so on).

# Real numbers

Real numbers are stored as floating-point representations (of which scientific notation is on example):

{{< katex display="z = m \times b^k" >}}

Where:
* {{< katex "b\in\N" >}} the base (where 10 is usually used by humans and 2 by computers)
* {{< katex "m\in\mathbb{R}_+: 1\leq m \lt b" >}} the mantissa (signed; the normalization condition makes the representation unique)
* {{< katex "k\in\Z" >}} the exponent (signed; expresses the order of magnitude)

For example, {{< katex "1.9 \times 10^3 = 1900" >}} and {{< katex "-1.9 \times 10^{-3} = -0.0019" >}}.

## Advantages

* It can represent numbers at very different magnitudes.
* It provides the same relative accuracy at all magnitudes.
* It allows for calculations across magnitudes.

## Storage

Floating-point representations are stored in 32 or 64 bits.

|                  | Bits | Bits for {{< katex "m" >}} | Bits for {{< katex "k" >}} | Range (approximately) |
| ---------------- | ---------- | -------------------- | ------------- | ----- |
| Single precision | 32         | 24 (23 + 1 for sign) | 8             | {{< katex "1.2 \times 10^{-38} \ldots 3.4 \times 10^{38}" >}} |
| Double precision | 64         | 53 (52 + 1 for sign) | 11            | {{< katex "2.2 \times 10^{-308} \ldots 1.8 \times 10^{308}" >}}
 |

Since the base is 2, the mantissa is always of form 1.x, so the leading 1 does not need to be stored.

## Rounding errors
