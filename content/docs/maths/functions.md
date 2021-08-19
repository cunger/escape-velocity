---
title: "Eigenschaften von Funktionen"
summary: "Stetigkeit. Differenzierbarkeit. Integrierbarkeit."
date: 2021-08-17
weight: 3
math: true
toc: true
draft: false
---

Eine Funktion {{< katex "f" >}} ist

* **surjektiv**, wenn jedes Element des Wertebereichs im Bild von {{< katex "f" >}} liegt.
* **injektiv**, wenn jedes Element im Bild von {{< katex "f" >}} genau ein Urbild hat. Also wenn keine zwei Elemente im Definitionsbereich das gleiche Bild haben.

# Strukturerhaltung

Für algebraische Strukturen sind besonders die strukturerhaltenden Abbildungen zwischen ihnen interessant.

Lineare Abbildungen zwischen Vektorräumen sind strukturerhaltend in dem Sinne, dass sie sich mit der Addition und Skalarmultiplikation des Vektorraums vertragen, d.h. Linearkombinationen wieder auf Linearkombinationen abbilden.

Eine Funktion {{< katex "f" >}} ist **linear**, wenn gilt:

* {{< katex "f(x+x')=f(x)+f(x')" >}}
* {{< katex "f(cx)=cf(x)" >}}

Sie kann dann durch eine eindeutige Matrix {{< katex "A" >}} beschrieben werden, so dass
{{< katex display="{}^t(f(x))=A{\,}^tx" >}}


Eine Abbildung zwischen [metrischen Räumen](../topology) {{< katex "(X,d_X)" >}} und {{< katex "(Y,d_Y)" >}} ist **isometrisch**, wenn sie die Metrik erhält (d.h. der Abstand zweier Bildpunkte ist gleich dem Abstand ihrer Urbildpunkte):
{{< katex display="d_Y(f(x),f(y)) = d_X(x,y) \quad\text{für alle }x,y\in X" >}}
Jede isometrische Abbildung ist stetig (sogar gleichmäßig stetig).

Stetigkeit ist auch eine Art der Strukturerhaltung: Sie erhält die Nähe zwischen Elementen in topologischen Räumen.

# Stetigkeit

Die Stetigkeit einer Funktion in einem Punkt ist eine lokale Eigenschaft, d.h. sie hängt nur vom Verhalten der Funktion in einer Umgebung des Punktes ab.

## Abbildungen zwischen topologischen Räumen

Wir betrachten Abbildungen {{< katex "f:X\to Y" >}} zwischen [topologischen Räumen](../topology) {{< katex "X" >}} und {{< katex "Y" >}}.

Topologisch bedeutet Stetigkeit einer Funktion, dass sie die Nähe zwischen Elementen erhält, also im Sinne der Topologie strukturerhaltend ist.
Das kann mithilfe von Umgebungen definiert werden.

### Umgebungskriterium

{{< katex "f:M\to Y" >}} ist **stetig im Punkt** {{< katex "p\in M" >}} genau dann, wenn gilt:
Zu jeder Umgebung {{< katex "V" >}} von {{< katex "f(p)" >}} gibt es eine Umgebung {{< katex "U" >}} von {{< katex "p" >}}, so dass {{< katex "f(U\cap M)\subseteq V" >}} (d.h. für alle {{< katex "x\in U\cap M" >}} gilt, dass {{< katex "f(x)\in V" >}}).

Anders ausgedrückt ist {{< katex "f" >}} genau dann stetig in {{< katex "p\in M" >}}, wenn für jede Umgebung {{< katex "V" >}} von {{< katex "f(p)" >}} die Menge {{< katex "f^{-1}(V)" >}} eine Umgebung von {{< katex "p" >}} ist.

{{< katex "f:M\to Y" >}} ist **stetig** genau dann, wenn gilt: Für alle offenen Mengen {{< katex "U" >}} ist {{< katex "f^{-1}(U)" >}} offen in M. (Die Urbilder offener Mengen sind offen. Das gilt analog auch für abgeschlossene Mengen.)

## Abbildungen zwischen metrischen Räumen

