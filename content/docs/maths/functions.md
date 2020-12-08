---
title: "Functions"
summary: "German notes on functions, convergence, and so on. Draft."
date: 2020-11-23
weight: 4
math: true
toc: true
draft: false
---

Eine Abbildung oder Funktion ist
* **surjektiv**, wenn jedes Element des Wertebereichs im Bild von {{< katex "f" >}} liegt.
* **injektiv**, wenn jedes Element im Bild von {{< katex "f" >}} genau ein Urbild hat. Also wenn keine zwei Elemente im Definitionsbereich das gleiche Bild haben.

Eine **reelle Folge** ist eine Abbildung {{< katex "f:\mathbb{N}\to\mathbb{R}" >}}. (Eine Folge hat also immer unendlich viele Elemente.)

# Konvergenz

Eine Folge {{< katex "(a_n)" >}} **konvergiert** gegen einen **Grenzwert** {{< katex "a\in\mathbb{R}" >}}, wenn es zu jeder positiven Zahl {{< katex "\varepsilon" >}} einen Index {{< katex "n_0" >}} gibt, so dass für alle Indizes {{< katex "n>n_0" >}} stets {{< katex "|a_n-a|<\varepsilon" >}} (also wenn der Abstand von {{< katex "a_n" >}} zu {{< katex "a" >}} beliebig klein wird).
Anders ausgedrückt: wenn in jeder Epsilonumgebung von {{< katex "a" >}} alle Glieder von {{< katex "(a_n)" >}} bis auf endlich viele Ausnahmen liegen.

Eine Folge konvergiert genau dann, wenn sie eine Cauchyfolge ist.

Eine Folge heißt **Cauchyfolge**, wenn es zu jedem {{< katex "\varepsilon>0" >}} einen Index {{< katex "n_0" >}} gibt, so dass für alle {{< katex "m,n>n_0" >}} stets {{< katex "|a_m-a_n|<\varepsilon" >}}. D.h. wenn die Folgenglieder ab einem bestimmten Index beliebig dicht beieinander liegen.

Jede monotone, beschränkte Folge konvergiert. Und zwar gegen ihr Supremum, wenn sie monoton wachsend ist, und gegen ihr Infimum, wenn sie monoton fallend ist.

# Monotonie

# Stetigkeit

# Differenzierbarkeit
