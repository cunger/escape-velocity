---
title: "Topologische, normierte und metrische Räume"
summary: "Sowie Funktionen, Folgen und Reihen in metrischen Räumen."
date: 2020-08-26
weight: 2
math: true
toc: true
draft: false
---

Ein Raum ist eine Menge von mathematischen Objekten zusammen mit einer Struktur.
Topologische Räume sind Räume, in denen es einen Nachbarschaftsbegriff gibt und wo man von stetigen Abbildungen sprechen kann, die benachbarte Elemente wieder auf benachbarte Elemente abbilden.
Man spricht von Eigenschaften oder Parametern als topologische Invariante, wenn sie unter solchen Abbildungen erhalten bleiben. Eine solche Invariante ist zum Beispiel die Dimension des Raumes, was für die [Analysis](../analysis) wichtig ist.

Andere interessante Räume ergeben sich dann, wenn eine Topologie mit einer anderen Struktur verträglich ist:
zum Beispiel topologische Gruppen, topologische Vektorräume
und darauf aufbauend normierte und metrische Räume (Vektorräume, in denen eine Norm oder Metrik eine zusätzliche Struktur vorgeben).

# Topologische Räume

Die mengentheoretische Topologie ist die Theorie von offenen und abgeschlossenen Mengen.

Eine Topologie auf einer Menge {{< katex "X" >}} ist definiert als System {{< katex "T" >}} von Teilmengen von {{< katex "X" >}} mit folgenden Eigenschaften:

* {{< katex "\emptyset" >}} und {{< katex "X" >}} sind in {{< katex "T" >}}.
* Der Schnitt zweier Mengen in {{< katex "T" >}} ist auch wieder in {{< katex "T" >}}.
* Die Vereinigung beliebig vieler Mengen in {{< katex "T" >}} ist auch wieder in {{< katex "T" >}}.

{{< katex "(X,T)" >}} ist dann ein **topologischer Raum**.

Man nennt die Mengen {{< katex "U\subseteq T" >}} **offen**, d.h. {{< katex "T" >}} umfasst alle offenen Mengen, sowie deren Durchschnitt und Vereinigung (wieder offene Mengen).
Eine Menge {{< katex "U" >}} ist **abgeschlossen**, wenn {{< katex "X\backslash U" >}} offen ist. So sind z.B. {{< katex "\emptyset" >}} und {{< katex "X" >}} beide nicht nur offen, sondern auch abgeschlossen. Für die Definition eines topologischen Raumes ist es tatsächlich gleich, ob man {{< katex "T" >}} als die offenen oder abgeschlossenen Mengen definiert.

**Beispiele:**

* _Triviale Topologie:_ {{< katex "T=\{\emptyset,X\}" >}}
* _Diskrete Topologie:_ {{< katex "T" >}} ist die Potenzmenge von {{< katex "X" >}}, d.h. alle Teilmengen von {{< katex "X" >}} sind offen.
* Die Menge {{< katex "\mathbb{R}" >}} der reellen Zahlen, wobei die offenen Mengen genau die {{< katex "U\subseteq\mathbb{R}" >}} sind, die sich als Vereinigung von offenen Intervallen darstellen lassen.

## Grundbegriffe

Eine Menge {{< katex "U" >}} heißt **Umgebung** von {{< katex "x\in X" >}}, wenn es eine offene Menge {{< katex "V\subset U" >}} gibt mit {{< katex "x\in V" >}}, d.h. wenn es eine offene Teilmenge von {{< katex "U" >}} gibt, in der {{< katex "x" >}} liegt.

Ein Punkt {{< katex "x" >}} ist für eine Menge {{< katex "M" >}}

* ein **Häufungspunkt**, wenn in jeder Umgebung von {{< katex "x" >}} unendlich viele Elemente der Menge liegen
* ein **innerer Punkt**, wenn {{< katex "M" >}} eine Umgebung von {{< katex "x" >}} ist
* ein **äußerer Punkt**, wenn {{< katex "X\backslash M" >}} eine Umgebung von {{< katex "x" >}} ist
* ein **Randpunkt**, wenn weder {{< katex "M" >}} noch {{< katex "X\backslash M" >}} eine Umgebung von {{< katex "x" >}} ist

Die Menge {{< katex "\mathring{M}" >}} aller inneren Punkte von {{< katex "M" >}} heißt das **Innere** oder der **offene Kern**.

