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

Matrizen können auch über einem Ring statt einem Körper definiert werden. Dann ...

# Matrizenmultiplikation

## Elementarmatrizen

# Rang, Inverse, Determinante, Adjungierte

## Rang

## Determinante

Die **Determinante** ist eine eindeutige Abbildung {{< katex "M_{nn}(\mathbb{K})\to\mathbb{K}" >}} mit folgenden Eigenschaften: ...

## Adjungierte

## Invertierbarkeit

Für eine {{< katex "n\times n" >}} Matrix {{< katex "A" >}} sind die folgenden Aussagen äquivalent:

* {{< katex "A" >}} ist invertierbar.
* {{< katex "\text{Rang}(A)=n" >}}
* Die Spaltenvektoren von {{< katex "A" >}} sind linear unabhängig.
* {{< katex "A" >}} kann als endliches Produkt von Elementarmatrizen ausgedrückt werden.
* {{< katex "\text{det}(A)\neq 0" >}} (d.h. wenn {{< katex "\text{det}(A)" >}} im Körper oder Ring, über dem die Matriz definiert ist, invertierbar ist)

# Matrizen als lineare Transformationen

Eine Matrix {{< katex "A\in M_{mn}(\mathbb{K})" >}} kann als lineare Abbildung zwischen endlichen Vektorräumen verstanden werden ({{< katex "\mathbb{K}^n\to\mathbb{K}^m" >}} ), bildet also Vektoren {{< katex "x\in\mathbb{K}^n" >}} auf Vektoren {{< katex "Ax\in\mathbb{K}^m" >}} ab.
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

* Die **Matrizenmultiplikation** {{< katex "AB" >}} entspricht der Komposition der beiden Transformationen ({{< katex "A\circ B" >}}, d.h. erst wird {{< katex "B" >}} ausgeführt, dann {{< katex "A" >}}).

* Die **Inverse** einer Matrix entspricht der inversen Transformation:
  * {{< katex "Ax=v" >}} bedeutet, dass die Tranformation {{< katex "A" >}} den Vektor {{< katex "x" >}} auf den Vektor {{< katex "v" >}} abbildet.
  * Daraus folgt {{< katex "x=A^{-1}v" >}}, d.h. man findet {{< katex "x" >}}, indem man die inverse Transformation {{< katex "A^{-1}" >}} auf {{< katex "v" >}} anwendet.

* Der **Rang** einer Matrix entspricht der Anzahl des Dimensionen des Outputs der Transformation.

* Die **Determinante** einer Matrix ist der Faktor, um den ein Teil des Raumes durch die Transformation gestaucht oder gestreckt wird (z.B. der Inhalt einer Fläche im zweidimensionalen Raum oder das Volumen im dreidimensionalen Raum).
  * Ist die Determinante negativ, entspricht das einer Umkehrung der Orientierung des Raumes.
  * Ist die Determinante 0, heißt das, die Transformation bildet auf eine niedrigere Dimension ab. Man verliert also Informationen und kann die Transformation deswegen nicht rückgängig machen, d.h. die Matrix ist nicht invertierbar.

# Matrizen als Gleichungssysteme