Wir betrachten Abbildungen {{< katex "f:X\to Y" >}} zwischen [metrischen Räumen](../topology) {{< katex "(X,d_X)" >}} und {{< katex "(Y,d_Y)" >}}
(oder auch zwischen normierten Räumen {{< katex "(X,\|\cdot\|_X)" >}} und {{< katex "(Y,\|\cdot\|_Y)" >}} mit {{< katex "d(a,b)=\|a-b\|" >}}).

### Folgenkriterium

{{< katex "f" >}} ist stetig in {{< katex "p" >}}, wenn für jede Folge {{< katex "(x_n)" >}} in {{< katex "X" >}} mit {{< katex "\lim_{n\to\infty} x_n = p" >}} gilt:
{{< katex display="\lim_{n\to\infty} f(x_n) = f(\lim_{n\to\infty} x_n) = f(p)" >}}

### {{< katex "\varepsilon-\delta" >}}-Kriterium

Hinreichend kleine Änderungen des Arguments ziehen nur beliebig kleine Änderungen des Funktionswertes nach sich.

{{< katex "f" >}} ist stetig in {{< katex "p" >}}, wenn es für alle {{< katex "\varepsilon > 0" >}} ein {{< katex "\delta > 0" >}} gibt, so dass für alle {{< katex "x\in X" >}} gilt:
{{< katex display="d_X(x,p) < \delta \Rightarrow d_Y(f(x),f(p)) < \varepsilon" >}}

Das garantiert Approximierbarkeit der Funktion: Für jeden maximalen Fehler {{< katex "\varepsilon" >}} und eine Stelle {{< katex "p" >}} findet man ein {{< katex "\delta" >}}, so dass sich jeder Funktionswert {{< katex "f(x)" >}} für Argumente {{< katex "x" >}} in der Umgebung {{< katex "U_\delta(p)" >}} um maximal {{< katex "\varepsilon" >}} von {{< katex "f(p)" >}} unterscheiden.

### Stärkere Arten von Stetigkeit

**Gleichmäßige Stetigkeit**

{{< katex "f" >}} ist gleichmäßig stetig, wenn es für alle {{< katex "\varepsilon > 0" >}} ein {{< katex "\delta > 0" >}} gibt, so dass für alle {{< katex "x,y\in X" >}} gilt:
{{< katex display="d_X(x,y) < \delta \Rightarrow d_Y(f(x),f(y)) < \varepsilon" >}}

{{< katex "\delta" >}} ist also global und hängt nicht mehr von der Stelle der Funktion ab.
Das entspricht einer gleichmäßigen Approximierbarkeit.

![Non-uniform approximation](https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Nonuniform_approximation_of_a_function.svg/350px-Nonuniform_approximation_of_a_function.svg.png)
![Uniform approximation](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Uniform_approximation_of_a_function.svg/350px-Uniform_approximation_of_a_function.svg.png)