Die Menge {{< katex "\overline{M}" >}} aller Punkte, die nicht äußere Punkte von {{< katex "M" >}} sind, heißt die **abgeschlossene Hülle**.

## Kompaktheit

Ein topologischer Raum {{< katex "(X,T)" >}} heißt **kompakt**, wenn jede offene Überdeckung

{{< katex "X=\bigcup_{i\in I} U_i" >}} mit {{< katex "U_i\in T" >}}

eine endliche Teilüberdeckung

{{< katex "X=\bigcup_{j\in J} U_j" >}} mit {{< katex "U_j\in T" >}} und {{< katex "J\subseteq I" >}} endlich

enthält.

Kompakte Räume kann man verstehen als eine Verallgemeinerung endlicher Räume. Zum Beispiel kann man mithilfe der Kompatkheit den Schritt von unendlich vielen Umgebungen zu endlich vielen machen und Beweise dann sehr ähnlich führen wie im endlichen Fall.

Eine Teilmenge {{< katex "M" >}} eines topologischen Raumes ist:
* **überdeckunsgkompakt**, wenn es zu jeder offenen Überdeckung {{< katex "M\subseteq \bigcup_{i\in I} U_i" >}} eine endliche Teilüberdeckung {{< katex "M\subseteq\bigcup_{j\in J} U_j" >}} gibt;
* **folgenkompakt**, wenn jede Folge in der Menge eine konvergente Teilfolge besitzt, deren Grenzwert zur Menge gehört (anders ausgedrückt: wenn jede Folge Häufungspunkte hat, die zur Menge gehören).

In beliebigen topologischen Räumen sind beide Arten von Kompaktheit nicht unbedingt gleich.

Eine Teilmenge von {{< katex "\mathbb{R}^n" >}} ist genau dann kompakt, wenn sie abgeschlossen und beschränkt ist (**Satz von Heine-Borel**). Sie darf keine Folgen enthalten, die entweder keinen Grenzwert haben oder gegen einen Grenzwert konvergieren, der nicht in der Menge liegt.

So sind zum Beispiele alle abgeschlossenen Intervalle in {{< katex "\mathbb{R}" >}} (wie {{< katex "[0,1]" >}}) kompakt, während offene und halboffene Intervalle nicht kompakt sind. {{< katex "\mathbb{R}^n" >}} selber ist nicht kompakt.

## Trennungseigenschaften

**Hausdorffsches Trennungsaxiom:** Ein topologischer Raum heißt **Hausdorff-Raum**, wenn man zu je zwei verschiedenen Punkten disjunkte Umgebungen finden kann.

Beispiele für Nicht-Hausdorff-Räume:

* Eine Menge {{< katex "X" >}} mit mehr als einem Element und der trivialen Topologie.

In einem Hausdorff-Raum kann eine Folge höchstens einen Grenzwert haben.
In einem trivialen topologischen Raum konvergiert jede Folge gegen jeden Punkt.

# Normierte und metrische Räume

Begriffe wie der der Umgebung, des Grenzwerts und der Konvergenz benutzen das Konzept des Abstandes. Konvergenz, zum Beispiel, kann man über die {{< katex "\varepsilon" >}}-Umgebung von {{< katex "x" >}} definieren (so dass jedes Folgenglied ab einem bestimmten {{< katex "n" >}} einen Abstand zu {{< katex "x" >}} hat, der kleiner als {{< katex "\varepsilon" >}} ist) oder direkt über den Abstand {{< katex "d" >}} zweier reeller Zahlen:

Eine reelle Folge {{< katex "(x_n)" >}} konvergiert gegen {{< katex "x" >}} gdw {{< katex "\text{lim}_{n\to\infty} d(x_n,x)=0" >}}.

Will man diese Begriffe verallgemeinern für andere mathematische Objekte, wie Folgen von Vektoren, komplexe Zahlen und Funktionen, müsste man sie spezifisch für jedes dieser Objekte neu definieren.
Viel effizienter ist es, eine allgemeine Klasse von Räumen zu definieren, zusammen mit einem allgemeinen Konzept für Abstand zwischen Objekten in diese Räumen und darauf aufbauend allgemeine Begriffe wie den der Konvergenz.

