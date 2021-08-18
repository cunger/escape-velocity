---
title: "Eigenschaften von Funktionen"
summary: "Stetigkeit. Differenzierbarkeit. Integrierbarkeit."
date: 2021-08-17
weight: 3
math: true
toc: true
draft: false
---

Wir betrachten Abbildungen zwischen metrischen Räumen, insbesondere stetige Funktionen {{< katex "f:X\to Y" >}} zwischen [metrischen Räumen](../topology) {{< katex "(X,d_X)" >}} und {{< katex "(Y,d_Y)" >}}
(oder zwischen spezielleren metrischen Räumen {{< katex "(X,\|\cdot\|_X)" >}} und {{< katex "(Y,\|\cdot\|_Y)" >}}, wenn {{< katex "d(a,b)=\|a-b\|" >}}).

Besonders wichtig für Anwendungen sind Abbildungen von {{< katex "\mathbb{R}^n" >}} nach {{< katex "\mathbb{R}" >}}, also reellwertige Funktionen mehrerer Veränderlicher, und vektorwertige Funktionen von {{< katex "\mathbb{R}^n" >}} nach {{< katex "\mathbb{R}^m" >}}. Inbesondere lineare Transformationen von {{< katex "\mathbb{R}^n" >}} nach {{< katex "\mathbb{R}^m" >}}, d.h. Funktionen, für die gilt:

* {{< katex "f(x+x')=f(x)+f(x')" >}}
* {{< katex "f(cx)=cf(x)" >}})

Und die durch eine eindeutige Matrix {{< katex "A" >}} beschrieben werden können, so dass
{{< katex display="{}^t(f(x))=A{\,}^tx" >}}

Lineare Abbildungen zwischen Vektorräumen sind strukturerhaltend - in dem Sinne, dass sie sich mit der Addition und Skalarmultiplikation des Vektorraums vertragen, d.h. Linearkombinationen wieder auf Linearkombinationen abbilden. (Generell sind für algebraische Strukturen besonders die strukturerhaltenden Abbildungen zwischen ihnen interessant.)

Eine Abbildung oder Funktion ist

* **surjektiv**, wenn jedes Element des Wertebereichs im Bild von {{< katex "f" >}} liegt.
* **injektiv**, wenn jedes Element im Bild von {{< katex "f" >}} genau ein Urbild hat. Also wenn keine zwei Elemente im Definitionsbereich das gleiche Bild haben.

Stetigkeit und Differenzierbarkeit einer Funktion in einem Punkt sind lokale Eigenschaften, d.h. sie hängen nur vom Verhalten der Funktion in einer Umgebung des Punktes ab.

# Stetigkeit

## Umgebungskriterium

Topologisch bedeutet Stetigkeit einer Abbildung, dass sie die Nähe zwischen Elementen erhält, also im Sinne der Topologie strukturerhaltend ist. Das kann mithilfe von Umgebungen definiert werden.

{{< katex "f:M\to Y" >}} ist **stetig im Punkt** {{< katex "p\in M" >}} genau dann, wenn gilt:
Zu jeder Umgebung {{< katex "V" >}} von {{< katex "f(p)" >}} gibt es eine Umgebung {{< katex "U" >}} von {{< katex "p" >}}, so dass {{< katex "f(U\cap M)\subseteq V" >}} (d.h. für alle {{< katex "x\in U\cap M" >}} gilt, dass {{< katex "f(x)\in V" >}}).

Anders ausgedrückt ist {{< katex "f" >}} genau dann stetig in {{< katex "p\in M" >}}, wenn für jede Umgebung {{< katex "V" >}} von {{< katex "f(p)" >}} die Menge {{< katex "f^{-1}(V)" >}} eine Umgebung von {{< katex "p" >}} ist.

{{< katex "f:M\to Y" >}} ist **stetig** genau dann, wenn gilt: Für alle offenen Mengen {{< katex "U" >}} ist {{< katex "f^{-1}(U)" >}} offen in M. (Die Urbilder offener Mengen sind offen. Das gilt analog auch für abgeschlossene Mengen.)

## Folgenkriterium

{{< katex "f" >}} ist stetig in {{< katex "p" >}}, wenn für jede Folge {{< katex "(x_n)" >}} in {{< katex "X" >}} mit {{< katex "\lim_{n\to\infty} x_n = p" >}} gilt:
{{< katex display="\lim_{n\to\infty} f(x_n) = f(\lim_{n\to\infty} x_n) = f(p)" >}}

 ## {{< katex "\varepsilon-\delta" >}}-Kriterium

Hinreichend kleine Änderungen des Arguments ziehen nur beliebig kleine Änderungen des Funktionswertes nach sich.

{{< katex "f" >}} ist stetig in {{< katex "p" >}}, wenn es für alle {{< katex "\varepsilon > 0" >}} ein {{< katex "\delta > 0" >}} gibt, so dass für alle {{< katex "x\in X" >}} gilt:
{{< katex display="d_X(x,p) < \delta \Rightarrow d_Y(f(x),f(p)) < \varepsilon" >}}

