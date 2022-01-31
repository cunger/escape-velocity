---
title: "Matrizen"
summary: "Matrizen, deren Eigenschaften und Interpretationen"
date: 2020-08-26
weight: 3
math: true
toc: true
draft: false
---

Eine {{< katex "m\times n" >}}-Matrix über einem Körper {{< katex "\mathbb{K}" >}} ist eine Anordnung von Element von {{< katex "\mathbb{K}" >}} nach folgendem Schema (mit {{< katex "m" >}} Zeilen und {{< katex "n" >}} Spalten):
{{< katex display="\begin{pmatrix} a_{11} & \ldots & a_{1n} \\ \vdots & \cdots & \vdots \\ a_{m1} & \ldots & a_{mn} \end{pmatrix}" >}}

Die Menge aller solcher Matrizen wird mit {{< katex "M_{mn}(\mathbb{K})" >}} bezeichnet.

Matrizen können auch über einem kommutativen Ring statt einem Körper definiert werden. Dann ergeben sich folgende Unterschiede:

* Matrizen über kommutativen Ringen können nicht notwendigerweise in Normalform überführt werden.

Der **Rang** einer Matrix ist die Anzahl linear unabhängiger Spalten. Oder Zeilen, denn Spalten- und Zeilenrang sind immer gleich. (Die möglichen Ränge einer {{< katex "m\times n" >}}-Matrix sind also {{< katex "0">}} bis {{< katex "\text{min}(m,n)" >}}.)

Die **Spur** einer Matrix ist die Summe der Diagonalelemente.

# Matrizenrechnung

Addition und Skalarmultiplikation passieren elementweise.

Multiplikation ...

Eine Matrix ist **nilpotent**, wenn es ein {{< katex "m\in\mathbb{N}" >}} gibt, so dass {{< katex "A^m = 0" >}} und {{< katex "A^{m-1}\neq 0" >}}.

## Elementarmatrizen

Elementare Zeilenumformungen:
* {{< katex "P_{ij}" >}} Vertauschen der Zeilen {{< katex "i" >}} und {{< katex "j" >}}
* {{< katex "D_{i}(c)" >}} Multiplikation der Zeile {{< katex "i" >}} mit einem Skalar {{< katex "c" >}}
* {{< katex "T_{ij}(c)" >}} Addition des {{< katex "c" >}}-fachen der Zeile {{< katex "j" >}} zu einer anderen (nicht derselben!) Zeile {{< katex "i" >}}

Analog für Spalten. Diese Umformungen ändern den Rang einer Matrix nicht.

## Transponierte

Die **Transponierte** {{< katex "A^T" >}} einer Matrix {{< katex "A" >}} ist ...

{{< katex "A" >}} und {{< katex "A^T" >}} haben den gleichen Rang, die gleiche Spur und Determinante, aber möglicherweise unterschiedliche Eigenwerte.
Sonst gelten die folgenden Eigenschaften:

* {{< katex "(A+B)^T = A^T + B^T" >}}
* {{< katex "(A\cdot B)^T = B^T \cdot A^T" >}} (also {{< katex "(A^m)^T = (A^T)^m" >}})
* {{< katex "(cA)^T = cA^T" >}}
* {{< katex "(A^T)^T = A" >}}
* {{< katex "(A^{-1})^T = (A^T)^{-1}" >}}

Eine Matrix heißt **orthogonal**, wenn {{< katex "A^T=A^{-1}" >}}.

Eine reelle Matrix heißt

* **symmetrisch**, wenn {{< katex "A^T=A" >}},
* **schiefsymmetrisch**, wenn {{< katex "A^T=-A" >}}.

Eine komplexe Matrix heißt

* **hermitesch**, wenn {{< katex "A^T=\overline{A}" >}},
* **schiefhermitesch**, wenn {{< katex "A^T=-\overline{A}" >}}.

# Determinante

Die **Determinante** ist eine eindeutige Abbildung {{< katex "M_{nn}(\mathbb{K})\to\mathbb{K}" >}}, die so definiert ist, dass sie genau dann 0 wird, wenn die Spalten der Matrix nicht linear unabhängig sind (die Matrix also nicht invertierbar ist):
{{< katex display="\text{det}(A) = \sum_{\sigma\in S_n}\text{sgn}(\sigma)a_{1\sigma(1)}\cdots a_{n\sigma(n)}" >}}

