---
title: "Polynome"
summary: "German notes on polynomials. Draft."
date: 2020-11-23
weight: 4
math: true
toc: true
draft: false
---

Ein **Polynom** {{< katex "p\in\mathbb{K}[x]" >}} über einen Körper {{< katex "\mathbb{K}" >}} und eine Variable {{< katex "x" >}} ist ein Ausdruck der Form

{{< katex display="\sum_{i=0}^n a_ix_i=a_nx^n+a_{n-1}x^{n-1}+\ldots+a_1x+a_0," >}}

wobei {{< katex "a_0,\ldots,a_n\in\mathbb{K}" >}} Konstanten sind und die Koeffizienten {{< katex "i\in\mathbb{N}" >}} ganzzahlig und nicht-negativ sind. Der **Grad** eines solchen Polynoms ist der größte Koeffizient {{< katex "i\neq 0" >}}.

**Polynomfunktionen** sind Funktionen der Form
{{< katex display="p(x)=\sum_{i=0}^n a_ix_i=a_nx^n+a_{n-1}x^{n-1}+\ldots+a_1x+a_0." >}}

Jedes Polynom liefert also eine Polynomfunktion {{< katex "f:\mathbb{R}\to\mathbb{R}" >}}.
Für alle {{< katex "r\in\mathbb{K}" >}} ist {{< katex "p(r)" >}} das Resultat davon, {{< katex "r" >}} in {{< katex "p" >}} einzusetzen (d.h. {{< katex "p(r) = \sum_{i=0}^n a_ir^i" >}}).

# Arithmetische Operationen

Polynome drücken Zahlen aus und können wie diese addiert, subtrahiert und multipliziert werden. Das Ergebnis ist erneut ein Polynom.

## Multiplikation

Das Produkt zweier Polynome {{< katex "p=\sum_{i=0}^n a_ix_i" >}} und {{< katex "q=\sum_{i=0}^m b_ix_i" >}} in {{< katex "\mathbb{K}[x]" >}} ist definiert durch:
{{< katex display="pq=\sum_k(\sum_{i+j=k}a_ib_j)x^k" >}}
D.h. der Term mit Exponent {{< katex "k" >}} ergibt sich aus den Summen aller Terme, deren Koeffizienten summiert {{< katex "k" >}} ergeben.

* {{< katex "k=0: a_0b_0" >}}
* {{< katex "k=1: a_0b_1x + a_1xb_0" >}}
* {{< katex "k=2: a_0b_2x^2 + a_1xb_1x + a_2x^2b_0" >}}
* {{< katex "\ldots" >}}

Dabei gilt {{< katex "\text{Grad}(pq) = \text{Grad}(p) + \text{Grad}(q)" >}}.

## Division mit Rest

Im Gegensatz zu Addition, Subtraktion und Multiplikation von Polynomen, ergibt die Division von Polynomen nicht notwendig wieder ein Polynom. Z.B. ist {{< katex "\frac{p}{q}=\frac{1}{x}" >}} für {{< katex "p=1" >}} und {{< katex "q=x" >}} kein Polynom. Es gibt aber eindeutig bestimmte Polynome {{< katex "f,r" >}}, so dass
{{< katex display="p=fq+r" >}}
mit {{< katex "\text{Grad}(r)<\text{Grad}(q)" >}}.

## Faktorisierung

Polynome können äquivalent umgeformt werden als Produkt von Polynomen. Zum Beispiel:

* {{< katex "x^2-a^2=(x+a)(x-a)" >}}
* {{< katex "x^3-2x^2-x+1=(x-2)(x+1)(x-1)" >}}

## Komposition

# Nullstellen

Ein Polynom {{< katex "n" >}}-ten Grades hat höchstens {{< katex "n" >}} Nullstellen. {{< katex "r" >}} ist eine Nullstelle genau dann, wenn {{< katex "(x-r)" >}} ein Faktor des Polynoms ist. D.h. wenn {{< katex "r_1,\ldots,r_n" >}} die Nullstellen des  Polynoms {{< katex "p(x)" >}} sind, ist  
{{< katex display="p(x)=a_n(x-r_n)(x-r_{n-1})\cdots(x-r_2)(x-r_1)q(x)" >}}
eine Faktorisierung des Polynoms (wobei {{< katex "q(x)" >}} wieder ein Polynom ist).

# Gleichungen

# Taylorpolynome