Das garantiert Approximierbarkeit der Funktion: Für jeden maximalen Fehler {{< katex "\varepsilon" >}} und eine Stelle {{< katex "p" >}} findet man ein {{< katex "\delta" >}}, so dass sich jeder Funktionswert {{< katex "f(x)" >}} für Argumente {{< katex "x" >}} in der Umgebung {{< katex "U_\delta(p)" >}} um maximal {{< katex "\varepsilon" >}} von {{< katex "f(p)" >}} unterscheiden.

## Stärkere Arten von Stetigkeit

Die Stetigskeitsbegriffe lassen sich ihrer Stärke nach ordnen:

  Hölder-stetig {{< katex "\Rightarrow" >}} Lipschitz-stetig {{< katex "\Rightarrow" >}} gleichmäßig stetig {{< katex "\Rightarrow" >}} stetig

Die Umkehrungen gelten im allgemeinen nicht, zum Beispiel ist {{< katex "f(x)=x^2" >}} stetig, aber nicht gleichmäßig stetig.

### Gleichmäßige Stetigkeit

{{< katex "f" >}} ist gleichmäßig stetig, wenn es für alle {{< katex "\varepsilon > 0" >}} ein {{< katex "\delta > 0" >}} gibt, so dass für alle {{< katex "x,y\in X" >}} gilt:
{{< katex display="d_X(x,y) < \delta \Rightarrow d_Y(f(x),f(y)) < \varepsilon" >}}

{{< katex "\delta" >}} ist also global und hängt nicht mehr von der Stelle der Funktion ab.
Das entspricht einer gleichmäßigen Approximierbarkeit.

![Non-uniform approximation](https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Nonuniform_approximation_of_a_function.svg/350px-Nonuniform_approximation_of_a_function.svg.png)
![Uniform approximation](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Uniform_approximation_of_a_function.svg/350px-Uniform_approximation_of_a_function.svg.png)