Für die Berechnung der Determinante ist die Leibniz-Formel aber nur bis {{< katex "n=2" >}} praktisch handhabbar.

## Für {{< katex "n=1" >}}: trivial
{{< katex display="\text{det}\begin{pmatrix} a \end{pmatrix} = a" >}}

## Für {{< katex "n=2" >}}: einfach

{{< katex display="\text{det}\begin{pmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{pmatrix} = a_{11} a_{22} - a_{12} a_{21}" >}}
Das lässt sich gut nachvollziehen, denn wenn die Spaltenvektoren linear abhängig sind (und von 0 verschieden), heißt das es gibt ein {{< katex "c\in\mathbb{K}" >}}, so dass:
{{< katex display="\begin{pmatrix} a_{11} \\ a_{12} \end{pmatrix} = c\cdot \begin{pmatrix} a_{21} \\ a_{22} \end{pmatrix}" >}}
Also {{< katex "a_{11} = c\cdot a_{21}" >}} und {{< katex "a_{12} = c\cdot a_{22}" >}},
d.h. {{< katex "c=\dfrac{a_{11}}{a_{21}}" >}} und damit {{< katex "a_{12} = \dfrac{a_{11}}{a_{21}} a_{22}" >}}. Daraus ergibt sich {{< katex "a_{12} a_{21} = a_{11} a_{22}" >}} bzw. {{< katex "0 = a_{11} a_{22} - a_{12} a_{21}" >}}.

## Für {{< katex "n=3" >}}: Sarrus-Regel

![Saruss-Regel](../img/sarrus.png)

Man summiert:

* durchgezogene Linie: positives Produkt der Elemente
* gestrichelte Linie: negatives Produkt der Elemente

Funktioniert genauso, wenn man die ersten beiden Zeilen unter die Matriz schreibt.

## Für {{< katex "n>3" >}}: Laplace-Entwicklung

Die Laplace-Entwicklung nach der i-ten Zeile ist die Summe aus folgendem Summanden für jedes Element {{< katex "a_{ij}" >}}:
{{< katex display="a_{ij}\cdot(-1)^{i+j}\cdot\text{det}(A_{ij})" >}}
Wobei {{< katex "A_{ij}" >}} die Matrix ist, die übrig bleibt, wenn man in {{< katex "A" >}} die i-te Zeile und j-te Spalte (also jeweils die Zeile und Spalte mit dem Eintrag {{< katex "a_{ij}" >}}) entfernt.

Je mehr 0en in einer Zeile stehen, desto einfacher wird die Laplace-Entwicklung, deswegen macht es manchmal Sinn, erst elementare Zeilenumformungen auf die Matrix anzuwenden (wodurch sich die Determinante höchstens im Vorzeichen ändert, siehe _Eigenschaften_ unten). Die Matrix wird also um {{< katex "n=1" >}} kleiner. Das wiederholt man so lange, bis {{< katex "n<3" >}}.

Analog funktioniert die Laplace-Entwicklung nach der j-ten Spalte.

## Spezialfälle

* Wenn eine Zeile oder Spalte 0 ist, ist die Determinante 0.
* Wenn eine Zeile oder Spalte doppelt vorkommt, ist die Determinante 0.
* {{< katex "\text{det}(\text{normalform}(A))" >}} = Produkt der Diagonalelemente

  Die Determinante wird also genau dann 0, wenn das Produkt der Diagonalelemente der Normalform 0 ist, d.h. wenn mindestens eins der Diagonalelemente 0 ist. Die Determinanten erfasst damit, ob eine quadratische Matrix invertierbar (regulär) ist. Normalform bedeutet obere Dreiecksmatrix.

## Eigenschaften

