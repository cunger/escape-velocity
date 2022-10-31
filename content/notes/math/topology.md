---
title: "Topologie"
summary: "Topologische, normierte und metrische Räume."
date: 2020-08-26
weight: 4
math: true
toc: true
draft: false
---

Ein Raum ist eine Menge von mathematischen Objekten zusammen mit einer Struktur.
Topologische Räume sind Räume, in denen es einen Nachbarschaftsbegriff gibt und wo man von stetigen Abbildungen sprechen kann, die benachbarte Elemente wieder auf benachbarte Elemente abbilden.
Man spricht von Eigenschaften oder Parametern als topologische Invariante, wenn sie unter solchen Abbildungen erhalten bleiben. Eine solche Invariante ist zum Beispiel die Dimension des Raumes, was für die Analysis wichtig ist.

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

Beispiele:

* **Triviale Topologie:** {{< katex "T=\{\emptyset,X\}" >}}
* **Diskrete Topologie:** {{< katex "T" >}} ist die Potenzmenge von {{< katex "X" >}}, d.h. alle Teilmengen von {{< katex "X" >}} sind offen.
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

## Trennungseigenschaften

**Hausdorffsches Trennungsaxiom:** Ein topologischer Raum heißt **Hausdorff-Raum**, wenn man zu je zwei verschiedenen Punkten disjunkte Umgebungen finden kann.

Jeder metrische Raum ist ein Hausdorff-Raum.

Beispiele für Nicht-Hausdorff-Räume:

* Eine Menge {{< katex "X" >}} mit mehr als einem Element und der trivialen Topologie (da dann jede Umgebung automatisch die ganze Menge enthält).

In einem Hausdorff-Raum kann eine Folge höchstens einen Grenzwert haben.
In einem trivialen topologischen Raum konvergiert jede Folge gegen jeden Punkt.

## Kompaktheit

Ein topologischer Raum {{< katex "(X,T)" >}} heißt **kompakt**, wenn jede offene Überdeckung

{{< katex "X=\bigcup_{i\in I} U_i" >}} mit {{< katex "U_i\in T" >}} (und {{< katex "U_i" >}} offen)

eine endliche Teilüberdeckung

{{< katex "X=\bigcup_{j\in J} U_j" >}} mit {{< katex "U_j\in T" >}} und {{< katex "J\subseteq I" >}} endlich

enthält. Und eine Teilmenge {{< katex "A\subset X">}} ist genau dann kompakt, wenn {{< katex "(A,T)" >}} kompakt ist.

Wichtig ist nicht, dass es eine endliche Überdeckung gibt (die gibt es immer), sondern dass man aus jeder beliebigen Überdeckung eine endliche auswählen kann. Zum Beispiel ist {{< katex "X:=\{\frac{1}{n}\,\mid\,n\in\mathbb{N}_+\}">}} nicht kompakt, da man für die Überdeckung, in der jede Umgebung genau einen Punkt enthält (z.B. {{< katex "U_n=(\frac{1}{n+1},\frac{1}{n-1})">}}) keine endliche Teilüberdeckung finden kann. Anders sieht das aus, wenn es um die Punkte einer konvergenten Folge geht und ihr Grenzwert enthalten ist: Da es in jeder Überdeckung eine Umgebung gibt, die den Grenzwert enthält, liegen schon alle bis auf endlich viele Punkte in dieser Umgebung (und man muss nur noch endlich viele weitere Umgebungen für die endlich vielen anderen Punkte auswählen).

Kompakte Räume kann man verstehen als eine Verallgemeinerung endlicher Räume. Zum Beispiel kann man mithilfe der Kompaktheit den Schritt von unendlich vielen Umgebungen zu endlich vielen machen und Beweise dann sehr ähnlich führen wie im endlichen Fall.

Kompaktheit nach der obigen Definition heißt auch **überdeckunsgkompakt**. Zusätzlich ist ein topologischer Raum **folgenkompakt**, wenn jede Folge in der Menge eine konvergente Teilfolge besitzt, deren Grenzwert zur Menge gehört (anders ausgedrückt: wenn jede Folge Häufungspunkte hat, die zur Menge gehören). Metrische Räume sind überdeckungskompakt genau dann, wenn sie folgenkompakt sind, aber in beliebigen topologischen Räumen sind diese beiden Arten von Kompaktheit nicht unbedingt gleich.

