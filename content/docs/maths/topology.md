---
title: "Topologie"
summary: "German notes on topology. In progress."
date: 2020-08-26
weight: 2
math: true
toc: true
draft: false
---

Ein **Raum** ist eine Menge von mathematischen Objekten, typischerweise mit irgendeiner Art von Struktur.

# Topologische Räume

Eine Topologie auf einer Menge {{< katex "X" >}} ist ein System {{< katex "T" >}} von Teilmengen von {{< katex "X" >}} mit folgenden Eigenschaften:

* {{< katex "\emptyset\in T" >}} und {{< katex "X\in T" >}}.
* Sind {{< katex "U,V\in T" >}}, so auch {{< katex "U\cap V\in T" >}}.
* Die Vereinigung beliebig vieler Mengen in {{< katex "T" >}} ist auch wieder in {{< katex "T" >}}.

{{< katex "(X,T)" >}} ist dann ein **topologischer Raum**. Man nennt die Mengen {{< katex "U\subseteq T" >}} offen, d.h. {{< katex "T" >}} umfasst alle offenen Mengen, sowie deren Durchschnitt und Vereinigung (wieder offene Mengen).

Beispiele:

* _Triviale Topologie:_ {{< katex "T=\{\emptyset,X\}" >}}
* _Diskrete Topologie:_ {{< katex "T" >}} ist die Potenzmenge von {{< katex "X" >}}, d.h. alle Teilmengen von {{< katex "X" >}} sind offen.
* Die Menge {{< katex "\mathbb{R}" >}} der reellen Zahlen, wobei die offenen Mengen genau die {{< katex "U\subseteq\mathbb{R}" >}} sind, die sich als Vereinigung von offenen Intervallen darstellen lassen.

Eine Menge {{< katex "U" >}} ist **abgeschlossen**, wenn {{< katex "X\U" >}} offen ist. So sind z.B. {{< katex "\emptyset" >}} und {{< katex "X" >}} beide nicht nur offen, sondern auch abgeschlossen.

Eine Menge {{< katex "U" >}} heißt **Umgebung** von {{< katex "x\in X" >}}, wenn es eine offene Menge {{< katex "V\subset U" >}} gibt mit {{< katex "x\in V" >}}, d.h. wenn es eine offene Teilmenge von {{< katex "U" >}} gibt, in der {{< katex "x" >}} liegt.

## Grundbegriffe

Haeufugspunkt
innerer und äusserer Punkt, Randpunkt,
das Innere und abgeschlossene Huelle

## Trennungseigenschaften

**Hausdorffsches Trennungsaxiom:** Ein topologischer Raum heißt **Hausdorff-Raum**, wenn man zu je zwei verschiedenen Punkten disjunkte Umgebungen finden kann.

In einem Hausdorff-Raum kann eine Folge hoechstens einen Grenzwert haben.
Beispiele fuer Nicht-Hausdorff-Raume: Eine Menge X mit mehr als einem Element und der trivialen Topologie.
In einem trivialen topologischen Raum konvergiert jede Folge gegen jeden Punkt.

## Kompaktheit

Ein topologischer Raum heißt **kompakt**, wenn ...

Kompaktheit erlaubt es, von lokalen Eigenschaften auf globale Eigenschaften zu schließen.

Eine Teilmenge von {{< katex "\mathbb{R}^n" >}} ist **kompakt**, wenn sie alle Randpunkte enthält und sich nicht ins Unendliche erstreckt. {{< katex "\mathbb{R}^n" >}} ist nicht kompakt.

**Satz von Heine-Borel:** Eine nicht-leere Teilmenge von {{< katex "\mathbb{R}^n" >}} ist genau dann kompakt, wenn sie abgeschlossen und beschränkt ist.

Folgenkompakt

Ueberdeckunsgkompakt

## Ueberleitung

Interessante Räume ergeben sich besonders dann, wenn eine Topologie mit einer anderen Struktur verträglich ist.
Zum Beispiel topologische Vektorräume
und darauf aufbauend normierte und metrische Räume (Vektorräume wo die Norm und Metrik eine zusätzliche Struktur vorgeben).

# Normierte und metrische Räume

Begriffe wie der der Umgebung, des Grenzwerts und der Konvergenz benutzen das Konzept des Abstandes. Konvergenz, zum Beispiel, kann man über die {{< katex "\varepsilon" >}}-Umgebung von {{< katex "x" >}} definieren (so dass jedes Folgenglied ab einem bestimmten {{< katex "n" >}} einen Abstand zu {{< katex "x" >}} hat, der kleiner als {{< katex "\varepsilon" >}} ist) oder direkt über den Abstand {{< katex "d" >}} zweier reeller Zahlen:

Eine reelle Folge {{< katex "(x_n)" >}} konvergiert gegen {{< katex "x" >}} gdw {{< katex "\text{lim}_{n\to\infty} d(x_n,x)=0" >}}.

Will man diese Begriffe verallgemeinern für andere mathematische Objekte, wie Folgen von Vektoren, komplexe Zahlen und Funktionen, müsste man sie spezifisch für jedes dieser Objekte neu definieren.
Viel effizienter ist es, eine allgemeine Klasse von Räumen zu definieren, zusammen mit einem allgemeinen Konzept für Abstand zwischen Objekten in diese Räumen und darauf aufbauend allgemeine Begriffe wie den der Konvergenz.

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

## Metrische Räume als topologische Räume

Häufungspunkte

überdeckung

Umgebung

Eine Menge {{< katex "M" >}} ist **offen** bzgl. einer Norm, wenn {{< katex "M" >}} Umgebung von jedem {{< katex "x\in M" >}} ist, d.h. wenn es zu jedem {{< katex "x\in M" >}} eine {{< katex "\varepsilon" >}}-Umgebung von {{< katex "x" >}} gibt, die ganz in {{< katex "M" >}} liegt. Was heißt, dass kein Randpunkt der Menge in ihr enthalten ist. Die Differenzmenge ist dann **geschlossen** bzgl. der Norm (also wenn es für jeden Punkt außerhalb der Menge eine {{< katex "\varepsilon" >}}-Umgebung gibt, die auch außerhalb liegt). Das heißt eine Menge ist geschlossen, wenn sie alle Randpunkte enthält.

Eine Teilmenge von {{< katex "\mathbb{R}^n" >}} ist offen oder geschlossen unabhängig davon, welche Norm betrachtet wird.

Faustregel:

* Mengen, die mit strikten Ungleichungen zwischen stetigen Funktionen definiert sind, sind offen.
* Mengen, die mit {{< katex "=,\leq,\geq" >}} zwischen stetigen Funktionen definiert sind, sind abgeschlossen.

Das System der offenen Mengen eines metrischen Raumes bildet eine Topologie.
Ein metrischer Raum mit dem System der offenen Mengen ist außerdem ein Hausdorff-Raum.

# Literatur

* Wolfgang Beekmann: Skript Analysis (1144), FernUniversität Hagen.
* Klaus Jänisch: Topologie.