Die Determinante hat die folgenden Eigenschaften:
* {{< katex "\text{det}(I)=1" >}} (Identitätsmatrix)
* {{< katex "\text{det}(A)=\text{det}(A^T)" >}}
* {{< katex "\text{det}(A^{-1})=(\text{det}(A))^{-1}" >}}
* {{< katex "\text{det}(cA)=c^n\text{det}(A)" >}} (Skalarfaktor)
* {{< katex "\text{det}(AB)=\text{det}(A)\,\text{det}(B)" >}} für Matrizen über Integritätsbereichen
* {{< katex "\text{det}(A)=0" >}} genau dann, wenn {{< katex "\text{rang}(A) < n" >}}

  Ob {{< katex "\text{det}(A)=0" >}} oder nicht ändert sich also nicht durch Zeilenumformungen. Die Determinanten ist damit eine Invariante der Matrix.

  Für Elementarmatrizen gilt:
  * {{< katex "\text{det}(P_{ij}) = -1" >}}, also
    {{< katex "\text{det}(P_{ij}A)=-\text{det}(A)" >}}
  * {{< katex "\text{det}(D_{i}(c)) = c" >}}, also
    {{< katex "\text{det}(D_{i}(c)A)=c\cdot\text{det}(A)" >}}
  * {{< katex "\text{det}(T_{ij}(c)) = 1" >}}, also
    {{< katex "\text{det}(T_{ij}(c)A)=\text{det}(A)" >}}

# Invertierbarkeit

Für eine {{< katex "n\times n" >}} Matrix {{< katex "A" >}} sind die folgenden Aussagen äquivalent:

* {{< katex "A" >}} ist invertierbar.
* {{< katex "\text{rang}(A)=n" >}}
* Die Spaltenvektoren von {{< katex "A" >}} sind linear unabhängig.
* {{< katex "A" >}} kann als endliches Produkt von Elementarmatrizen ausgedrückt werden.
* {{< katex "\text{det}(A)\neq 0" >}} (d.h. wenn {{< katex "\text{det}(A)" >}} im Körper oder Ring, über dem die Matriz definiert ist, invertierbar ist)

Gilt {{< katex "AB=C" >}} und wendet man die gleichen Zeilenumformungen auf {{< katex "A" >}} und {{< katex "C" >}} an (mit dem Ergebnis {{< katex "A'" >}} und {{< katex "C'" >}}), so ist {{< katex "A'B=C'" >}}. Da {{< katex "AA^{-1}=I" >}}, bedeutet das, dass man die Inverse einer Matrix bestimmen kann, indem man die gleichen Zeilenumformungen, die {{< katex "A" >}} in {{< katex "I" >}} überführen, ausführen kann, um {{< katex "I" >}} in {{< katex "A^{-1}" >}} zu überführen.

# Das charakteristische Polynom einer Matrix

{{< katex display="\Chi_A=\text{det}(xI_n-A)" >}}

# Eigenvektoren und Eigenwerte

Die **Eigenvektoren** {{< katex "u" >}} einer Matrix {{< katex "A" >}} bzw. eines Endomorphismus {{< katex "f" >}} sind alle Vektoren, die durch die Transformation nur gestaucht oder gestreckt werden (die Richtung bleibt gleich). Der dazugehörige **Eigenwert** {{< katex "\lambda" >}} ist der Faktor der Stauchung oder Streckung (und entspricht dann z.B. eine Rotationsachse im 3D).
Formal:
{{< katex display="Au = \lambda u \quad\text{bzw.}\quad f(u) = \lambda u" >}}

D.h. {{< katex "Au" >}} bzw. {{< katex "f(u)" >}} hat die gleiche Richtung wie {{< katex "u" >}}, nur um den Faktor {{< katex "\lambda" >}} gestaucht oder gestreckt.

* Eine Matrix muss keine Eigenvektoren besizten - eine Rotation z.B. ändert die Richtung aller Vektoren im Raum.
* Sind die Eigenwerte verschieden, sind die dazugehörigen Eigenvektoren linear unabhängig.
* Eigenwerte sind die Nullstellen des charakteristischen Polynoms.
  Eine Matrix {{< katex "A\in M_{nn}" >}} kann also höchtsens {{< katex "n" >}} Eigenwerte haben.

# Normalformen

