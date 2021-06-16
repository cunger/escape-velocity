---
title: "Analysis"
summary: "German notes on analysis. In progress."
date: 2020-11-23
weight: 1
math: true
toc: true
draft: false
---

# Normierte und metrische Räume

Viele Begriffe der Analysis, wie der der Umgebung, des Grenzwerts und der Konvergenz, benutzen das Konzept des Abstandes. Konvergenz, zum Beispiel, kann man über die {{< katex "\varepsilon" >}}-Umgebung von {{< katex "x" >}} definieren (so dass jedes Folgenglied ab einem bestimmten {{< katex "n" >}} einen Abstand zu {{< katex "x" >}} hat, der kleiner als {{< katex "\varepsilon" >}} ist) oder direkt über den Abstand {{< katex "d" >}} zweier reeller Zahlen:

Eine reelle Folge {{< katex "(x_n)" >}} konvergiert gegen {{< katex "x" >}} gdw {{< katex "\text{lim}_{n\to\infty} d(x_n,x)=0" >}}.

Will man diese Begriffe verallgemeinern für andere mathematische Objekte, wie Folgen von Vektoren, komplexe Zahlen und Funktionen, müsste man sie spezifisch für jedes dieser Objekte neu definieren.
Viel effizienter ist es, eine allgemeine Klasse von Räumen zu definieren, zusammen mit einem allgemeinen Konzept für Abstand zwischen Objekten in diese Räumen und darauf aufbauend allgemeine Begriffe wie den der Konvergenz.

Ein **Raum** ist eine Menge von mathematischen Objekten, typischerweise mit irgendeiner Art von Struktur.

**Metrische Räume** sind Räume, auf denen ein Abstandsbegriff definiert ist. Eine **Metrik** ist eine Abbildung {{< katex "d" >}} zweier Vektoren auf eine reelle Zahl, die den Abstand zwischen diesen Vektoren ausdrückt.

**Normierte Räume** sind Vektorräume, auf denen eine Norm definiert ist, die die Länge eines Vektors ausdrückt.
Eine **Norm** {{< katex "\|x\|" >}} ist eine Abbildung eines Vektors {{< katex "x" >}} auf eine reelle Zahl (die Länge des Vektors).
Eine Norm setzt eine lineare Struktur voraus, ist also nur für Vektorräume definiert.
Beispiele:

* {{< katex "\mathbb{R}^1" >}} mit dem Betrag {{< katex "|\cdot|" >}}
* {{< katex "\mathbb{R}^n" >}} mit der p-Norm {{< katex "\|x\|_p := \left(\sum_{k=1}^n |x_k|^p\right)^{\frac{1}{p}}" >}}

  Spezialfälle:
    * {{< katex "\|\cdot\|_1" >}} Summennorm
    * {{< katex "\|\cdot\|_2" >}} euklidische Norm
    * {{< katex "\|x\|_\infty := \text{max}\,\{|x_k|\,\mid\,1\leq k\leq n\}" >}} Maximumnorm
* Vektorraum aller beschränkten Funktionen mit der Supremumsnorm {{< katex "\|\cdot\|_\infty" >}}

Jede Norm induziert auch eine Metrik (aber nicht zwangsläufig umgekehrt), nämlich
{{< katex "d(x,y) = \|x-y\|" >}}, d.h. der Abstand zweier Vektoren wird definiert als die Länge des Differenzvektors.
Jeder normierte Raum ist also auch ein metrischer Raum. Aber nicht zwangsläufig umgekehrt: Ein metrischer Raum ist nicht unbedingt ein Vektorraum, denn eine Metrik muss die lineare Struktur eines Raumes nicht respektieren.

Beispiele für Metriken, die von keiner Norm induziert werden:

* Diskrete Metrik {{< katex "d(x,y) := \begin{cases} 0 & \text{wenn }x=y \\ 1 & \text{sonst}\end{cases}" >}}
* Französische Eisenbahnmetrik (wo die Abstandsmessung immer durch einen zentralen Punkt {{< katex "P" >}} gehen muss)
{{< katex display="d(x,y) := \begin{cases} \|x-y\| & \text{wenn }x,y\text{ auf einer Geraden durch }P\text{ liegen} \\ \|x-P\| + \|P-y\| & \text{sonst}\end{cases}" >}}
* p-adische Metrik auf {{< katex "\mathbb{Z}" >}}

Alle Normen über einem endlich-dimensionalen Vektorraum {{< katex "\mathbb{R}^n" >}} sind bis auf eine Konstante (d.h. bis auf Streckung oder Stauchung) äquivalent, d.h. es gibt {{< katex "c_1,c_2" >}}, so dass {{< katex "\|x\|_a \leq c_1\|x\|_b" >}} und {{< katex "\|x\|_b\leq c_2 \|x\|_a" >}}. So kann man z.B. bestimmte Eigenschaften auf der Maximumsnorm zeigen, wo sie einfacher zu beweisen sind, und dann auf äquivalente Normen übertragen.