**Metrische Räume** sind Räume, auf denen ein Abstandsbegriff definiert ist. Eine **Metrik** ist eine Abbildung {{< katex "d" >}} zweier Vektoren auf eine reelle Zahl, die den Abstand zwischen diesen Vektoren ausdrückt, also die folgenden Eigenschaften erfüllt:

* {{< katex "d(x,y)\geq 0" >}} (Positive Definitheit)
* {{< katex "d(x,y)=d(y,x)" >}} (Symmetrie)
* {{< katex "d(x,y)\leq d(x,z) + d(z,y)" >}} (Dreiecksungleichung)

**Normierte Räume** sind Vektorräume, auf denen eine Norm definiert ist, die die Länge bzw. Größe eines Vektors ausdrückt.
Eine **Norm** {{< katex "\|x\|" >}} ist eine Abbildung eines Vektors {{< katex "x" >}} auf eine reelle Zahl (die Länge bzw. Größe des Vektors), die die folgenden Eigenschaften erfüllt:

* {{< katex "\|x\|\geq 0" >}} und {{< katex "\|x\| = 0" >}} gdw {{< katex "x = 0" >}} (Definitheit, es reicht zu zeigen: {{< katex "\|x\| = 0\Rightarrow x = 0" >}})
* {{< katex "\|\alpha x\| = |\alpha| \|x\|" >}} für alle {{< katex "\alpha\in\mathbb{R}" >}} (Homogenität)
* {{< katex "\|x+y\| \leq \|x\| + \|y\|" >}} (Dreiecksungleichung)

Eine Norm setzt eine lineare Struktur voraus, ist also nur für Vektorräume definiert.
Beispiele:

* {{< katex "\mathbb{R}^1" >}} mit dem Betrag {{< katex "|\cdot|" >}}
* {{< katex "\mathbb{R}^n" >}} mit der p-Norm {{< katex "\|x\|_p := \left(\sum_{k=1}^n |x_k|^p\right)^{\frac{1}{p}}" >}}

  Spezialfälle:
    * {{< katex "\|\cdot\|_1" >}} Summennorm
    * {{< katex "\|\cdot\|_2" >}} euklidische Norm
    * {{< katex "\|x\|_\infty := \text{max}\,\{|x_k|\,\mid\,1\leq k\leq n\}" >}} Maximumnorm
* Vektorraum aller beschränkten Funktionen {{< katex "f:M\to Y" >}} mit der Supremumsnorm {{< katex "\|f\|_\infty := \sup_{x\in M}\|f(x)\|_Y" >}}

Eine Norm kann vom Skalarprodukt {{< katex "\langle\cdot,\cdot\rangle" >}} abgeleitet werden:
{{< katex display="\|x\| = \sqrt{\langle x,x\rangle}" >}}
Und jede Norm induziert eine Metrik (aber nicht zwangsläufig umgekehrt), nämlich:
{{< katex display="d(x,y) = \|x-y\|" >}}
D.h. der Abstand zweier Vektoren wird definiert als die Länge des Differenzvektors.
Jeder normierte Raum ist also auch ein metrischer Raum. Aber nicht zwangsläufig umgekehrt: Ein metrischer Raum ist nicht unbedingt ein Vektorraum, denn eine Metrik muss die lineare Struktur eines Raumes nicht respektieren.

Beispiele für Metriken, die von keiner Norm induziert werden:

* Diskrete Metrik {{< katex "d(x,y) := \begin{cases} 0 & \text{wenn }x=y \\ 1 & \text{sonst}\end{cases}" >}}
* Französische Eisenbahnmetrik (wo die Abstandsmessung immer durch einen zentralen Punkt {{< katex "P" >}} gehen muss)
{{< katex display="d(x,y) := \begin{cases} \|x-y\| & \text{wenn }x,y\text{ auf einer Geraden durch }P\text{ liegen} \\ \|x-P\| + \|P-y\| & \text{sonst}\end{cases}" >}}
* p-adische Metrik auf {{< katex "\mathbb{Z}" >}}

Alle Normen über einem endlich-dimensionalen Vektorraum {{< katex "\mathbb{R}^n" >}} sind bis auf eine Konstante (d.h. bis auf Streckung oder Stauchung) äquivalent, d.h. es gibt {{< katex "c_1,c_2" >}}, so dass {{< katex "\|x\|_a \leq c_1\|x\|_b" >}} und {{< katex "\|x\|_b\leq c_2 \|x\|_a" >}}. Sie induzieren also die gleiche Topologie. So kann man z.B. bestimmte Eigenschaften auf der Maximumsnorm zeigen, wo sie einfacher zu beweisen sind, und dann auf äquivalente Normen übertragen.

