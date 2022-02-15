---
title: "Algebraische Strukturen"
summary: "Ringe, Gruppen, Körper, Vektorräume. Und Abbildungen zwischen diesen."
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
* {{< katex "\mathbb{F}_p = (\mathbb{Z}/p\mathbb{Z},+,\cdot)" >}} (mit {{< katex "p" >}} eine Primzahl, auch: **Galoiskörper**)
* {{< katex "(\mathbb{Q},+,\cdot)" >}}
* {{< katex "(\mathbb{R},+,\cdot)" >}}
* {{< katex "(\mathbb{C},+,\cdot)" >}} mit {{< katex "\mathbb{C}=\mathbb{R}^2" >}} und
  * {{< katex "(a,b)+(c,d) = (a+c,b+d)" >}}
  * {{< katex "(a,b)\cdot(c,d) = (ac-bd,ad+bc)" >}}
  * {{< katex "i = (0,1)" >}}
  * {{< katex "1 = (1,0)" >}}

Keine Körper:
* {{< katex "(\mathbb{N},+,\cdot)" >}} (nicht alle Elemente sind invertierbar)
* {{< katex "(\mathbb{Z},+,\cdot)" >}} (nicht alle Elemente sind bezüglich der Multiplikation invertierbar)

# Vektorräume

Ein **Vektorraum** {{< katex "(V,+,\cdot)" >}} (_vector space_ oder _linear space_) über dem Körper {{< katex "\mathbb{K}" >}} ist eine Menge {{< katex "V" >}} von Vektoren zusammen mit zwei Operationen: Addition ({{< katex "V\times V\to V" >}}) und Skalarmultiplikation ({{< katex "\mathbb{K}\times V\to V" >}}), die die folgenden Axiome erfüllen.

* Addition ist kommutativ und assoziativ, hat ein neutrales Element (den Nullvektor 0) und jeder Vektor ist bezüglich Addition invertierbar.
* Skalarmultiplikation ist assoziativ und hat ein neutrales Element (den Skalar 1).
* Skalarmultiplikation distribuiert über Addition.

Wir verbinden also eine abelsche Gruppe {{< katex "(V,+)" >}} mit einem Körper {{< katex "\mathbb{K}" >}}, dessen Multiplikation kompatibel mit der Addition in {{< katex "V" >}} ist.

**Vektoren** sind die Elemente eines Vektorraums, sie können also alles sein, solange Addition und Skalarmultiplikation so definiert sind, dass sie die obigen Axiome erfüllen: Koordinaten im n-dimensionalen Raum ({{< katex "\mathbb{R}^n" >}} oder {{< katex "\mathbb{C}^n" >}}, hier ist der Vektorraum im Prinzip ein n-dimensionaler Körper, wobei die Multiplikation keine Verknüpfung von Körperelementen ist, sondern deren Stauchung oder Streckung), Matrizen, Funktionen.
Entscheidend ist nicht so sehr die Form von Vektoren, sondern ihre Eigenschaften.
Der Gedanke hinter dem Begriff des linearen Raums ist, dass Vektoren all das sind, wovon man Linearkombinationen bilden kann.