Jede überdeckungskompakte Menge ist beschränkt.
Wenn ein metrischer Raum kompakt ist, dann ist er abgeschlossen und beschränkt; für Teilmengen von {{< katex "\mathbb{R}^n" >}} gilt auch die Umkehrung (**Satz von Heine-Borel**). So sind zum Beispiele alle abgeschlossenen Intervalle in {{< katex "\mathbb{R}" >}} (wie {{< katex "[0,1]" >}}) kompakt, während offene und halboffene Intervalle nicht kompakt sind. {{< katex "\mathbb{R}^n" >}} selber ist nicht kompakt. {{< katex "\mathbb{N}" >}} ist auch nicht kompakt.

# Normierte und metrische Räume

Begriffe wie der der Umgebung, des Grenzwerts und der Konvergenz benutzen das Konzept des Abstandes. Konvergenz, zum Beispiel, kann man über die {{< katex "\varepsilon" >}}-Umgebung von {{< katex "x" >}} definieren (so dass jedes Folgenglied ab einem bestimmten {{< katex "n" >}} einen Abstand zu {{< katex "x" >}} hat, der kleiner als {{< katex "\varepsilon" >}} ist) oder direkt über den Abstand {{< katex "d" >}} zweier reeller Zahlen:

Eine reelle Folge {{< katex "(x_n)" >}} konvergiert gegen {{< katex "x" >}} gdw {{< katex "\text{lim}_{n\to\infty} d(x_n,x)=0" >}}.

Will man diese Begriffe verallgemeinern für andere mathematische Objekte, wie Folgen von Vektoren, komplexe Zahlen und Funktionen, müsste man sie spezifisch für jedes dieser Objekte neu definieren.
Viel effizienter ist es, eine allgemeine Klasse von Räumen zu definieren, zusammen mit einem allgemeinen Konzept für Abstand zwischen Objekten in diesen Räumen, und darauf aufbauend allgemeine Begriffe wie den der Konvergenz.

**Metrische Räume** sind Räume, auf denen ein Abstandsbegriff definiert ist. Eine **Metrik** ist eine Abbildung {{< katex "d" >}} zweier Vektoren auf eine reelle Zahl, die den Abstand zwischen diesen Vektoren ausdrückt, indem sie die folgenden Eigenschaften erfüllt:

* {{< katex "d(x,y)\geq 0" >}} (Positive Definitheit)
* {{< katex "d(x,y)=d(y,x)" >}} (Symmetrie)
* {{< katex "d(x,y)\leq d(x,z) + d(z,y)" >}} (Dreiecksungleichung)

**Normierte Räume** sind Vektorräume, auf denen eine Norm definiert ist, die die Länge oder Größe eines Vektors ausdrückt (z.B. im Fall von Koordinatenvektoren der Abstand des Punktes zum Koordinatenursprung).

Eine **Norm** {{< katex "\|x\|" >}} ist eine Abbildung eines Vektors {{< katex "x" >}} auf eine reelle Zahl (die Länge des Vektors), die die folgenden Eigenschaften erfüllt:

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

* Diskrete (oder triviale) Metrik {{< katex "d(x,y) := \begin{cases} 0 & \text{wenn }x=y \\ 1 & \text{sonst}\end{cases}" >}}
* Französische Eisenbahnmetrik (wo die Abstandsmessung immer durch einen zentralen Punkt {{< katex "P" >}} gehen muss)
{{< katex display="d(x,y) := \begin{cases} \|x-y\| & \text{wenn }x,y\text{ auf einer Geraden durch }P\text{ liegen} \\ \|x-P\| + \|P-y\| & \text{sonst}\end{cases}" >}}
* p-adische Metrik auf {{< katex "\mathbb{Z}" >}}

Alle Normen über einem endlich-dimensionalen Vektorraum {{< katex "\mathbb{R}^n" >}} sind bis auf eine Konstante (d.h. bis auf Streckung oder Stauchung) äquivalent, d.h. es gibt {{< katex "c_1,c_2" >}}, so dass {{< katex "\|x\|_a \leq c_1\|x\|_b" >}} und {{< katex "\|x\|_b\leq c_2 \|x\|_a" >}}. Sie induzieren also die gleiche Topologie. So kann man z.B. bestimmte Eigenschaften auf der Maximumsnorm zeigen, wo sie einfacher zu beweisen sind, und dann auf äquivalente Normen übertragen.

