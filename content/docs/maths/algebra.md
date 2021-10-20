---
title: "Algebraische Strukturen"
summary: "Ringe, Gruppen, Körper, Vektorräume."
date: 2021-09-20
weight: 1
math: true
toc: true
draft: false
---

Algebra untersucht die Eigenschaften mathematischer Objekte unter bestimmten Operationen.

Algebraische Strukturen sind Mengen von mathematischen Objekten zusammen mit Verknüpfungen, unter denen die Menge abgeschlossen ist und die bestimmte Bedingungen erfüllen.

# Gruppen

Eine **Gruppe** {{< katex "(M,\ast)" >}} ist eine Menge {{< katex "M" >}} mit einer Verknüpfung {{< katex "\ast" >}}, so dass:
* {{< katex "\ast" >}} assoziativ ist (d.h. {{< katex "a\ast(b\ast c) = (a\ast b)\ast c" >}}),
* es ein neutrales Element {{< katex "e" >}} bezüglich {{< katex "\ast" >}} gibt (d.h. {{< katex "a\ast e=a=e\ast a" >}}),
* jedes {{< katex "a\in M" >}} ein inverses Element {{< katex "a'" >}} besitzt (d.h. {{< katex "a\ast a' = a'\ast a = e" >}}),
  Notation: {{< katex "-a" >}} für additive Verknüpfungen und {{< katex "a^{-1}" >}} für multiplikative Verknüpfungen.

Neutrales Element und inverse Elemente sind eindeutig.

In einer **abelsche Gruppe** ist die Verknüpfung auch kommutativ (d.h. {{< katex "a\ast b = b\ast a" >}}).
Die Verknüpfung wird oft additiv interpretiert für kommutitative Gruppen und multiplikativ für andere.

Beispiele:

* {{< katex "(\mathbb{Z},+)" >}} und {{< katex "n\mathbb{Z} = \{\ldots,-2n,-n,0,n,2n,\ldots\}" >}} als Untergruppe
* {{< katex "(\{1,-1\},\cdot)" >}}
* {{< katex "(\mathbb{Q},+)" >}}
* {{< katex "(\mathbb{R},+)" >}}
* {{< katex "(\mathbb{Q}\backslash\{0\},\cdot)" >}}
* {{< katex "(\mathbb{R}\backslash\{0\},\cdot)" >}}
* Abbildungen mit Komposition, z.B. {{< katex "(\mathbb{R}\times\mathbb{R}\to\mathbb{R},\circ)" >}}

Keine Gruppe:
* {{< katex "(\mathbb{N},+)" >}} (kein neutrales Element, wenn {{< katex "0\notin\mathbb{N}" >}}, und keine inversen Elemente)
* {{< katex "(\mathbb{N},\cdot)" >}} (keine inversen Elemente, außer für 1 und -1)
* {{< katex "(\mathbb{Z},\cdot)" >}}
* {{< katex "(\mathbb{Q},\cdot)" >}}
* {{< katex "(\mathbb{R},\cdot)" >}}

## Symmetrische Gruppen

Ein wichtiges Beispiel für nicht-kommutative Gruppen sind die **symmetrischen Gruppe** {{< katex "(S_n, \circ)" >}}:
die Gruppe aller Permutationen von {{< katex "n" >}} Elementen. Wobei {{< katex "S_n" >}} die Menge der bijektiven Abbildungen auf {{< katex "\{1,\ldots,n\}" >}} ist.

{{< katex "S_n" >}} ist für {{< katex "n\geq 3" >}} nicht abelsch, d.h. {{< katex "\circ" >}} ist in dem Fall nicht für alle Abbildungen kommutativ.

Transpositionen sind Permutationen, die genau zwei Elemente vertauschen.
Jede Permuattion kann als Komposition von Transpositionen dargestellt werden.

# Ringe

Ein **Ring** {{< katex "(M,+,\cdot)" >}} ist eine abelsche Gruppe {{< katex "(M,+)" >}} mit einer weiteren Verknüpfung {{< katex "\cdot" >}}, die
* assoziativ ist (d.h. {{< katex "a\cdot(b\cdot c) = (a\cdot b)\cdot c" >}}),
* distributiv ist über {{< katex "+" >}} (d.h. {{< katex "a\cdot(b+c) = (a\cdot b)+(a\cdot c)" >}}), dass beide Verknüpfungen miteinander verträglich sind,
* aber nicht kommutativ sein muss, nicht zwangsläufig ein neutrales Element bezüglich {{< katex "\cdot" >}} (d.h. ein Einselement) haben muss und bezüglich der Elemente deswegen nicht unbedingt invertierbar sind.

In einem Ring kann es sein, dass es Nullteiler gibt, also von 0 verschiedene Elemente {{< katex "a,b\in M" >}} mit {{< katex "ab=0" >}}.
Ein Ring ohne Nullteiler heißt **Integritätsbereich**.

Beispiele:

* {{< katex "(\mathbb{Z},+,\cdot)" >}}
* Die Menge der Abbildungen mit punktweiser Definition von Addition und Multiplikation.

Die **Einheitengruppe** {{< katex "R^\times" >}} eines Rings {{< katex "R" >}} mit Einselement ist die Menge aller Elemente, die bezüglich {{< katex "\cdot" >}} invertierbar sind. (Zusammen mit {{< katex "\cdot" >}} bildet diese Menge eine Gruppe.) 

## Restklassenringe

