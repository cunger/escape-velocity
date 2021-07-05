---
title: "Analysis"
summary: "German notes on analysis. In progress."
date: 2020-11-23
weight: 3
math: true
toc: true
draft: false
---

# Funktionen über metrischen Räumen

Wir betrachten Abbildungen zwischen metrischen Räumen, insbesondere stetige Funktionen {{< katex "f:X\to Y" >}} zwischen metrischen Räumen {{< katex "(X,d_X)" >}} und {{< katex "(Y,d_Y)" >}}
(oder zwischen spezielleren metrischen Räumen {{< katex "(X,\|\cdot\|_X)" >}} und {{< katex "(Y,\|\cdot\|_Y)" >}}, wenn {{< katex "d(a,b)=\|a-b\|" >}}).

Besonders wichtig für Anwendungen sind Abbildungen von {{< katex "\mathbb{R}^n" >}} nach {{< katex "\mathbb{R}" >}}, also reellwertige Funktionen mehrerer Veränderlicher, und vektorwertige Funktionen von {{< katex "\mathbb{R}^n" >}} nach {{< katex "\mathbb{R}^m" >}}. Inbesondere lineare Transformationen von {{< katex "\mathbb{R}^n" >}} nach {{< katex "\mathbb{R}^m" >}} (für die also gilt {{< katex "f(x+x')=f(x)+f(x')" >}} und {{< katex "f(cx)=cf(x)" >}}), die durch eine eindeutige Matrix {{< katex "A" >}} beschrieben werden können, so dass {{< katex "{}^t(f(x))=A{\,}^tx" >}}.

Eine Abbildung oder Funktion ist

* **surjektiv**, wenn jedes Element des Wertebereichs im Bild von {{< katex "f" >}} liegt.
* **injektiv**, wenn jedes Element im Bild von {{< katex "f" >}} genau ein Urbild hat. Also wenn keine zwei Elemente im Definitionsbereich das gleiche Bild haben.

Stetigkeit und Differenzierbarkeit einer Funktion in einem Punkt sind lokale Eigenschaften, d.h. sie hängen nur vom Verhalten der Funktion in einer Umgebung des Punktes ab.

## Stetigkeit

* **{{< katex "\varepsilon-\delta" >}}-Kriterium:**

  {{< katex "f" >}} ist stetig in {{< katex "p" >}}, wenn es für alle {{< katex "\varepsilon > 0" >}} ein {{< katex "\delta > 0" >}} gibt, so dass für alle {{< katex "x\in X" >}} gilt:
{{< katex display="d_X(x,p) < \delta \Rightarrow d_Y(f(x),f(p)) < \varepsilon" >}}

* **Umgebungskriterium:**

* **Folgenkriterium:**

  {{< katex "f" >}} ist stetig in {{< katex "p" >}}, wenn für jede Folge {{< katex "(x_n)" >}} in {{< katex "X" >}} mit {{< katex "\lim_{n\to\infty} x_n = p" >}} gilt:
  {{< katex display="\lim_{n\to\infty} f(x_n) = f(\lim_{n\to\infty} x_n) = f(p)" >}}

Weitere, stärkere Arten von Stetigkeit:

* **Gleichmäßige Stetigkeit**

* **Lipschitz-Stetigkeit**

  {{< katex "f" >}} ist Lipschitz-stetig mit Lipschitz-Konstante {{< katex "L" >}} (oder _dehnungsbeschränkt_), wenn für alle {{< katex "p,q\in X" >}} gilt:
  {{< katex display="d_Y(f(p),f(q)) \leq L\cdot d_X(p,q)" >}}
  {{< katex display="\|(f(p)-f(q))\|_Y \leq L\cdot \|p-q\|_X" >}}

  Das heißt, der Abstand zweier Punkte {{< katex "x,x'" >}} wird durch Anwendung der Funktion höchstens um den Faktor {{< katex "L" >}} gestreckt (wenn {{< katex "L > 1" >}}) oder gestaucht (wenn {{< katex "L<1" >}}).

* **Hölder-Stetigkeit**

  {{< katex "f" >}} ist Hölder-stetig zum Exponenten {{< katex "\alpha\in(0,\infty)" >}}, wenn es eine Konstante {{< katex "C>0" >}} gibt, so dass für alle {{< katex "p,q\in X" >}} gilt:
  {{< katex display="d_Y(f(p),f(q)) \leq C\cdot d_X(p,q)^\alpha" >}}
  {{< katex display="\|(f(p)-f(q))\|_Y \leq C\cdot \|p-q\|_X^\alpha" >}}

Zum Beispiel ist {{< katex "f(x)=x^2" >}} stetig, aber nicht gleichmäßig stetig oder Lipschitz-stetig.

In einem Punkt {{< katex "a" >}} stetig fortsetzbar?
Wenn {{< katex "a" >}} kein Häufungspunkt, dann immer. Wenn {{< katex "a" >}} Häufungspunkt, dann nur wenn {{< katex "f" >}} in {{< katex "a" >}} konvergiert.

## Differenzierbarkeit

Die Ableitung einer Funktion untersucht deren lokale Veränderung: Wie stark ändert sich der Funktionswert bei einer sehr kleinen Veränderung des Eingabewerts?
Dieses Konzept wird äquivalent erfasst von den folgenden Ableitungsbegriffen, die jeweils einen anderen Blickwinkel einnehmen.

### Differential

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

### Gradient

**Differentialoperator:** {{< katex "\nabla" >}} (grad, Vektoranalysis)

> In kartesischen Koordinaten sind die Komponenten des Gradientvektors die partiellen Ableitungen im Punkt P, der Gradient zeigt deshalb in die Richtung der größten Änderung. Der Betrag des Gradienten gibt den Wert der größten Änderungsrate an diesem Punkt an.
(https://www.wikiwand.com/de/Gradient_(Mathematik))

(https://www.wikiwand.com/en/Differential_operator)

## Umkehrfunktion

[Tao 6.7 (p. 152ff)]

# Folgen und Reihen in metrischen Räumen

Eine **reelle Folge** ist eine Abbildung {{< katex "f:\mathbb{N}\to\mathbb{R}" >}}. (Eine Folge hat also immer unendlich viele Elemente.)

Folgen von Punkten in einem metrischen Raum
+ Konvergenz

Folgen von Funktionen zwischen metrischen Räumen
+ Konvergenz:

  * punktweise Konvergenz
  * gleichmäßige Konvergenz
  * andere Konvergenzen (z.B. {{< katex "L^1" >}}- und {{< katex "L^2" >}}-Konvergenz)

Reihen von Funktionen

# Literatur

* Wolfgang Beekmann: Skript Analysis (1144), FernUniversität Hagen.
* Daniel Grieser: Skript zu Analysis II, Universität Oldenburg.
* Terrence Tao: Analysis II.