Ein normierter Raum ist genau dann **vollständig**, wenn jede Cauchy-Folge konvergiert. Vollständige Räume umfassen immer geschlossene Mengen, es gibt also keine Lücken im Raum. Ein vollständiger normierter Raum heißt **Banachraum**. Zum Beispiel ist jeder endlich-dimensionale Raum über {{< katex "\mathbb{R}" >}} (also {{< katex "\mathbb{R}^n" >}}) mit einer beliebigen Norm vollständig.

## Metrische und normierte Räume als topologische Räume

In einem metrischen Raum {{< katex "(M,d)" >}} lässt sich eine {{< katex "\varepsilon" >}}-Umgebung {{< katex "U_\varepsilon" >}} von {{< katex "x_0" >}} definieren als:
{{< katex display="U_\varepsilon(x_0)=\{ x\in M \,|\, d(x,x_0) < \varepsilon \}" >}}
Eine Menge {{< katex "U" >}} heißt **Umgebung** von {{< katex "x_0" >}}, wenn es ein {{< katex "\varepsilon" >}} gibt, so dass {{< katex "U_\varepsilon(x_0)\subseteq U" >}}.

Ein Punkt {{< katex "x" >}} ist **Häufungspunkt** einer Menge, wenn in jeder {{< katex "\varepsilon" >}}-Umgebung {{< katex "U_\varepsilon(x)" >}} mindestens ein von {{< katex "x" >}} verschiedenes Element liegt. (Es liegen dann sogar unendlich viele Elemente der Menge in jeder {{< katex "\varepsilon" >}}-Umgebung.)
Zum Beispiel ist jede rationale Zahl Häufungspunkt der irrationalen Zahlen und umgekehrt.
Auf normierte Räume übertragen sich diese Definitionen, indem man die durch die Norm induzierte Metrik betrachtet.

Nun ist jeder metrische Raum auch ein topologischer Raum (und sogar ein Hausdorff-Raum), mit der folgenden induzierten Topologie:

* Eine Menge {{< katex "M" >}} ist **offen**, wenn es für jedes {{< katex "x\in M" >}} eine {{< katex "\varepsilon" >}}-Umgebung von {{< katex "x" >}} gibt, die ganz in {{< katex "M" >}} liegt. Eine Menge ist also genau dann offen, wenn sie nur aus inneren Punkten besteht, d.h. keinen ihrer Randpunkte enthält.

* Eine Menge ist **geschlossen**, wenn es für jeden Punkt außerhalb der Menge eine {{< katex "\varepsilon" >}}-Umgebung gibt, die auch außerhalb liegt. Das heißt eine Menge ist genau dann geschlossen, wenn sie alle ihre Häufungspunkte enthält.

Zum Beispiel induziert die diskrete Metrik die diskrete Topologie, unter der alle Teilmengen offen sind.

Eine Teilmenge von {{< katex "\mathbb{R}^n" >}} ist offen oder geschlossen unabhängig davon, welche Metrik bzw. Norm betrachtet wird.

**Faustregeln:**

* Offene Intervalle in {{< katex "\mathbb{R}" >}} sind offen, abgeschlossene Intervalle sind abgeschlossen.

  Die Grundmenge ist hierbei wichtig. Zum Beispiel ist {{< katex "[0,1)" >}} nicht offen in {{< katex "\mathbb{R}" >}}, aber offen in {{< katex "[0,\infty)" >}}. Analog ist {{< katex "[0,1)" >}} nicht abgeschlossen in {{< katex "\mathbb{R}" >}}, aber abgeschlossen in {{< katex "(-1,1)" >}}.

* Mengen, die mit strikten Ungleichungen zwischen stetigen Funktionen definiert sind, sind offen (z.B. {{< katex "\{(x,y)\in\mathbb{R}^2 \,|\, x<y^2\}" >}}).

* Mengen, die mit {{< katex "=,\leq,\geq" >}} zwischen stetigen Funktionen definiert sind, sind abgeschlossen (z.B. {{< katex "\{(x,y)\in\mathbb{R}^2 \,|\, x\leq y^2\}" >}}).

Für jede Metrik {{< katex "d" >}} ist auch {{< katex "d'(x,y):=\frac{d(x,y)}{1+d{x,y}}" >}} eine Metrik und die erzeugte Topologie ist die gleiche.

# Stetige Funktionen auf topologischen Räumen

