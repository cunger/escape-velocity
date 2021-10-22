---
title: "Matrix"
summary: "Matrices and vectors. All notes in German."
date: 2020-08-26
weight: 2
math: true
toc: true
draft: true
---

Wir reden hier immer über Vektorräume.

Eine lineare Transformation bildet Vektoren auf Vektoren ab.
(linear = preserve addition and scalar multiplication, or for 2D space: grid lines remain parallel and evenly spaced)
Da jeder Vektor als Linearkombination von Basisvektoren dargestellt werden kann, ist eine lineare Transformation vollständig bestimmt dadurch, worauf es die Basisvektoren abbildet.

Matrix als lineare Transformation:
Matrix, wobei die Spalten den Vektoren entsprechen, auf die die Basisvektoren abgebildet werden.
Multiplikation Matrix mal Vektor bedeutet Anwendung der Transformation auf den Vektor:
    Ax=v bedeutet Tranformation A angewandt auf x gibt v
=>  x=A^-1v bedeutet um x zu finden, wenden wir die inverse Transformation auf v an

* Matrixmultiplikation AB = Komposition der beiden Transformationen (A\circ B, d.h. erst B ausführen, dann A ausführen)
  (eine Transformation kann als Komposition von Basistransformationen beschrieben werden, z.b. Rotation, Shear, Verschieben)
* Inverse = inverse Transformation
* Determinante = der Faktor, um ein Teil des Raums durch die Transformation gestaucht oder gestreckt wird (der Inhalt einer Fläche im R2 oder das Volumen in R3).
  Produkte und Summanden capture, wie einer der Spaltenvektoren gestaucht oder gestreckt wird
  negative = inverting the orientation of space (flipping it)
  0, wenn die Transformation zu einer niedrigeren Dimension führt (man verliert Informationen, "you cannot unsquish space", also stimmt z.B. AA-1=1 nicht mehr)
* Rang einer Matrix = Anzahl Dimensionen des Outputs der Transformation

Für eine {{< katex "n\times n" >}} Matrix {{< katex "A" >}} sind die folgenden Aussagen äquivalent:

* {{< katex "A" >}} ist invertierbar.
* {{< katex "\text{Rang}(A)=n" >}}
* Die Spaltenvektoren von {{< katex "A" >}} sind linear unabhängig.
* {{< katex "A" >}} kann als endliches Produkt von Elementarmatrizen ausgedrückt werden.
* {{< katex "\text{det}(A)\neq 0" >}} (d.h. wenn {{< katex "\text{det}(A)" >}} im Körper oder Ring, über dem die Matriz definiert ist, invertierbar ist)