Ein normierter Raum ist genau dann **vollständig**, wenn jede Cauchy-Folge konvergiert. Vollständige Räume umfassen immer geschlossene Mengen, es gibt also keine Lücken im Raum. Ein vollständiger normierter Raum heißt **Banachraum**. Zum Beispiel ist jeder endlich-dimensionale Raum über {{< katex "\mathbb{R}" >}} (also {{< katex "\mathbb{R}^n" >}}) mit einer beliebigen Norm vollständig.

## Metrische und normierte Räume als topologische Räume

In einem metrischen Raum {{< katex "(M,d)" >}} lässt sich eine {{< katex "\varepsilon" >}}-Umgebung {{< katex "U_\varepsilon" >}} von {{< katex "x_0" >}} definieren als {{< katex "\{ x\in M \,|\, d(x,x_0) < \varepsilon \}" >}}. Eine Menge {{< katex "U" >}} heißt **Umgebung** von {{< katex "x_0" >}}, wenn es ein {{< katex "\varepsilon" >}} gibt, so dass {{< katex "U_\varepsilon(x_0)\subseteq U" >}}.

Ein Punkt {{< katex "x" >}} ist **Häufungspunkt** einer Menge, wenn in jeder {{< katex "\varepsilon" >}}-Umgebung {{< katex "U_\varepsilon(x)" >}} mindestens ein von {{< katex "x" >}} verschiedenes Element liegt. (Es liegen dann sogar unendlich viele Elemente der Menge in jeder {{< katex "\varepsilon" >}}-Umgebung.)
Zum Beispiel ist jede rationale Zahl Häufungspunkt der irrationalen Zahlen und umgekehrt.

Auf normierte Räume übertragen sich diese Definitionen, indem man die durch die Norm induzierte Metrik betrachtet.

* Eine Menge {{< katex "M" >}} ist **offen** bzgl. einer Norm, wenn {{< katex "M" >}} Umgebung von jedem {{< katex "x\in M" >}} ist, d.h. wenn es zu jedem {{< katex "x\in M" >}} eine {{< katex "\varepsilon" >}}-Umgebung von {{< katex "x" >}} gibt, die ganz in {{< katex "M" >}} liegt. Eine Menge ist also genau dann offen, wenn sie nur aus inneren Punkten besteht, d.h. keinen ihrer Randpunkte enthält.

* Eine Menge ist **geschlossen** bzgl. einer Norm, wenn es für jeden Punkt außerhalb der Menge eine {{< katex "\varepsilon" >}}-Umgebung gibt, die auch außerhalb liegt. Das heißt eine Menge ist genau dann geschlossen, wenn sie alle ihre Häufungspunkte enthält.

Eine Teilmenge von {{< katex "\mathbb{R}^n" >}} ist offen oder geschlossen unabhängig davon, welche Norm betrachtet wird.

**Faustregeln:**

* Offene Intervalle in {{< katex "\mathbb{R}" >}} sind offen, abgeschlossene Intervalle sind abgeschlossen.

  Die Grundmenge ist hierbei wichtig. Zum Beispiel ist {{< katex "[0,1)" >}} nicht offen in {{< katex "\mathbb{R}" >}}, aber offen in {{< katex "[0,\infty)" >}}. Analog ist {{< katex "[0,1)" >}} nicht abgeschlossen in {{< katex "\mathbb{R}" >}}, aber abgeschlossen in {{< katex "(-1,1)" >}}.

* Mengen, die mit strikten Ungleichungen zwischen stetigen Funktionen definiert sind, sind offen (z.B. {{< katex "\{(x,y)\in\mathbb{R}^2 \,|\, x<y^2\}" >}}).

* Mengen, die mit {{< katex "=,\leq,\geq" >}} zwischen stetigen Funktionen definiert sind, sind abgeschlossen (z.B. {{< katex "\{(x,y)\in\mathbb{R}^2 \,|\, x\leq y^2\}" >}}).