Ein normierter Raum ist genau dann **vollständig**, wenn jede Cauchy-Folge konvergiert. Vollständige Räume umfassen immer geschlossene Mengen, es gibt also keine Lücken im Raum. Ein vollständiger normierter Raum heißt **Banachraum**. Zum Beispiel ist jeder endlich-dimensionale Raum über {{< katex "\mathbb{R}" >}} (also {{< katex "\mathbb{R}^n" >}}) mit einer beliebigen Norm vollständig.

# Mengen in metrischen Räumen

Häufungspunkte

überdeckung

Eine Menge {{< katex "M" >}} ist **offen** bzgl. einer Norm, wenn {{< katex "M" >}} Umgebung von jedem {{< katex "a\in M" >}} ist, d.h. wenn es eine {{< katex "\varepsilon" >}}-Umgebung von {{< katex "a" >}} gibt, die ganz in {{< katex "M" >}} liegt. Was heißt, dass kein Randpunkt der Menge in ihr enthalten ist. Die Differenzmenge ist dann **geschlossen** bzgl. der Norm (also wenn es für jeden Punkt außerhalb der Menge eine {{< katex "\varepsilon" >}}-Umgebung gibt, die auch außerhalb liegt). Das heißt eine Menge ist geschlossen, wenn sie alle Randpunkte enthält.

Eine Teilmenge von {{< katex "\mathbb{R}^n" >}} ist offen oder geschlossen unabhängig davon, welche Norm betrachtet wird.

Faustregel:

* Mengen, die mit strikten Ungleichungen zwischen stetigen Funktionen definiert sind, sind offen.
* Mengen, die mit {{< katex "=,\leq,\geq" >}} zwischen stetigen Funktionen definiert sind, sind abgeschlossen.

**Hausdorff:** ...

Eine Teilmenge von {{< katex "\mathbb{R}^n" >}} ist **kompakt**, wenn sie alle Randpunkte enthält und sich nicht ins Unendliche erstreckt. {{< katex "\mathbb{R}^n" >}} ist nicht kompakt.

**Satz von Heine-Borel:** Eine nicht-leere Teilmenge von {{< katex "\mathbb{R}^n" >}} ist genau dann kompakt, wenn sie abgeschlossen und beschränkt ist.

# Topologische Räume

Eine Topologie auf einer Menge {{< katex "X" >}} ist ein System {{< katex "T" >}} von Teilmengen von {{< katex "X" >}} mit folgenden Eigenschaften:

* {{< katex "\emptyset\in T" >}} und {{< katex "X\in T" >}}.
* Sind {{< katex "U,V\in T" >}}, so auch {{< katex "U\cap V\in T" >}}.
* Die Vereinigung beliebig vieler Mengen in {{< katex "T" >}} ist auch wieder in {{< katex "T" >}}.

{{< katex "(X,T)" >}} ist dann ein **topologischer Raum**.

Zum Beispiel bildet das System der offenen Mengen eines metrischen Raumes eine Topologie.

Man definiert daher eine Menge {{< katex "U\subseteq X" >}} als offen, wenn {{< katex "U\in T" >}}. {{< katex "T" >}} umfasst also alle offenen Mengen, sowie deren Durchschnitt und Vereinigung (wieder offene Mengen).

{{< katex "(X,T)" >}} heißt **Hausdorff-Raum**, wenn verschiedene Punkte in {{< katex "T" >}} disjunkte Umgebungen besitzen. Ein metrischer Raum mit dem System der offenen Mengen ist z.B. ein Hausdorff-Raum.

# Funktionen über metrischen Räumen

Wir betrachten dann Abbildungen zwischen metrischen Räumen, insbesondere stetige Funktionen {{< katex "f:X\to Y" >}} zwischen metrischen Räumen {{< katex "(X,d_X)" >}} und {{< katex "(Y,d_Y)" >}}
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

Die Ableitung ist der Proportionalitätsfaktor zwischen infinitesimalen Änderungen des Eingabewertes und daraus resultierenden infinitesimalen Änderungen des Funktionswertes.

Der erste Ableitungsbegriff entspricht dem Differentialquotienten (oder Differential), dem Grenzwert des Differenzenquotienten. Der Differenzenquotient ist die mittlere Änderungsrate der Funktion auf dem Intervall {{< katex "[x,x_0]" >}}, das entspricht geometrisch der Sekantensteigung:
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

Bei mehrdimensionalen Funktionen ist die **Richtungsableitung** die momentane relative Änderung des Funktionswertes {{< katex "f(x)" >}}, wenn sich der Wert {{< katex "x" >}} mit dem Vektor {{< katex "h" >}} fortbewegt. Sie beschreibt also ist das lokale Verhalten der Komponentenfunktion bei Änderung dieser Komponente. Das Differential weist im Prinzip jedem Vektor die Richtungsableitung in Richtung des Vektors zu.

Ein Spezialfall der Richtungsableitung ist die **partielle Ableitung**. Die partielle Ableitung einer Funktion mehrerer Veränderlicher ist nichts anderes als die Ableitung der Funktion, die man erhält, wenn man alle Veränderlichen bis auf eine festhält.

### Gradient


## Umkehrfunktion

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