Matrizen lassen sich nach **Ähnlichkeit** in Äquivalenzklassen einteilen, wobei eine Klasse alle Matrizen enthält, die den gleichen Endomorphismus darstellen. Technisch heißt das:

Zwei Matrizen {{< katex "A,B" >}} sind **ähnlich**, wenn es eine invertierbare Matrix {{< katex "S" >}} gibt, so dass: {{< katex display="A=S^{-1}BS" >}} Das bedeutet, dass {{< katex "A" >}} die gleiche Transformation wie {{< katex "B" >}} ausdrückt, nur in einer anderen Basis, wobei {{< katex "S" >}} die Basiswechselmatrix ist ({{< katex "S" >}} ist nicht eindeutig, denn jedes Vielfache {{< katex "cS" >}} erfüllt die Gleichung auch).

Ähnliche Matrizen haben also:

* den gleichen Rang,
* die gleiche Determinante,
* das gleiche charakteristische Polynom und Minimalpolynom,
* die gleichen Eigenwerte (aber nicht notwendigerweise die gleichen Eigenvektoren),
* die gleiche Jordansche Normalform.

Matrizen lassen sich auch nach **Kongruenz** in Äquivalenzklassen (sogenannte **Kongruenzklassen**) einteilen:
Zwei Matrizen {{< katex "A,B" >}} sind **kongruent**, wenn es eine invertierbare Matrix {{< katex "S" >}} gibt, so dass
{{< katex display="A=S^TBS" >}}

Da in der Regel {{< katex "S^T\neq S^{-1}">}}, sind kongruente Matrizen in der Regel nicht ähnlich.

## Diagonalisierbarkeit

Eine Matrix ist diagonalisierbar, wenn sie zu einer Diagonalmatrix ähnlich ist. (Die Eigenwerte der Matrix sind dann die Diagonalelemente und alle die Eigenvektoren entsprechen den Basisvektoren.)

## Treppennormalform

* Alle Nullreihen stehen ganz unten.
* In jeder Zeile ist der von links erste Eintrag ungleich 0 eine 1. Das sind die Pivot-Positionen.
* Stufung: Jede Pivot-Position ist rechts von der Pivot-Position der Zeile darüber.
* Daraus folgt, dass alle Einträge unter den Pivot-Positionen 0 sind. In der reduzierten Treppennormalform sind auch alle Einträge über den Pivot-Positionen 0.

Beispiele:
{{< katex display="\left(\begin{matrix} 1 & \ast & \ast & \ast \\ 0 & 0 & 1 & \ast \\ 0 & 0 & 0 & 1 \end{matrix}\right) \qquad \left(\begin{matrix} 1 & \ast & \ast \\ 0 & 1 & \ast \\ 0 & 0 & 0 \end{matrix}\right) \qquad \left(\begin{matrix} 0 & 0 & 0 \\ 0 & 0 & 0 \\ 0 & 0 & 0 \end{matrix}\right)">}}

Die Treppennormalform erleichtert das Lösen eines linearen Gleichungssystems.

## Jordan-Normalform

# Matrizen als lineare Transformationen

Eine Matrix {{< katex "A\in M_{mn}(\mathbb{K})" >}} kann eine lineare Abbildung zwischen endlichen Vektorräumen ({{< katex "\mathbb{K}^n\to\mathbb{K}^m" >}}) darstellen. Sie bildet dann die Vektoren {{< katex "x\in\mathbb{K}^n" >}} auf die Vektoren {{< katex "Ax\in\mathbb{K}^m" >}} ab. (Dabei können diese Vektoren zum Beispiel auch die Koordinatenvektoren beliebiger Vektoren aus {{< katex "\mathbb{K}" >}} sein.)

Linear ist eine solche Abbildung, weil die Matrizenmultiplikation sowohl Addition als auch Skalarmultiplikation respektiert:
* {{< katex "A(x+y) = Ax + Ay" >}}
* {{< katex "A(cx) = c(Ax)" >}}

In einem zweidimensionalen Raum kann man Linearität anschaulich so verstehen, dass die Transformation des Raumes seine Gridlinien parallel lässt und der Abstand zwischen ihnen überall gleich bleibt.