Das System der offenen Mengen eines metrischen Raumes bildet eine Topologie.
Ein metrischer Raum mit dem System der offenen Mengen ist außerdem ein Hausdorff-Raum.

Für jede Metrik {{< katex "d" >}} ist auch {{< katex "d'(x,y):=\frac{d(x,y)}{1+d{x,y}}" >}} eine Metrik und die erzeugte Topologie ist die gleiche.

# Funktionen über metrischen Räumen

Wir betrachten Abbildungen zwischen metrischen Räumen, insbesondere stetige Funktionen {{< katex "f:X\to Y" >}} zwischen metrischen Räumen {{< katex "(X,d_X)" >}} und {{< katex "(Y,d_Y)" >}}
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

## Stetigkeit

* **Umgebungskriterium:**

  Topologisch bedeutet Stetigkeit einer Abbildung, dass sie die Nähe zwischen Elementen erhält, also im Sinne der Topologie strukturerhaltend ist. Das kann mithilfe von Umgebungen definiert werden.

  {{< katex "f:M\to\mathbb{R}" >}} ist **stetig im Punkt** {{< katex "p\in M" >}} genau dann, wenn gilt:
  Zu jeder Umgebung {{< katex "V" >}} von {{< katex "f(p)" >}} gibt es eine Umgebung {{< katex "U" >}} von {{< katex "p" >}}, so dass {{< katex "f(U\cap M)\subseteq V" >}} (d.h. für alle {{< katex "x\in U\cap M" >}} gilt, dass {{< katex "f(x)\in V" >}}).

  Anders ausgedrückt ist {{< katex "f" >}} genau dann stetig in {{< katex "p\in M" >}}, wenn für jede Umgebung {{< katex "V" >}} von {{< katex "f(p)" >}} die Menge {{< katex "f^{-1}(V)" >}} eine Umgebung von {{< katex "p" >}} ist.

  {{< katex "f:M\to\mathbb{R}" >}} ist **stetig** genau dann, wenn gilt: Für alle offenen Mengen {{< katex "U" >}} ist {{< katex "f^{-1}(U)" >}} offen in M. (Die Urbilder offener Mengen sind offen. Das gilt analog auch für abgeschlossene Mengen.)

