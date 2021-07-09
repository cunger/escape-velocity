---
title: "Differential- und Integralrechnung"
summary: "German notes on analysis. In progress."
date: 2020-11-23
weight: 3
math: true
toc: true
draft: false
---

# Differenzierbarkeit

Die Ableitung einer Funktion untersucht deren lokale Veränderung: Wie stark ändert sich der Funktionswert bei einer sehr kleinen Veränderung des Eingabewerts?
Dieses Konzept wird äquivalent erfasst von den folgenden Ableitungsbegriffen, die jeweils einen anderen Blickwinkel einnehmen.

## Differential

Die Ableitung ist der Proportionalitätsfaktor zwischen infinitesimalen Änderungen des Eingabewertes und daraus resultierenden infinitesimalen Änderungen des Funktionswertes. Es geht also um die Änderungsrate der Funktion.

Der Differentialquotient (oder Differential) ist der Grenzwert des Differenzenquotienten. Der Differenzenquotient ist die mittlere Änderungsrate der Funktion auf dem Intervall {{< katex "[x,x_0]" >}}, das entspricht geometrisch der Sekantensteigung:
{{< katex display="\frac{f(x)-f(x_0)}{x-x_0}" >}}
Der Grenzwert davon, das Differential, ist dann die lokale Änderungsrate der Funktion an der Stelle {{< katex "x_0" >}}, das entspricht geometrisch der Tangentensteigung:
{{< katex display="f'(x_0) = \text{lim}_{x\to x_0}\frac{f(x)-f(x_0)}{x-x_0}" >}}
Das Problem bei Funktionen {{< katex "f:\mathbb{R}^n\to\mathbb{R}^m" >}} ist, dass {{< katex "x-x_0\in \mathbb{R}^n" >}} und {{< katex "f(x)-f(x_0)\in \mathbb{R}^m" >}}, der Quotient beider also gar nicht vernünftig definiert ist.

Eine äquivalente Formulierung ergibt sich, wenn man {{< katex "x" >}} durch {{< katex "x_0+h" >}} ersetzt. Der Grenzwert der Steigung der Sekanten durch die Punkte {{< katex "(x_0,f(x_0))" >}} und {{< katex "(x_0+h,f(x_0+h))" >}} ist dann:

{{< katex display="f'(x_0)=\text{lim}_{h\to 0}\frac{f(x_0+h)-f(x_0)}{h}" >}}

Das ist äquivalent zu:
{{< katex display="\text{lim}_{h\to 0}\frac{f(x_0+h)-f(x_0)-L(h)}{h} = 0" >}}
Wobei {{< katex "L(h)=f'(x_0)(h)" >}} das Differential ist.
Dieser Begriff des Differentials lässt sich auch auf mehrdimensionale Funktionen übertragen. Das Differential ist die Abbildung {{< katex "L:\mathbb{R}^n\to\mathbb{R}" >}}, so dass

{{< katex display="\text{lim}_{h\to 0}\frac{f(x_0+h)-f(x_0)-L(h)}{\|h\|} = 0" >}}

Vor allem ist {{< katex "L" >}} eine lineare Abbildung. Daraus ergibt sich eine leicht andere Sichtweise:
Die Ableitung ist die Steigung der linearen Funktion, die die Änderung der betrachteten Funktion in dem gegebenen Punkt lokal am besten approximiert. D.h. die Änderung des Funktionswerts {{< katex "f(x)" >}} hängt annähernd linear von der Änderung des Wertes {{< katex "x" >}} (von {{< katex "x" >}} zu {{< katex "x+h" >}}) ab. Das entspricht der Vorstellung, dass die Tangente der Graph derjenigen linearen Funktion {{< katex "h\to L(h)" >}} ist, die {{< katex "f(x_0+h)−f(x_0)" >}} mit einem sehr kleinen Fehler approximiert.

Eine Funktion ist also differenzierbar in einem Punkt, wenn sie in dem Punkt "annähernd linear" ist.

**Differentialoperator:** {{< katex "\frac{d}{dx}:f\to f'" >}}

Bei mehrdimensionalen Funktionen ist die **Richtungsableitung** die momentane relative Änderung des Funktionswertes {{< katex "f(x)" >}}, wenn sich der Wert {{< katex "x" >}} mit dem Vektor {{< katex "h" >}} fortbewegt. Sie beschreibt also ist das lokale Verhalten der Komponentenfunktion bei Änderung dieser Komponente. Das Differential weist im Prinzip jedem Vektor die Richtungsableitung in Richtung des Vektors zu.

Ein Spezialfall der Richtungsableitung ist die **partielle Ableitung**. Die partielle Ableitung einer Funktion mehrerer Veränderlicher ist nichts anderes als die Ableitung der Funktion, die man erhält, wenn man alle Veränderlichen bis auf eine festhält.

**Differentialoperator:** {{< katex "\frac{\partial}{\partial x_i}:f\to \frac{\partial f}{\partial x_i}" >}}

## Gradient

**Differentialoperator:** {{< katex "\nabla" >}} (grad, Vektoranalysis)

> In kartesischen Koordinaten sind die Komponenten des Gradientvektors die partiellen Ableitungen im Punkt P, der Gradient zeigt deshalb in die Richtung der größten Änderung. Der Betrag des Gradienten gibt den Wert der größten Änderungsrate an diesem Punkt an.
(https://www.wikiwand.com/de/Gradient_(Mathematik))

(https://www.wikiwand.com/en/Differential_operator)

# Integrierbarkeit

# Literatur

* Wolfgang Beekmann: Skript Analysis (1144), FernUniversität Hagen.
* Daniel Grieser: Skript zu Analysis II, Universität Oldenburg.
* Terrence Tao: Analysis II.
