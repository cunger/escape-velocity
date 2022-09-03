---
title: "Komplexe Zahlen"
summary: "(In Arbeit)"
date: 2022-09-03
weight: 9
math: true
toc: true
---

Die komplexen Zahlen sind alle Zahlen der Form {{< katex "a+bi" >}} mit {{< katex "a,b\in\mathbb{R}">}} und {{< katex "i" >}} diejenige Zahl, für die gilt {{< katex "i^2=-1" >}}. Diese Zahl ist nicht eindeutig bestimmt, denn es gibt zwei Lösungen für {{< katex "i^2=-1" >}} -- die eine nennen wir {{< katex "i" >}}, die andere {{< katex "-i" >}}. Es ist also {{< katex "\sqrt{-1}=\pm i" >}}. Die Lösungen sind jeweils die Konjugierte voneinander und es macht absolut keinen Unterschied, welche wir als {{< katex "i" >}} und welche als {{< katex "-i" >}} bezeichnen.

# Arithmetik

Die arithmetische Operationen entsprechen der üblichen Arithmetik mit Polynomen.

## Konjugation

# Konstruktion

Man kann das Zahlensystem der komplexen Zahlen auf verschiedene Weisen konstruieren.

## {{< katex "\mathbb{C}" >}} als zwei-dimensionaler reeller Vektorraum

Als **Körper** {{< katex "(\mathbb{C},+,\cdot)" >}} mit {{< katex "\mathbb{C}=\mathbb{R}^2" >}} und
  * {{< katex "(a,b)+(c,d) = (a+c,b+d)" >}}
  * {{< katex "(a,b)\cdot(c,d) = (ac-bd,ad+bc)" >}}
  * {{< katex "i = (0,1)" >}}
  * {{< katex "1 = (1,0)" >}}

Dann sind {{< katex "i" >}} und {{< katex "-i" >}} additive und multiplikative Inverse voneinander. Vor allem sind die komplexen Zahlen ein algebraisch geschlossener Körper. Was man im Gegensatz zu {{< katex "\mathbb{R}" >}} verliert, ist die Ordnung. (Geht man zu mehr Dimensionen über, verliert man noch mehr: in den 4 Dimensionen der Quaternionen z.B. die Kommutativität, in den 8 Dimensionen der Oktonionen auch die Assoziativität, und in allen anderen so gut wie alles.)

Die komplexen Zahlen entsprechen auch einem **reellen Vektorraum** der Dimension 2, mit {{< katex "\{1, i\}">}} als Standardbasis und mit den reellen Zahlen als Unterraum.

Die komplexen Zahlen füllen die euklidische Ebene. Das erlaubt für die [geometrische Interpretation](#geometrische-interpretation) der komplexen Zahlen, z.B. ein einem kartesischen Koordinatensystem oder in einem Polarkoordinatensystem.

## {{< katex "\mathbb{C}" >}} als Faktorring über Polynomen

Als **Faktorring** {{< katex "\mathbb{R}[x]/(x^2+1)">}} des Polynomrings mit {{< katex "i" >}} als Unbekannter.

## {{< katex "\mathbb{C}" >}} in Matrizendarstellung

**Matrixrepräsentation** von {{< katex "a+bi" >}}:
{{< katex display="\begin{pmatrix} a & -b \\ b & a \end{pmatrix}" >}}

<!-- conjugate = transpose -->

Unter der geometrischen Interpretation der komplexen Zahlen entspricht das einer Rotationsmatrix.

# Geometrische Interpretation

kartesische Koordinaten vs Polarkoordinaten vs Euler-Form

![Unification of algebra and geometry](/images/docs/complex-numbers.png)

Euler: {{< katex "e^{iy}=\cos(y) + i\sin(y)" >}}

Einheitskreis, denn {{< katex "|e^{iy}|=1">}}