Der Restklassenring {{< katex "(\mathbb{Z}/n\mathbb{Z},+,\cdot)" >}} ist die Menge der Reste bei Division durch {{< katex "n" >}}, also {{< katex "\{0,1,\ldots,n-1\}" >}}, wobei die Elemente nicht die natürlichen Zahlen sind, sondern Stellvertreter für die jeweilige Restklasse (z.B. steht {{< katex "1" >}} stellvertretend für alle Zahlen, die bei Division durch {{< katex "n" >}} den Rest 1 lassen). Addition und Multiplikation liefern immer ein Element der Menge, z.B. ist {{< katex "3 + 1 = 0" >}} in {{< katex "\mathbb{Z}/2\mathbb{Z}" >}}.

Ein Element {{< katex "a" >}} ist invertierbar genau dann, wenn {{< katex "\text{ggT}(a,n)=1" >}}.

## Polynomringe

Ein Element ist invertierbar gdw ...

Siehe auch [Polynome](../polynomials).

# Körper

Ein **Körper** {{< katex "(\mathbb{K},+,\cdot)" >}} (_field_) ist eine Menge {{< katex "\mathbb{K}" >}} mit zwei Verknüpfungen {{< katex "+" >}} und {{< katex "\cdot" >}}, und zwei verschiedenen Elementen 0 und 1, so dass:
* {{< katex "+" >}} assoziativ und kommutativ ist,
* 0 das neutrale Element bezüglich {{< katex "+" >}} ist und jedes Element von {{< katex "\mathbb{K}" >}} invertierbar ist (d.h. {{< katex "a+(-a)=0" >}}),
* {{< katex "\cdot" >}} assoziativ und kommutativ ist,  
* 1 das neutrale Element bezüglich {{< katex "\cdot" >}} ist und jedes Element von {{< katex "\mathbb{K}" >}} invertierbar ist (d.h. {{< katex "a\cdot a^{-1}=1" >}}),
* {{< katex "\cdot" >}} distributiv ist über {{< katex "+" >}}.

Beispiele:
* {{< katex "\mathbb{F}_p = (\mathbb{Z}/p\mathbb{Z},+,\cdot)" >}} (mit {{< katex "p" >}} eine Primzahl)
* {{< katex "(\mathbb{Q},+,\cdot)" >}}
* {{< katex "(\mathbb{R},+,\cdot)" >}}
* {{< katex "(\mathbb{C},+,\cdot)" >}} mit {{< katex "\mathbb{C}=\mathbb{R}\times\mathbb{R}" >}} und
  * {{< katex "(a,b)+(c,d) = (a+c,b+d)" >}}
  * {{< katex "(a,b)\cdot(c,d) = (ac-bd,ad+bc)" >}}
  * {{< katex "i = (0,1)" >}}

Keine Körper:
* {{< katex "(\mathbb{N},+,\cdot)" >}} (nicht alle Elemente sind invertierbar)
* {{< katex "(\mathbb{Z},+,\cdot)" >}} (nicht alle Elemente sind bezüglich der Multiplikation invertierbar)

## Galois-Körper

...

# Vektorräume

Ein **Vektorraum** (_vector space_ oder _linear space_) ist im Prinzip ein n-dimensionaler Körper, also {{< katex "(\mathbb{K}^n,+,\cdot)" >}},
wobei Multiplikation keine Verknüpfung von Körperelementen ist, sondern die Skalarmultiplikation (d.h. eine Stauchung/Streckung von Körperelementen).

A _vector space_ (also called _linear space_) is a collection {{< katex "V" >}} of _vectors_ together with two operations: addition ({{< katex "V\times V\to V" >}}) and scalar multiplication ({{< katex "\mathbb{F}\times V\to V" >}} with {{< katex "\mathbb{F}" >}} a field), that satisfy the following conditions:

* Addition is commutative and associative, has a neutral element (the zero vector 0) and is invertible for every vector.
* Scalar multiplication is associative and has a neutral element (the scalar 1).
* Scalar multiplication distributes over addition.

Vectors can be anything we can take linear combinations of (i.e. that we can add and scale by the elements of a field): coordinates or arrows in {{< katex "n" >}}-dimensional space, matrices, functions.
So a vector space is not so much determined not by what the vectors look like, but by what properties they have.

## Skalarprodukt

# Strukturerhaltende Abbildungen

Homomorphismus

Isomporphismus

**Zwischen Grupppen:** {{< katex "F(x\ast y) = F(x)\ast F(y)" >}}
und das neutrale Element der einen muss auf das neutrale Element der anderen abgebildet werden

**Zwischen Vektorräumen:**

A map (_Abbildung_) {{< katex "F" >}} between vector spaces is _linear_ if it respects the vector spaces' linear structure,
i.e. if it distributes over addition and scalar multiplication:

* {{< katex "F(ax) = aF(x)" >}}, i.e. scaling the input is the same as scaling the output
* {{< katex "F(x+y) = F(x)+F(y)" >}}, i.e. adding inputs is the same as adding the outputs

This way, linear operations allow one to divide work on complex inputs into work on simpler inputs.

Examples of linear operations:

* The mapping of each derivable function {{< katex "f(x)" >}} to its derivative {{< katex "\frac{df}{dx}" >}} over the vector space of functions from {{< katex "\mathbb{R}^n" >}} to {{< katex "\mathbb{R}^m" >}} with addition and scalar multiplication defined the usual way.

**Note:** There are [two distinct senses of _linear_](https://en.wikipedia.org/wiki/Linear_function). Polynomials of degree {{< katex "\leq 1" >}}, i.e. functions of the form {{< katex "f(x) = ax + b" >}}, are also called linear functions, as their graph is a line. But they're not linear in the above sense, for example {{< katex "f(2x)=2ax+b\neq 2(ax+b)=2f(x)" >}}.
