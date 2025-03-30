---
title: "Komplexe Zahlen"
summary: "(Draft, work in progress)"
date: 2022-09-03
weight: 10
math: true
toc: true
---

Die komplexen Zahlen sind alle Zahlen der Form {{< katex "a+bi" >}} mit {{< katex "a,b\in\mathbb{R}">}} und {{< katex "i" >}} diejenige Zahl, für die gilt {{< katex "i^2=-1" >}}. Diese Zahl ist nicht eindeutig bestimmt, denn es gibt zwei Lösungen für {{< katex "i^2=-1" >}} -- die eine nennen wir {{< katex "i" >}}, die andere {{< katex "-i" >}}. Es ist also {{< katex "\sqrt{-1}=\pm i" >}}. Die Lösungen sind jeweils die Konjugierte voneinander und es macht absolut keinen Unterschied, welche wir als {{< katex "i" >}} und welche als {{< katex "-i" >}} bezeichnen.

Zusammen mit Addition und Multiplikation bilden die komplexen Zahlen einen Körper {{< katex "\mathbb{C}" >}}, mit {{< katex "\mathbb{R}" >}} als Unterkörper.

Im Gegensatz zu {{< katex "\mathbb{R}" >}} ist {{< katex "\mathbb{C}" >}} **algebraisch abgeschlossen**, d.h. jedes nicht-konstante Polynom aus {{< katex "\mathbb{C}[x]" >}}) hat mindestens eine Nullstelle in {{< katex "\mathbb{C}" >}}, es sind also alle algebraischen Gleichungen lösbar. (Zahlen, die Nullstelle eines Polynoms sind, nennt man algebraisch. Davon gibt es abzählbar viele. Darüber hinaus gibt es überabzählbar viele transzendente Zahlen.)

Was man im Gegensatz zu {{< katex "\mathbb{R}" >}} aber verliert, ist die Ordnung. (Geht man zu mehr Dimensionen über, verliert man mehr: in den 4 Dimensionen der Quaternionen die Kommutativität, in den 8 Dimensionen der Oktonionen auch die Assoziativität, und in allen anderen so gut wie alles.)

# Arithmetik

Die arithmetischen Operationen entsprechen der üblichen Arithmetik mit Polynomen:
* {{< katex "(a+bi) + (c+di) = (a+c)+(b+d)i" >}}
* {{< katex "(a+bi)(c+di) = (ac-bd)+(ad+bc)i" >}}

## Konjugation

# Konstruktion

Man kann das Zahlensystem der komplexen Zahlen auf verschiedene Weisen konstruieren.

## {{< katex "\mathbb{C}" >}} als zwei-dimensionaler reeller Vektorraum

Die komplexen Zahlen können als **Körper** {{< katex "(\mathbb{R}^2,+,\cdot)" >}} definiert werden, mit:
  * {{< katex "(a,b)+(c,d) = (a+c,b+d)" >}}
  * {{< katex "(a,b)\cdot(c,d) = (ac-bd,ad+bc)" >}}
  * {{< katex "i = (0,1)" >}}
  * {{< katex "1 = (1,0)" >}}

Dann sind {{< katex "i" >}} und {{< katex "-i" >}} additive und multiplikative Inverse voneinander.

Die komplexen Zahlen entsprechen also einem **reellen Vektorraum** der Dimension 2, mit {{< katex "\{1, i\}">}} als Standardbasis und mit den reellen Zahlen als Unterraum. Die komplexen Zahlen füllen dabei die euklidische Ebene. Das erlaubt für die [geometrische Interpretation](#geometrische-interpretation) der komplexen Zahlen.

## {{< katex "\mathbb{C}" >}} als Faktorring über Polynomen

Als **Faktorring** {{< katex "\mathbb{R}[x]/(x^2+1)">}} des Polynomrings mit {{< katex "i" >}} als Unbekannter.

## {{< katex "\mathbb{C}" >}} in Matrizendarstellung

**Matrixrepräsentation** von {{< katex "a+bi" >}}:
{{< katex display="\begin{pmatrix} a & -b \\ b & a \end{pmatrix}" >}}

<!-- conjugate = transpose -->

Unter der geometrischen Interpretation der komplexen Zahlen entspricht das einer Rotationsmatrix.

# Geometrische Interpretation

In der euklidischen Ebene beschreibt die komplexe Zahl {{< katex "z=x+yi" >}} den Punkt, der die **kartesischen Koordinaten** {{< katex "(x,y)" >}} hat. Auf einem Kreis mit Radius {{< katex "r">}}, auf dem {{< katex "r\ \text{rad}">}} den Winkel {{< katex "\theta">}} aufspannt, entspricht das den Koordinaten {{< katex "(r\cos(\theta), r\sin(\theta))" >}}, der Punkt hat also die **Polarkoordinaten** {{< katex "(r,\theta)" >}} und die komplexe Zahl hat die Form {{< katex "z=r(\cos(\theta)+\sin(\theta)i)" >}}.

![Unification of algebra and geometry](/images/docs/complex-numbers.png)

Betrachtet man die Taylorreihen von {{< katex "e^x">}}, {{< katex "\sin(x)">}} und {{< katex "\cos(x)">}}, ergibt sich folgende Gleichheit (**Euler's Formel**):
{{< katex display="e^{i\theta}=\cos(\theta) + i\sin(\theta)" >}}
Die komplexe Zahl in **Euler-Form** ist {{< katex "z=re^{i\theta}" >}}.

<!-- ![Koordinaten](/images/docs/complex-numbers-coordinates.png) -->

[{{< katex "e^{i\pi}" >}} in 3.14 minutes](https://www.youtube.com/watch?v=v0YEaeIClKY)