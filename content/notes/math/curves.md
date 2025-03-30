---
title: "Kurven"
summary: "Die Bewegung eines Punktes durch den Raum."
date: 2022-11-28
weight: 7
math: true
toc: true
draft: false
---

Eine **parametrisierte Kurve** {{< katex "f" >}} ist eine stetige Funktion {{< katex "f:I\to\mathbb{R}^n">}}, typischerweise angegeben als n-Tupel von Funktionen {{< katex "(f_1,\ldots,f_n)">}}.

Eine **Kurve** ist eine Äquivalenzklasse von parametrisierten Kurven.

Anschaulich kann man sich Kurven als den Weg eines Punktes in einer bestimmten Richtung durch den {{< katex "\mathbb{R}^n">}} vorstellen. In einer physikalischen Interpretation ist {{< katex "I">}} eine Menge von Zeitpunkten, d.h. eine parametrisierte Kurve beschreibt die Bewegung eines Punktes entlang des Weges mit einer bestimmten Geschwindigkeit, indem sie für jeden Zeitpunkt den Ort des Punktes im Raum angibt. Dann ist {{< katex "f'(t)" >}} für {{< katex "t\in I">}} der Geschwindigkeitsvektor zum Zeitpunkt {{< katex "t">}} der Bewegung.

Beispiel:
* Eine Ellipse mit den Hauptachsen {{< katex "a,b">}} ist gegeben durch {{< katex "f:[0,2\pi]\to\mathbb{R}^2">}} mit: {{< katex display="f(t):=\begin{pmatrix}a\cos t \\ b\sin t\end{pmatrix}">}} Für einen Kreis ist {{< katex "a=b">}} der Radius.

Das Bild von {{< katex "f">}} heißt **Spur** der Kurve.

Eine Kurve {{< katex "f:I\to\mathbb{R}^n" >}} heißt **glatt**, falls {{< katex "f'(t)\neq 0" >}} für alle {{< katex "t\in I" >}}.

# Rektifizierbarkeit und Bogenlänge

Die Länge einer Kurve ist das Supremum der Längen der in ihr eingeschriebenen Polygonzüge.
Eine Kurve ist **rektifizierbar**, wenn diese Länge endlich ist (also wenn die Mengeder Längen aller möglichen Polygonzüge beschränkt ist).

Eine Kurve ist stetig differenzierbar auf {{< katex "I">}}, wenn jede Funktion {{< katex "f_i">}} auf {{< katex "I">}} stetig differenzierbar ist. Jede stetig differenzierbare Kurve {{< katex "f:[a,b]\to\mathbb{R}^n">}} ist rektifizierbar, d.h. ihre Bogenlänge ist endlich. Die **Bogenlänge** {{< katex "L(f)">}} lässt sich dann berechnen durch:

{{< katex display="L(f)=\int_a^b \|f'(t)\|_2\,dt">}}

Vorausgesetzt, dass das Integral existiert. Wobei {{< katex "\|\cdot\|_2">}} die [euklidische Norm](../topology/#normierte-und-metrische-räume) ist und damit ist {{< katex "\|f'(t)\|_2\in\mathbb{R}">}}. Dadurch ergibt sich:
{{< katex display="L(f)= \|f'(t)\|_2\,t\;|_a^b = \|f'(t)\|_2(b-a) = \sqrt{f_1'^2+\ldots+ f_n'^2}\,(b-a)">}}

# Parameterwechsel

# Kurvenintegrale