_(Links: Stetigkeit, rechts: gleichmäßige Stetigkeit. Quelle: [Serlo](https://de.wikibooks.org/wiki/Mathe_für_Nicht-Freaks:_Gleichmäßige_Stetigkeit))_

**Lipschitz-Stetigkeit**

{{< katex "f" >}} ist Lipschitz-stetig mit Lipschitz-Konstante {{< katex "L" >}} (oder _dehnungsbeschränkt_), wenn für alle {{< katex "p,q\in X" >}} gilt:
{{< katex display="d_Y(f(p),f(q)) \leq L\cdot d_X(p,q)" >}}
{{< katex display="\|(f(p)-f(q))\|_Y \leq L\cdot \|p-q\|_X" >}}

Das heißt, der Abstand zweier Punkte {{< katex "x,x'" >}} wird durch Anwendung der Funktion höchstens um den Faktor {{< katex "L" >}} gestreckt (wenn {{< katex "L > 1" >}}) oder gestaucht (wenn {{< katex "L<1" >}}).

**Hölder-Stetigkeit**

{{< katex "f" >}} ist Hölder-stetig zum Exponenten {{< katex "\alpha\in(0,\infty)" >}}, wenn es eine Konstante {{< katex "C>0" >}} gibt, so dass für alle {{< katex "p,q\in X" >}} gilt:
{{< katex display="d_Y(f(p),f(q)) \leq C\cdot d_X(p,q)^\alpha" >}}
{{< katex display="\|(f(p)-f(q))\|_Y \leq C\cdot \|p-q\|_X^\alpha" >}}

Die Stetigskeitsbegriffe lassen sich ihrer Stärke nach ordnen:

  Hölder-stetig {{< katex "\Rightarrow" >}} Lipschitz-stetig {{< katex "\Rightarrow" >}} gleichmäßig stetig {{< katex "\Rightarrow" >}} stetig

Die Umkehrungen gelten im allgemeinen nicht, zum Beispiel ist {{< katex "f(x)=x^2" >}} stetig, aber nicht gleichmäßig stetig.

### Wichtige Sätze

Ist {{< katex "M" >}} kompakt und {{< katex "f:M\to Y" >}} stetig, dann ist {{< katex "f(M)" >}} kompakt und {{< katex "f" >}} gleichmäßig stetig.

Ist {{< katex "M" >}} zusammenhängend und {{< katex "f:M\to Y" >}} stetig, dann ist {{< katex "f(M)" >}} zusammenhängend.

Ist {{< katex "M\neq\emptyset" >}} kompakt und {{< katex "f:M\to \mathbb{R}" >}} stetig, dann nimmt {{< katex "f" >}} sein Maximum und Minimum an.


## Fortsetzbarkeit

In einem Punkt {{< katex "a" >}} stetig fortsetzbar?
Wenn {{< katex "a" >}} kein Häufungspunkt, dann immer. Wenn {{< katex "a" >}} Häufungspunkt, dann nur wenn {{< katex "f" >}} in {{< katex "a" >}} konvergiert.

<!-- # Umkehrfunktionen

[Tao 6.7 (p. 152ff)] -->

# Differenzierbarkeit

Die Ableitung einer Funktion untersucht deren lokale Veränderung: Wie stark ändert sich der Funktionswert bei einer Veränderung des Eingabewerts? Das kann man verstehen als Änderungsrate der Funktion an einer Stelle. Wobei die Änderungsrate die Steigung derjenigen linearen Funktion ist, die die Änderung der betrachteten Funktion in dem gegebenen Punkt lokal am besten approximiert. Eine Funktion ist also differenzierbar, wenn sie linear approximiert werden kann.

Das Differential wird in der Regel über euklidischen Räumen {{< katex "(\mathbb{R}^n,\|\cdot\|_2)" >}} betrachtet, die neben einer metrischen Strukur auch eine lineare Strukur haben, um über lineare Approximationen reden zu können. In allgemeinen metrischen Räumen ist das nicht möglich. (Da kann man aber über isometrische Näherungen ein metrisches Differential definieren.)
Für Anwendungen sind sowieso Funktionen über reellen Vektorräumen besonders wichtig, d.h. reellwertige Funktionen mehrerer Veränderlicher von {{< katex "\mathbb{R}^n" >}} nach {{< katex "\mathbb{R}" >}} und vektorwertige Funktionen von {{< katex "\mathbb{R}^n" >}} nach {{< katex "\mathbb{R}^m" >}}.

Differenzierbarkeit in einem Punkt ist eine lokale Eigenschaft, d.h. sie hängt nur vom Verhalten der Funktion in einer Umgebung des Punktes ab.

## Änderungsrate

Die Ableitung ist der Proportionalitätsfaktor zwischen infinitesimalen Änderungen des Eingabewertes und daraus resultierenden infinitesimalen Änderungen des Funktionswertes, beschreibt also die lokale Änderungsrate der Funktion.

Der Differentialquotient (oder Differential) ist der Grenzwert des Differenzenquotienten. Der Differenzenquotient ist die mittlere Änderungsrate der Funktion auf dem Intervall {{< katex "[x,a]" >}}, das entspricht geometrisch der Sekantensteigung:
{{< katex display="\frac{f(x)-f(a)}{x-a}" >}}
{{< katex display="f'(a) = \text{lim}_{x\to a}\frac{f(x)-f(a)}{x-a}" >}}

Eine äquivalente Formulierung ergibt sich, wenn man {{< katex "x" >}} durch {{< katex "a+h" >}} ersetzt. Der Grenzwert der Steigung der Sekanten durch die Punkte {{< katex "(a,f(a))" >}} und {{< katex "(a+h,f(a+h))" >}} ist dann:
{{< katex display="f'(a)=\text{lim}_{h\to 0}\frac{f(a+h)-f(a)}{h}" >}}
Das ist äquivalent zu
{{< katex display="\text{lim}_{h\to 0}\frac{f(a+h)-f(a)-L(h)}{h}=0" >}}
Wobei {{< katex "L(h)=f'(a)\,h" >}} eine lineare Abbildung ist.

Diese Formulierung ist praktisch, da sie sich einfach auf mehrdimensionale Funktionen übertragen lässt.
(Im Gegensatz zur ersten: Da bei mehrdimensionalen Funktionen {{< katex "x-a" >}} und {{< katex "f(x)-f(a)" >}} Vektoren unterschiedlicher Räume sein können, ist der Quotient beider in vielen Fällen gar nicht vernünftig definiert.)
Das Differential ist dann die Abbildung {{< katex "L:\mathbb{R}^n\to\mathbb{R}" >}}, so dass

{{< katex display="\text{lim}_{h\to 0}\frac{f(a+h)-f(a)-L(h)}{\|h\|} = 0" >}}

Daraus ergibt sich eine leicht andere Sichtweise:
Die Ableitung ist die Steigung der linearen Funktion, die die Änderung der betrachteten Funktion in dem gegebenen Punkt lokal am besten approximiert. D.h. die Änderung des Funktionswerts {{< katex "f(x)" >}} hängt annähernd linear von der Änderung des Wertes {{< katex "x" >}} (von {{< katex "x" >}} zu {{< katex "x+h" >}}) ab. Das entspricht der Vorstellung, dass die Tangente der Graph derjenigen linearen Funktion {{< katex "h\to L(h)" >}} ist, die {{< katex "f(a+h)−f(a)" >}} mit einem sehr kleinen Fehler approximiert.

Eine Funktion ist also differenzierbar in einem Punkt, wenn sie in dem Punkt "annähernd linear" ist.

## Lineare Approximierbarkeit

Aus der Approximation
{{< katex "f'(a)\approx\dfrac{f(x)-f(a)}{x-a}" >}}
ergibt sich direkt:
{{< katex display="f(x)\approx f(a) + f'(a)\cdot (x-a)" >}}
D.h. {{< katex "f" >}} wird in der Nähe von {{< katex "a" >}} approximiert durch eine Gerade mit der Steigung {{< katex "f'(a)" >}}. Man kann Differenzierbarkeit also wie folgt definieren:

{{< katex "f:M\to \mathbb{R}^m" >}} ist genau dann differenzierbar in {{< katex "a" >}} mit der Ableitung {{< katex "c=f'(a)\in \mathbb{R}^m" >}}, wenn es eine Funktion {{< katex "r:M\to \mathbb{R}^m" >}} gibt, so dass

* {{< katex "f(x) = f(a) + c\cdot(x-a) + r(x)" >}}
* {{< katex "\lim_{x\to a}\dfrac{r(x)}{x-a} = 0" >}}

Hier versteht man {{< katex "f(a) + c(x-a)" >}} als Näherung von {{< katex "f(x)" >}} und {{< katex "r(x)" >}} als Fehler, also als Differenz zwischen der eigentlichen Funktion und ihrer Näherung. Wenn {{< katex "x=a" >}}, dann ist {{< katex "r(x)=0" >}}.

Da {{< katex "r(x) = f(x) - f(a) - c(x-a)" >}} ist, gelten diese Bedingungen genau dann, wenn {{< katex display="\lim_{x\to a}\frac{f(x) - f(a) - c(x-a)}{x-a}=\lim_{x\to a}\frac{f(x) - (a)}{x-a} - c = 0," >}} also wenn {{< katex display="\lim_{x\to a}\frac{f(x) - f(a)}{x-a} = c = f'(a)." >}}

Im mehrdimensionalen Fall heißt das:
{{< katex "f:M\to Y" >}} ist genau dann differenzierbar in {{< katex "a" >}} mit der Ableitung {{< katex "A=f'(a)\in Y" >}} (die **Jacobi-Matrix**, siehe lineare Abbildung als Matrix), wenn es eine Funktion {{< katex "r:M\to Y" >}} gibt, so dass

* {{< katex "f(x) = f(a) + A\cdot(x-a) + r(x)" >}}
* {{< katex "\lim_{x\to a}\dfrac{r(x)}{\|x-a\|} = 0" >}}

## Operatoren

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
