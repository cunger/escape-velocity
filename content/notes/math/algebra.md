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
Jede Permutation kann als Komposition von Transpositionen dargestellt werden.

# Ringe

Ein **Ring** {{< katex "(M,+,\cdot)" >}} ist eine abelsche Gruppe {{< katex "(M,+)" >}} mit einer weiteren Verknüpfung {{< katex "\cdot" >}}, die
* assoziativ ist (d.h. {{< katex "a\cdot(b\cdot c) = (a\cdot b)\cdot c" >}}),
* distributiv ist über {{< katex "+" >}} (d.h. {{< katex "a\cdot(b+c) = (a\cdot b)+(a\cdot c)" >}}), dass beide Verknüpfungen miteinander verträglich sind,
* aber nicht kommutativ sein muss, nicht zwangsläufig ein neutrales Element bezüglich {{< katex "\cdot" >}} (d.h. ein Einselement) haben muss und bezüglich der Elemente deswegen nicht unbedingt invertierbar sind.

Beispiele:

* {{< katex "(\mathbb{Z},+,\cdot)" >}}
* Die Menge der Abbildungen mit punktweiser Definition von Addition und Multiplikation.

Die **Einheitengruppe** {{< katex "R^\times" >}} eines Rings {{< katex "R" >}} mit Einselement ist die Menge aller Elemente, die bezüglich {{< katex "\cdot" >}} invertierbar sind. (Zusammen mit {{< katex "\cdot" >}} bildet diese Menge eine Gruppe.)

In einem Ring kann es sein, dass es Nullteiler gibt, also von 0 verschiedene Elemente {{< katex "a,b\in M" >}} mit {{< katex "ab=0" >}}.

Ein kommutativer Ring mit Einselement, aber ohne Nullteiler, heißt **Integritätsbereich** oder **Integritätsring**. Zum Beispiel: {{< katex "\mathbb{Z}" >}} und jeder Körper.

## Restklassenringe

Der Restklassenring {{< katex "(\mathbb{Z}/n\mathbb{Z},+,\cdot)" >}} ist die Menge der Reste bei Division durch {{< katex "n" >}}, also {{< katex "\{0,1,\ldots,n-1\}" >}}, wobei die Elemente {{< katex "k" >}} nicht die natürlichen Zahlen sind, sondern Stellvertreter für die jeweilige Restklasse {{< katex "k+n\mathbb{Z}" >}} (z.B. steht {{< katex "1" >}} stellvertretend für alle Zahlen, die bei Division durch {{< katex "n" >}} den Rest 1 lassen). Addition und Multiplikation liefern immer ein Element der Menge, z.B. ist {{< katex "3 + 1 = 0" >}} in {{< katex "\mathbb{Z}/2\mathbb{Z}" >}}.

Ein Element {{< katex "a" >}} ist invertierbar genau dann, wenn {{< katex "\text{ggT}(a,n)=1" >}}.

Für jede natürliche Zahl {{< katex "n" >}} ist {{< katex "(\mathbb{Z}/n\mathbb{Z},+,\cdot)" >}} ein kommutativer Ring mit Einselement.
* Das Nullelement ist {{< katex "0=n\mathbb{Z}" >}}.
* Das Einselement ist {{< katex "1=1+n\mathbb{Z}" >}}.

Ist {{< katex "n" >}} eine Primzahl, ist der Restklassenring ein endlicher Körper.
Ist {{< katex "n" >}} keine Primzahl, ist er kein Körper (denn er hat von Null verschiedene Nullteiler, z.B. 2 in {{< katex "(\mathbb{Z}/4\mathbb{Z},+,\cdot)" >}}, denn {{< katex "2\cdot 2 = 0" >}}).

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

Das heißt: {{< katex "(\mathbb{K},+)" >}} und {{< katex "(\mathbb{K}\backslash\{0\},\cdot)" >}} sind abelsche Gruppen.

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

Ein **Vektorraum** {{< katex "(V,+,\cdot)" >}} (_vector space_ oder _linear space_) über dem Körper {{< katex "\mathbb{K}" >}} ist eine Menge {{< katex "V" >}} von Vektoren zusammen mit zwei Operationen: Addition ({{< katex "V\times V\to V" >}}) und Skalarmultiplikation ({{< katex "\mathbb{K}\times V\to V" >}}), die die folgenden Axiome erfüllen.

* Addition ist kommutativ und assoziativ, hat ein neutrales Element (den Nullvektor 0) und jeder Vektor ist bezüglich Addition invertierbar.
* Skalarmultiplikation ist assoziativ und hat ein neutrales Element (den Skalar 1).
* Skalarmultiplikation distribuiert über Addition.

Wir verbinden also eine abelsche Gruppe {{< katex "(V,+)" >}} mit einem Körper {{< katex "\mathbb{K}" >}}, dessen Multiplikation kompatibel mit der Addition in {{< katex "V" >}} ist.

**Vektoren** sind die Elemente eines Vektorraums, sie können also alles sein, solange Addition und Skalarmultiplikation so definiert sind, dass sie die obigen Axiome erfüllen: Koordinaten im n-dimensionalen Raum ({{< katex "\mathbb{R}^n" >}} oder {{< katex "\mathbb{C}^n" >}}, hier ist der Vektorraum im Prinzip ein n-dimensionaler Körper, wobei die Multiplikation keine Verknüpfung von Körperelementen ist, sondern deren Stauchung oder Streckung), Matrizen, Funktionen.
Entscheidend ist nicht so sehr die Form von Vektoren, sondern ihre Eigenschaften.
Der Gedanke hinter dem Begriff des linearen Raums ist, dass Vektoren all das sind, wovon man Linearkombinationen bilden kann.

## Skalarprodukt

Das Skalarprodukt (_dot product_ oder _inner product_) bildet zwei Vektoren auf ein Skalar ab, das so etwas wie ... ausdrückt.

Ein Vektorraum mit einem Skalarprodukt heißt **Prähilbertraum**.

# Strukturerhaltende Abbildungen

Homomorphismus

Isomporphismus + Endomorphismus

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

## Bilinearformen

Linearität in beiden Komponenten