Sind Definitions- und Wertebereich einer Funktion topologische Räume, so ist die Wahl der Topologie entscheidend für die Stetigkeit der Funktion. Stetigkeit lässt sich in diesem Kontext allgemein wie folgt definieren:
Sind {{< katex "(X,T_X)">}} und {{< katex "(Y,T_Y)">}} topologische Räume, dann ist eine Funktion {{< katex "f:X\to Y">}} **stetig** in {{< katex "x\in X">}}, wenn für jede Umgebung {{< katex "U">}} von {{< katex "f(x)">}} (bzgl. {{< katex "(X,T_X)">}}) das Urbild {{< katex "f^{-1}(U)">}} eine Umgebung von {{< katex "x">}} (bzgl. {{< katex "(Y,T_Y)">}}) ist.

Eine Abbildung zwischen topologischen Räumen ist genau dann stetig, wenn das Urbild jeder offenen (oder abgeschlossenen) Menge auch offen (oder abgeschlossen) ist.

Stetige Abbildungen erhalten Kompaktheit: Seien {{< katex "X,Y">}} Hausdorff-Räume und {{< katex "f:X\to Y">}} eine stetige Abbildung. Ist {{< katex "A\subset X">}} kompakt, so ist auch {{< katex "f(A)\subset Y">}} kompakt. Wenn {{< katex "X,Y">}} metrische Räume sind, ist {{< katex "f">}} sogar gleichmäßig stetig.

Für reellwertige, stetige Funktionen gilt der **Satz von Weierstraß**:
Eine stetige Funktion {{< katex "f:A\to\mathbb{R}">}}, die auf einer kompakten Teilmenge {{<katex "A">}} eines Hausdorff-Raumes definiert ist, ist beschränkt und nimmt ihr Minimum und Maximum an.

# Folgen und Reihen

Eine **Folge** ist eine Abbildung mit {{< katex "\mathbb{N}" >}} als Wertebereich.
Eine reelle Folge z.B. ist eine Abbildung {{< katex "f:\mathbb{N}\to\mathbb{R}" >}}.
(Eine Folge hat also immer unendlich viele Elemente.)

## Konvergenz von Folgen von Punkten in einem Raum

Konvergenz lässt sich über Umgebungen und Abstände definieren, die Idee ist jeweils die gleiche.

**Konvergenz im topologischen Raum**:
Eine Folge {{< katex "(x^n)" >}} konvergiert gegen {{< katex "x" >}} genau dann, wenn für jede Umgebung von {{< katex "x" >}} gilt, dass es ein {{< katex "n_0\in\mathbb{N}" >}} gibt, so dass für alle {{< katex "n\geq n_0" >}} gilt, dass {{< katex "x_n" >}} in dieser Umgebung liegt (dass also ab einem bestimmten Element alle Folgenglieder in der Umgebung liegen).

**Konvergenz im metrischen Raum**:
Eine Folge {{< katex "(x^n)" >}} konvergiert gegen {{< katex "x" >}} genau dann, wenn es für jedes {{< katex "\varepsilon > 0" >}} ein {{< katex "n_0\in\mathbb{N}" >}} gibt, so dass für alle {{< katex "n\geq n_0" >}} gilt, dass {{< katex "d(x_n,x)<\varepsilon" >}}.

Konvergente Folgen sind immer **Cauchy-Folgen**, d.h. für jedes {{< katex "\varepsilon > 0" >}} gibt es ein {{< katex "n_0\in\mathbb{N}" >}}, so dass für alle {{< katex "m,n\geq n_0" >}} gilt, dass {{< katex "d(x_n,x_m)<\varepsilon" >}} (der Abstand zwischen Folgengliedern wird also ab einem bestimmten Index beliebig klein). Die Umkehrung gilt nicht immer.

Das Cauchy-Kriterium für Konvergenz ist vor allem dann praktisch, wenn man den Wert nicht kennt, gegen den die Folge konvergiert.

Ein Raum heißt **vollständig**, wenn jede Cauchy-Folge in diesem Raum konvergiert (d.h. ihr Grenzwert auch in der Grundmenge liegt).

Der Grenzwert einer Folge ist immer auch Häufungspunkt. In einem metrischen Raum kann eine Folge mehrere Häufungspunkte haben, aber nur einen Grenzwert (Hausdorff).

## Konvergenz von Folgen von Funktionen zwischen Räumen

* punktweise Konvergenz
* gleichmäßige Konvergenz
* andere Konvergenzen (z.B. {{< katex "L^1" >}}- und {{< katex "L^2" >}}-Konvergenz)
