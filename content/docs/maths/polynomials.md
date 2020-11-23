---
title: "Polynomials"
summary: "German notes on polynomials. Draft."
date: 2020-11-23
weight: 3
math: true
toc: true
draft: false
---

**Polynome** sind Ausdrücke, die aus Konstanten und Variablen mithilfe von Addition, Subtraktion, Multiplikation, und nicht-negativen ganzzahligen Potenzen gebildet werden können.

Ein Polynom {{< katex "p\in\mathbb{K}[x]" >}} über einen Körper {{< katex "\mathbb{K}" >}} und eine Variable {{< katex "x" >}} ist ein Ausdruck der Form {{< katex display="\sum_{i=0}^n a_ix_i," >}} wobei {{< katex "a_0,\ldots,a_n\in\mathbb{K}" >}} Konstanten sind und die Koeffizienten {{< katex "i\in\mathbb{N}" >}} ganzzahlig und nicht-negativ sind. Der **Grad** eines solchen Polynoms ist der größte Koeffizient {{< katex "i\neq 0" >}}.

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

## Faktorisierung

Polynome können äquivalent umgeformt werden als Produkt von Polynomen.

* {{< katex "x^2-a^2=(x+a)(x-a)" >}}

## Komposition

# Polynomfunktionen

Für alle {{< katex "r\in\mathbb{K}" >}} ist {{< katex "p(r)" >}} das Resultat davon, {{< katex "r" >}} in {{< katex "p" >}} einzusetzen (d.h. {{< katex "p(r) = \sum_{i=0}^n a_ir^i" >}}).
Jedes Polynom liefert also eine Polynomfunktion {{< katex "f:\mathbb{R}\to\mathbb{R}" >}} mit {{< katex "f(x)=\sum_{i=0}^n a_ix_i" >}}.

# Nullstellen

# Gleichungen

# Anwendungen
