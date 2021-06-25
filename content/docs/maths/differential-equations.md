---
title: "Differentialgleichungen"
summary: "German notes on differential equations. In progress."
date: 2021-06-25
weight: 9
math: true
toc: true
---

# Definition

Eine **gewöhnliche Differentialgleichung** ist eine Gleichung, die eine Beziehung zwischen einer Funktion {{< katex "y:x\to y(x)" >}}, ihrem Argument {{< katex "x" >}} und einer oder mehrerer ihrer Ableitungen {{< katex "y',y'',\ldots" >}} ausdrückt.
Also eine Gleichung der Form:
{{< katex display="F(x,y,y',\ldots,y^{(k)}) = 0" >}}
Wobei:
* {{< katex "k\in\mathbb{N}" >}} (die Ordnung der Differentialgleichung)
* {{< katex "F:I\times M\to\mathbb{C}" >}} mit {{< katex "I\subseteq\mathbb{R}" >}} und {{< katex "M\subseteq\mathbb{C}^{k+1}" >}}

Eine Lösung der Differentialgleichung ist ein Intervall {{< katex "J\subseteq I" >}} und eine {{< katex "k" >}}-mal differenzierbare Funktion {{< katex "y:J\to\mathbb{C}" >}}, so dass für alle {{< katex "x\in J" >}} gilt:
{{< katex display="(x,y(x),y'(x),\ldots,y^{(k)}(x))\in I\times M" >}}
{{< katex display="F(x,y(x),y'(x),\ldots,y^{(k)}(x)) = 0" >}}
Oft ist zusätzlich eine Anfangsbedingung {{< katex "y(a)=b" >}} gegeben.

Bemerkungen:
* Implizite Form: {{< katex "F(x,y,y',\ldots,y^{(k)}) = 0" >}}
* Explizite Form: {{< katex "y^{(k)} = f(x,y,y',\ldots,y^{(k-1)})" >}}
* In **partiellen Differentialgleichungen** hängt {{< katex "y" >}} von mehreren Veränderlichen ab.

# Beispiele

# Analytische Lösungsverfahren

# Numerische Lösungsverfahren