_(Links: Stetigkeit, rechts: gleichmäßige Stetigkeit. Quelle: [Serlo](https://de.wikibooks.org/wiki/Mathe_für_Nicht-Freaks:_Gleichmäßige_Stetigkeit))_

### Lipschitz-Stetigkeit

{{< katex "f" >}} ist Lipschitz-stetig mit Lipschitz-Konstante {{< katex "L" >}} (oder _dehnungsbeschränkt_), wenn für alle {{< katex "p,q\in X" >}} gilt:
{{< katex display="d_Y(f(p),f(q)) \leq L\cdot d_X(p,q)" >}}
{{< katex display="\|(f(p)-f(q))\|_Y \leq L\cdot \|p-q\|_X" >}}

Das heißt, der Abstand zweier Punkte {{< katex "x,x'" >}} wird durch Anwendung der Funktion höchstens um den Faktor {{< katex "L" >}} gestreckt (wenn {{< katex "L > 1" >}}) oder gestaucht (wenn {{< katex "L<1" >}}).

### Hölder-Stetigkeit

{{< katex "f" >}} ist Hölder-stetig zum Exponenten {{< katex "\alpha\in(0,\infty)" >}}, wenn es eine Konstante {{< katex "C>0" >}} gibt, so dass für alle {{< katex "p,q\in X" >}} gilt:
{{< katex display="d_Y(f(p),f(q)) \leq C\cdot d_X(p,q)^\alpha" >}}
{{< katex display="\|(f(p)-f(q))\|_Y \leq C\cdot \|p-q\|_X^\alpha" >}}

## Fortsetzbarkeit

In einem Punkt {{< katex "a" >}} stetig fortsetzbar?
Wenn {{< katex "a" >}} kein Häufungspunkt, dann immer. Wenn {{< katex "a" >}} Häufungspunkt, dann nur wenn {{< katex "f" >}} in {{< katex "a" >}} konvergiert.

<!-- # Umkehrfunktionen

[Tao 6.7 (p. 152ff)] -->

# Differenzierbarkeit

Die Ableitung einer Funktion untersucht deren lokale Veränderung: Wie stark ändert sich der Funktionswert bei einer sehr kleinen Veränderung des Eingabewerts? Es geht also um die **Änderungsrate der Funktion**. Dabei ist eine Funktion differenzierbar, wenn sie linear approximiert werden kann.

Dieses Konzept wird äquivalent erfasst von den folgenden Ableitungsbegriffen, die jeweils einen anderen Blickwinkel einnehmen.

## Differential

Die Ableitung ist der Proportionalitätsfaktor zwischen infinitesimalen Änderungen des Eingabewertes und daraus resultierenden infinitesimalen Änderungen des Funktionswertes.

### Eindimensional

Der Differentialquotient (oder Differential) ist der Grenzwert des Differenzenquotienten. Der Differenzenquotient ist die mittlere **Änderungsrate** der Funktion auf dem Intervall {{< katex "[x,a]" >}}, das entspricht geometrisch der Sekantensteigung:
{{< katex display="\frac{f(x)-f(a)}{x-a}" >}}
Der Grenzwert davon, das Differential, ist dann die lokale Änderungsrate der Funktion an der Stelle {{< katex "a" >}}, das entspricht geometrisch der Tangentensteigung:
{{< katex display="f'(a) = \text{lim}_{x\to a}\frac{f(x)-f(a)}{x-a}" >}}

Eine äquivalente Formulierung ergibt sich, wenn man {{< katex "x" >}} durch {{< katex "a+h" >}} ersetzt. Der Grenzwert der Steigung der Sekanten durch die Punkte {{< katex "(a,f(a))" >}} und {{< katex "(a+h,f(a+h))" >}} ist dann:
{{< katex display="f'(a)=\text{lim}_{h\to 0}\frac{f(a+h)-f(a)}{h}" >}}
Das ist äquivalent zu
{{< katex display="\text{lim}_{h\to 0}\frac{f(a+h)-f(a)-L(h)}{h}=0" >}}
Wobei {{< katex "L(h)=f'(a)\,h" >}} eine lineare Abbildung ist.

Man kann Differenzierbarkeit äquivalent als **lineare Approximierbarkeit** definieren.

{{< katex "f:M\to Y" >}} ist genau dann differenzierbar in {{< katex "a" >}} mit der Ableitung {{< katex "c=f'(a)\in Y" >}}, wenn es eine Funktion {{< katex "r:M\to Y" >}} gibt, so dass

* {{< katex "f(x) = f(a) + c(x-a) + r(x)" >}}
* {{< katex "\lim_{x\to a}\dfrac{r(x)}{x-a} = 0" >}}

Hier versteht man {{< katex "f(a) + c(x-a)" >}} als Näherung von {{< katex "f(x)" >}} und {{< katex "r(x)" >}} als Fehler, also als Differenz zwischen der eigentlichen Funktion und ihrer Näherung. Wenn {{< katex "x=a" >}}, dann ist {{< katex "r(x)=0" >}}.

Da {{< katex "r(x) = f(x) - f(a) - c(x-a)" >}} ist, gelten diese Bedingungen genau dann, wenn {{< katex display="\lim_{x\to a}\frac{f(x) - f(a) - c(x-a)}{x-a}=\lim_{x\to a}\frac{f(x) - (a)}{x-a} - c = 0," >}} also wenn {{< katex display="\lim_{x\to a}\frac{f(x) - f(a)}{x-a} = c = f'(a)." >}}

### Mehrdimensional

Das Problem bei mehrdimensionalen Funktionen {{< katex "f:\mathbb{R}^n\to\mathbb{R}^m" >}} ist, dass {{< katex "(x-a)\in \mathbb{R}^n" >}} und {{< katex "(f(x)-f(a))\in \mathbb{R}^m" >}}, der Quotient beider also gar nicht vernünftig definiert ist. Die anderen Formulierungen des Differentials lassen sich aber einfach auf mehrdimensionale Funktionen übertragen.

Das Differential ist die Abbildung {{< katex "L:\mathbb{R}^n\to\mathbb{R}" >}}, so dass

{{< katex display="\text{lim}_{h\to 0}\frac{f(a+h)-f(a)-L(h)}{\|h\|} = 0" >}}

Vor allem ist {{< katex "L" >}} eine lineare Abbildung. Daraus ergibt sich eine leicht andere Sichtweise:
Die Ableitung ist die Steigung der linearen Funktion, die die Änderung der betrachteten Funktion in dem gegebenen Punkt lokal am besten approximiert. D.h. die Änderung des Funktionswerts {{< katex "f(x)" >}} hängt annähernd linear von der Änderung des Wertes {{< katex "x" >}} (von {{< katex "x" >}} zu {{< katex "x+h" >}}) ab. Das entspricht der Vorstellung, dass die Tangente der Graph derjenigen linearen Funktion {{< katex "h\to L(h)" >}} ist, die {{< katex "f(a+h)−f(a)" >}} mit einem sehr kleinen Fehler approximiert.

Eine Funktion ist also differenzierbar in einem Punkt, wenn sie in dem Punkt "annähernd linear" ist.
In der äquivalenten Formulierung als lineare Approximierbarkeit heißt das:

{{< katex "f:M\to Y" >}} ist genau dann differenzierbar in {{< katex "a" >}} mit der Ableitung {{< katex "A=f'(a)\in Y" >}} (die **Jacobi-Matrix**, siehe lineare Abbildung als Matrix), wenn es eine Funktion {{< katex "r:M\to Y" >}} gibt, so dass

* {{< katex "f(x) = f(a) + A(x-a) + r(x)" >}}
* {{< katex "\lim_{x\to a}\dfrac{r(x)}{\|x-a\|} = 0" >}}

### Operatoren

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