Eine Menge von Vektoren ist **linear unabhängig**, wenn keiner der Vektoren eine Linearkombination der anderen ist. Das ist [äquivalent](https://de.wikibooks.org/wiki/Mathe_f%C3%BCr_Nicht-Freaks:_Lineare_Unabh%C3%A4ngigkeit_von_Vektoren#Vom_ersten_Kriterium_zur_formalen_Definition) zu der Bedingung, dass der Nullvektor nur durch eine triviale Linearkombination darstellbar ist. Oder technisch:

* Ein endliches System von Vektoren {{< katex "(v_1,\ldots,v_n)" >}} ist linear unabhängig, wenn aus {{< katex "\sum_{i=1}^n a_i v_i = 0" >}} folgt, dass {{< katex "a_1=\ldots=a_n=0" >}}.
* Ein unendliches System von Vektoren {{< katex "(v_i)_{i\in I}" >}} ist linear unabhängig, wenn für jede endliche Teilmenge {{< katex "J" >}} von {{< katex "I" >}} aus {{< katex "\sum_{j\in J} a_j v_j=0" >}} folgt, dass {{< katex "a_j=0" >}} für alle {{< katex "j\in J" >}}.

## Untervektorräume

Untervektorräume sind Teilmengen von Vektorräumen, die selber wieder eine Vektorraum sind. D.h. zu einem Vektorraum {{< katex "(V,+,\cdot)" >}} über einem Körper {{< katex "\mathbb{K}">}} ist {{< katex "(U,+,\cdot)" >}} mit {{< katex "U\subseteq V" >}} ein Untervektorraum, wenn:

* {{< katex "0_V\in U" >}}
* {{< katex "cv \in U" >}} für alle {{< katex "v \in V, c\in\mathbb{K}" >}}
* {{< katex "v+w \in U" >}} für alle {{< katex "v,w \in V" >}}

## Skalarprodukt

Das Skalarprodukt (_dot product_ oder _inner product_) bildet zwei Vektoren auf ein Skalar ab und liefert damit eine zusätzliche Struktur, die es erlaubt geometrische Maße wie Längen und Winkel zu definieren, indem es eine [Norm](../topology/#normierte-und-metrische-räume) induziert.

Technisch ist das **Skalarprodukt** eines Vektorraums {{< katex "(V,+,\cdot)" >}} über dem Körper {{< katex "\mathbb{K}" >}} eine Abbildung {{< katex "\langle\,\rangle:V\times V\to \mathbb{K}" >}}, die für alle für {{< katex "v,w\in V" >}} folgende Eigenschaften erfüllt:

* Positive Definitheit: {{< katex "\langle v,v\rangle > 0" >}}
* Symmetrie: {{< katex "\langle v,w\rangle = \langle w,v\rangle" >}}
* Bilinearität: {{< katex "\langle v,\cdot\rangle" >}} und {{< katex "\langle \cdot, v\rangle" >}} sind linear (d.h. das Skalarprodukt ist eine [Bilinearform](#bilinearformen))

**Beispiele** kanonischer Skalarprodukte:

* {{< katex "\mathbb{R}^n" >}}: {{< katex "\langle x,y\rangle := \sum_{i=1}^n x_i y_i = x^Ty" >}}
* {{< katex "\mathbb{C}^n" >}}: {{< katex "\langle x,y\rangle := \sum_{i=1}^n x_i \overline{y_i}" >}}
* Reellwertige Funktionen {{< katex "C[a,b]" >}}: {{< katex "\langle f,g\rangle := \int_a^b f(x)g(x) dx" >}}
  (stetig und damit auch integrierbar, umfasst auch die Polynome über {{< katex "\mathbb{R}" >}})
* Komplexwertige Funktionen {{< katex "C[a,b]" >}}: {{< katex "\langle f,g\rangle := \int_a^b f(x)\overline{g(x)} dx" >}}

## Euklidische Vektorräume

Ein **Euklidischer Vektorraum** ist ein reeller Vektorraum mit einem Skalarprodukt.

Die Norm (d.h. die Länge eines Vektors), die von einem Skalarprodukt über {{< katex "\mathbb{K}=\mathbb{R}" >}} oder {{< katex "\mathbb{K}=\mathbb{C}" >}} induziert wird, ist folgende:
{{< katex display="\|v\|=\sqrt{\langle v,v\rangle}" >}}

Ein Vektor ist **normalisiert**, wenn er Länge 1 hat. Jeder Vektor {{< katex "v" >}} lässt sich normalisieren zu {{< katex "\dfrac{v}{\|v\|}" >}}.
(Das funktioniert mit dem Skalarprodukt, ist aber allgemein mit Bilinearformen nicht immer möglich.)

Zwei Vektoren {{< katex "v,w" >}} sind **orthogonal**, wenn {{< katex "\langle v,w\rangle = 0" >}}.

### Orthonormalbasen (Gram-Schmidt-Verfahren)

Zu einer beliebigen Basis {{< katex "\{v_1,v_2,v_3,\ldots,v_n\}" >}} lässt sich eine orthonormale Basis {{< katex "\{w_1,w_2,w_3,\ldots,w_n\}" >}} konstruieren, indem man jeden Vektor zu den vorherigen orthogonalisiert und dann normalisiert:

* {{< katex "w_1=\dfrac{v_1}{\|v_1\|}" >}}
* {{< katex "w_2'=v_2 - \langle w_1,v_2\rangle w_1" >}}
* {{< katex "w_2=\dfrac{w_2'}{\|w_2'\|}" >}}
* {{< katex "w_3'=v_3 - \langle w_1,v_3\rangle w_1 - \langle w_2,v_3\rangle w_2" >}}
* {{< katex "w_3=\dfrac{w_3'}{\|w_3'\|}" >}}
* ...
* {{< katex "w_n'=v_n - \sum_{i=1}^{n-1}\langle w_i,v_n\rangle w_i" >}}
* {{< katex "w_n=\dfrac{w_n'}{\|w_n'\|}" >}}

# Strukturerhaltende Abbildungen

## Lineare Abbildungen

Ein **Homomorphismus** zwischen zwei algebraischen Strukturen {{< katex "\mathbf{A}=(A,(\circ_\mathbf{A})_i)" >}} und {{< katex "\mathbf{B}=(B,(\circ_\mathbf{B})_i)" >}} ist eine Abbildung {{< katex "f:A\to B" >}}, die die algebraische Struktur erhält, d.h. dass für alle Operationen {{< katex "\circ_\mathbf{A}" >}} und {{< katex "\circ_\mathbf{B}" >}} gilt:
{{< katex display="f(x\circ_\mathbf{A} y)=f(x)\circ_\mathbf{B} f(y)" >}}
Sowie dass die neutralen Elemente von {{< katex "\mathbf{A}" >}} auf die neutralen Elemente von {{< katex "\mathbf{B}" >}} abgebildet werden.

Ein bijektiver Homomorphismus heißt **Isomorphismus**.

Ein Homomorphismus {{< katex "f:A\to A" >}}, der eine algebraische Struktur auf sich selbst abbildet, heißt **Endomorphismus** (oder **Automorphismus**, wenn er bijektiv ist).

Wie viele Informationen bei einer Abbildung {{< katex "f:A\to B" >}} verloren gehen, kann am Kern der Abbildung abgelesen werden.
Der **Kern** sind all die Elemente aus {{< katex "A" >}}, die auf Null abgebildet werden, also {{< katex "\text{ker}(f)=\{x\in A\,|\,f(x)=0_\mathbf{B}\}" >}}. Der Kern enthält immer wenigstens {{< katex "0_\mathbf{A}" >}}. Wenn er keine weiteren Elemente enthält, ist die Abbildung injektiv, d.h. es gehen keine Informationen verloren.

Zum Beispiel ist eine Abbildung nicht injektiv, wenn es unterschiedliche Elemente {{< katex "x,x'\in A" >}} gibt, so dass {{< katex "f(x)=f(x')" >}}, also {{< katex "f(x)-f(x')=0" >}}. Bei einer linearen Abbildung heißt das {{< katex "f(x-x')=0" >}}, d.h. {{< katex "x-x'" >}} liegt im Kern; der Unterschied zwischen {{< katex "x" >}} und {{< katex "x'" >}} geht also bei der Abbildung verloren.

Ist {{< katex "\mathbf{A}" >}} ein Vektorraum, dann bildet der Kern einer Abbildung zusammen mit den Operationen in {{< katex "\mathbf{A}" >}} einen Untervektorraum von {{< katex "\mathbf{A}" >}}.

## Bilinearformen

Eine Bilinearform verallgemeinert die Eigenschaften eines Vektorraumhomomorphismus auf zweistellige Abbildungen und bedeutet dann Linearität in beiden Komponenten:

Seien {{< katex "V,W" >}} Vektorräume über einem Körper {{< katex "\mathbb{K}" >}}. Dann ist eine Abbildung {{< katex "\langle\cdot,\cdot\rangle:V\times W\to\mathbb{K}" >}} **bilinear** bzw. eine **Bilinearform**, wenn die Abbildungen {{< katex "\langle \cdot, w\rangle:V\to\mathbb{K}" >}} und {{< katex "\langle v,\cdot\rangle:W\to\mathbb{K}" >}} beide linear sind, d.h. wenn gilt:

* {{< katex "\langle v_1 + v_2, w\rangle = \langle v_1,w\rangle + \langle v_2,w\rangle" >}}
und {{< katex "\langle \lambda v, w\rangle = \lambda\langle v,w\rangle" >}}
* {{< katex "\langle v,w_1 + w_2\rangle = \langle v,w_1\rangle + \langle v,w_2\rangle" >}}
und {{< katex "\langle v, \lambda w\rangle = \lambda\langle v,w\rangle" >}}

Zum Beispiel ist das Skalarprodukt eines Vektorraums eine Bilinearform (die zusätzlich symmetrisch und positiv definit ist).

Die Matrixdarstellung einer Bilinearform {{< katex "\beta">}} bezüglich einer Basis {{< katex "\mathcal{B}=(v_1,\ldots,v_n)">}} ist:
{{< katex display="M_\mathcal{B}(\beta)=(\beta(v_i,v_j))">}}
Die Matrixdarstellungen bezüglich verschiedener Basen sind immer kongruent.

Eine Bilinearform ist genau dann symmetrisch, wenn ihre Matrixdarstellung symmetrisch ist.

Eine Bilinearform ist **alternierend**, falls {{< katex "\langle v,v \rangle = 0">}} für alle {{< katex "v\in V">}}.

Eine Bilinearform ist **schiefsymmetrisch**, falls {{< katex "\langle v,w \rangle = - \langle w,v\rangle">}}.

Diese Begriffe sind meist äquivalent: Jede alternierende Bilinearform ist schiefsymmetrisch. Und umgekehrt auch, wenn {{< katex "1+1\neq 0">}} in  {{< katex "\mathbb{K}">}}.

Eine Bilinearform ist **nicht ausgeartet**, wenn gilt:
* Ist {{< katex "\langle v,w\rangle = 0">}} für ein festes {{< katex "v">}} und jedes {{< katex "w">}}, so ist {{< katex "v=0">}}.
* Ist {{< katex "\langle v,w\rangle = 0">}} für jedes {{< katex "v">}} und ein festes {{< katex "w">}}, so ist {{< katex "w=0">}}.

Das ist genau dann der Fall, wenn ihre Matrixdarstellung den größtmöglichen Rang hat.

## Endomorphismen auf Euklidischen Vektorräumen

Zu jedem Endomorphismus {{< katex "f" >}} gibt es genau einen **adjungierten** Endomorphismus {{< katex "f^\text{ad}" >}}, so dass {{< katex "\langle v,f(w)\rangle = \langle f^\text{ad}(v), w\rangle" >}} für alle Vektoren {{< katex "v,w" >}} des Vektorraums.

Ein Endomorphismus {{< katex "f" >}} ist **selbstadjungiert**, wenn {{< katex "f=f^\text{ad}" >}}, d.h. wenn {{< katex "\langle v, f(w)\rangle = \langle f(v),w\rangle" >}} für alle Vektoren {{< katex "v,w" >}}.

Im kanonischen Euklidischen Vektorraum ist die Matrixdarstellung des adjungierten Endomorphismus die transponierte Matrixdarstellung des Endomorphismus: {{< katex "M_\mathcal{B}(f^\text{ad}) = (M_\mathcal{B}(f))^T">}}.
* Für {{< katex "f(v) = Av" >}} ist {{< katex "f^\text{ad}(v) = A^Tv" >}}.
* Die Matrixdarstellung eines selbstadjungierten Endomorphismus ist diagonalisierbar.