Da jeder Vektor als Linearkombination der kanonischen Basisvektoren dargestellt werden kann, ist eine lineare Abbildung zwischen Vektorräumen vollständig dadurch bestimmt, worauf diese Basisvektoren abgebildet werden.
Eine Matrix als Darstellung einer linearen Abbildung enthält als Spalten nun genau die Vektoren, auf die die Basisvektoren abgebildet werden.
Nehmen wir die kanonischen Basisvektoren von {{< katex "x\in\mathbb{K}^n" >}}:
{{< katex display="e_1 = \begin{pmatrix} 1 \\ 0 \\ \vdots \\ 0 \end{pmatrix}, \ldots, e_n = \begin{pmatrix} 0 \\ \vdots \\ 0 \\ 1 \end{pmatrix}" >}}

Multiplikation einer Matrix {{< katex "A" >}} mit einem Basisvektor {{< katex "e_i" >}} ergibt genau die i-te Spalte der Matrix, d.h. {{< katex "Ae_i" >}} ist der Vektor, auf den {{< katex "e_i" >}} abgebildet wird.

Allgemeiner bedeutet die Multiplikation der Matrix {{< katex "A" >}} mit einem beliebigen Vektor {{< katex "x" >}} die Anwendung der Transformation auf diesen Vektor.
Denn jeder Vektor kann als Linearkombination von Basisvektoren geschrieben werden kann, aufgrund der Linearität erhält man also:
{{< katex display="Ax=A(c_1e_1+\cdots +c_ne_n)=c_1Ae_1+\cdots + c_nAe_n" >}}

Aus der Interpretation von Matrizen als lineare Transformationen ergibt sich folgendes Bild:

* Die Elementarmatrizen entsprechen Basistransformationen (Rotation, Verschieben, Stauchen oder Strecken) und dass jede Matrix als Produkt von Elementarmatrizen darstellbar ist, bedeutet dass eine Transformation als Komposition von Basistransformationen beschrieben werden kann.

* Eine Diagonalmatrix stellt einer Transformation dar, die die Basisvektoren nur skaliert.

* Die **Matrizenmultiplikation** {{< katex "AB" >}} entspricht der Komposition der beiden Transformationen ({{< katex "A\circ B" >}}, d.h. erst wird {{< katex "B" >}} ausgeführt, dann {{< katex "A" >}}).

* Die **Inverse** einer Matrix entspricht der inversen Transformation:
  * {{< katex "Ax=v" >}} bedeutet, dass die Tranformation {{< katex "A" >}} den Vektor {{< katex "x" >}} auf den Vektor {{< katex "v" >}} abbildet.
  * Daraus folgt {{< katex "x=A^{-1}v" >}}, d.h. man findet {{< katex "x" >}}, indem man die inverse Transformation {{< katex "A^{-1}" >}} auf {{< katex "v" >}} anwendet.

* Der **Rang** einer Matrix entspricht der Anzahl des Dimensionen des Outputs der Transformation.

* Die **Determinante** einer Matrix ist der Faktor, um den ein Teil des Raumes durch die Transformation gestaucht oder gestreckt wird (z.B. der Inhalt einer Fläche im zweidimensionalen Raum oder das Volumen im dreidimensionalen Raum).
  * Ist die Determinante negativ, entspricht das einer Umkehrung der Orientierung des Raumes.
  * Ist die Determinante 0, heißt das, die Transformation bildet auf eine niedrigere Dimension ab. Man verliert also Informationen und kann die Transformation deswegen nicht rückgängig machen, d.h. die Matrix ist nicht invertierbar.

Jede Matrix ist Darstellung eines Endomorphismus des Vektorraums (mit Ähnlichkeit als Äquivalenzrelation und den entsprechenden Normalformen (TODO)) und einer Bilinearform des Vektorraums (mit Kongruenz als Äquivalenzrelation und den entsprechenden Normalformen (TODO)).

# Matrizen als Gleichungssysteme

# Literatur

* Luise Unger: Skript Lineare Algebra (1143), FernUniversität Hagen.
* Klaus Jänich: Lineare Algebra.