* **{{< katex "\varepsilon-\delta" >}}-Kriterium:**

  Hinreichend kleine Änderungen des Arguments ziehen nur beliebig kleine Änderungen des Funktionswertes nach sich.

  {{< katex "f" >}} ist stetig in {{< katex "p" >}}, wenn es für alle {{< katex "\varepsilon > 0" >}} ein {{< katex "\delta > 0" >}} gibt, so dass für alle {{< katex "x\in X" >}} gilt:
{{< katex display="d_X(x,p) < \delta \Rightarrow d_Y(f(x),f(p)) < \varepsilon" >}}

  Das garantiert Approximierbarkeit der Funktion: Für jeden maximalen Fehler {{< katex "\varepsilon" >}} und eine Stelle {{< katex "p" >}} findet man ein {{< katex "\delta" >}}, so dass sich jeder Funktionswert {{< katex "f(x)" >}} für Argumente {{< katex "x" >}} in der Umgebung {{< katex "U_\delta(p)" >}} um maximal {{< katex "\varepsilon" >}} von {{< katex "f(p)" >}} unterscheiden.

  ![Non-uniform approximation](https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Nonuniform_approximation_of_a_function.svg/350px-Nonuniform_approximation_of_a_function.svg.png)

  (Quelle: [Serlo](https://de.wikibooks.org/wiki/Mathe_für_Nicht-Freaks:_Gleichmäßige_Stetigkeit))

* **Folgenkriterium:**

  {{< katex "f" >}} ist stetig in {{< katex "p" >}}, wenn für jede Folge {{< katex "(x_n)" >}} in {{< katex "X" >}} mit {{< katex "\lim_{n\to\infty} x_n = p" >}} gilt:
  {{< katex display="\lim_{n\to\infty} f(x_n) = f(\lim_{n\to\infty} x_n) = f(p)" >}}

Weitere, stärkere Arten von Stetigkeit:

* **Gleichmäßige Stetigkeit**

  {{< katex "\delta" >}} ist global, hängt also nicht mehr von der Stelle der Funktion ab.

  {{< katex "f" >}} ist gleichmäßig stetig, wenn es für alle {{< katex "\varepsilon > 0" >}} ein {{< katex "\delta > 0" >}} gibt, so dass für alle {{< katex "x,y\in X" >}} gilt:
  {{< katex display="d_X(x,y) < \delta \Rightarrow d_Y(f(x),f(y)) < \varepsilon" >}}

  Das entspricht einer gleichmäßigen Approximierbarkeit.

  ![Uniform approximation](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Uniform_approximation_of_a_function.svg/350px-Uniform_approximation_of_a_function.svg.png)

  (Quelle: [Serlo](https://de.wikibooks.org/wiki/Mathe_für_Nicht-Freaks:_Gleichmäßige_Stetigkeit))

* **Lipschitz-Stetigkeit**

  {{< katex "f" >}} ist Lipschitz-stetig mit Lipschitz-Konstante {{< katex "L" >}} (oder _dehnungsbeschränkt_), wenn für alle {{< katex "p,q\in X" >}} gilt:
  {{< katex display="d_Y(f(p),f(q)) \leq L\cdot d_X(p,q)" >}}
  {{< katex display="\|(f(p)-f(q))\|_Y \leq L\cdot \|p-q\|_X" >}}

  Das heißt, der Abstand zweier Punkte {{< katex "x,x'" >}} wird durch Anwendung der Funktion höchstens um den Faktor {{< katex "L" >}} gestreckt (wenn {{< katex "L > 1" >}}) oder gestaucht (wenn {{< katex "L<1" >}}).

* **Hölder-Stetigkeit**

  {{< katex "f" >}} ist Hölder-stetig zum Exponenten {{< katex "\alpha\in(0,\infty)" >}}, wenn es eine Konstante {{< katex "C>0" >}} gibt, so dass für alle {{< katex "p,q\in X" >}} gilt:
  {{< katex display="d_Y(f(p),f(q)) \leq C\cdot d_X(p,q)^\alpha" >}}
  {{< katex display="\|(f(p)-f(q))\|_Y \leq C\cdot \|p-q\|_X^\alpha" >}}

Diese Begriffe lassen sich ihrer Stärke nach ordnen:

  Hölder-stetig {{< katex "\Rightarrow" >}} Lipschitz-stetig {{< katex "\Rightarrow" >}} gleichmäßig stetig {{< katex "\Rightarrow" >}} stetig

Die Umkehrungen gelten im allgemeinen nicht, zum Beispiel ist {{< katex "f(x)=x^2" >}} stetig, aber nicht gleichmäßig stetig oder Lipschitz-stetig.

In einem Punkt {{< katex "a" >}} stetig fortsetzbar?
Wenn {{< katex "a" >}} kein Häufungspunkt, dann immer. Wenn {{< katex "a" >}} Häufungspunkt, dann nur wenn {{< katex "f" >}} in {{< katex "a" >}} konvergiert.

## Umkehrfunktionen

[Tao 6.7 (p. 152ff)]

# Folgen und Reihen in metrischen Räumen

Eine **reelle Folge** ist eine Abbildung {{< katex "f:\mathbb{N}\to\mathbb{R}" >}}. (Eine Folge hat also immer unendlich viele Elemente.)

## Folgen von Punkten in einem metrischen Raum

**Konvergenz im metrischen Raum**:
(x^k)\to a gdw d(x^k,a)\to 0
rechts ist Konvergenz im R
In vollständigen Räumen: wenn (x^k) eine Cauchyfolge ist, also der Abstand zwischen zwei Folgengliedern beleibig klein wird

**Konvergenz im topologischen Raum**:
(x^k)\to a gdw für alle Umgebungen von a gilt, dass ab einem k_0 alle x^k (m>=k_0) in dieser Umgebung liegen.

Der Grenzwert einer Folge ist immer auch Häufungspunkt. In einem metrischen Raum kann eine Folge mehrere Häufungspunkte haben, aber nur einen Grenzwert (Hausdorff).

Folgen von Funktionen zwischen metrischen Räumen
+ Konvergenz:

  * punktweise Konvergenz
  * gleichmäßige Konvergenz
  * andere Konvergenzen (z.B. {{< katex "L^1" >}}- und {{< katex "L^2" >}}-Konvergenz)

Reihen von Funktionen

# Literatur

* Wolfgang Beekmann: Skript Analysis (1144), FernUniversität Hagen.
* Klaus Jänisch: Topologie.
