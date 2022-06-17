---
title: "Polynome"
summary: "Arithmetik, Nullstellen, Approximation."
date: 2020-11-23
weight: 2
math: true
toc: true
draft: false
---

Ein **Polynom** {{< katex "p\in\mathbb{K}[x]" >}} über einen Körper {{< katex "\mathbb{K}" >}} und eine Variable {{< katex "x" >}} ist ein Ausdruck der Form

{{< katex display="\sum_{i=0}^n a_ix_i=a_nx^n+a_{n-1}x^{n-1}+\ldots+a_1x+a_0," >}}

wobei die Koeffizienten {{< katex "a_0,\ldots,a_n\in\mathbb{K}" >}} sind. Der **Grad** eines solchen Polynoms ist das {{< katex "i\neq 0" >}} des größten Koeffizienten ungleich 0. (Der Grad des Nullpolynoms wird als -1 definiert.)

Das Polynom heißt **normiert**, wenn {{< katex "a_n=1" >}} ist.

**Polynomfunktionen** sind Funktionen der Form
{{< katex display="p(x)=\sum_{i=0}^n a_ix_i=a_nx^n+a_{n-1}x^{n-1}+\ldots+a_1x+a_0." >}}

Jedes Polynom liefert also eine Polynomfunktion {{< katex "f:\mathbb{R}\to\mathbb{R}" >}}.
Für alle {{< katex "r\in\mathbb{K}" >}} ist {{< katex "p(r)" >}} das Resultat davon, {{< katex "r" >}} in {{< katex "p" >}} einzusetzen (d.h. {{< katex "p(r) = \sum_{i=0}^n a_ir^i" >}}).

# Arithmetische Operationen

Polynome können wie ganze Zahlen addiert, subtrahiert und multipliziert werden. Das Ergebnis ist erneut ein Polynom.

## Addition

Die Addition erfolgt komponentenweise.

## Multiplikation

Das Produkt zweier Polynome {{< katex "p=\sum_{i=0}^n a_ix_i" >}} und {{< katex "q=\sum_{i=0}^m b_ix_i" >}} in {{< katex "\mathbb{K}[x]" >}} ist definiert durch:
{{< katex display="pq=\sum_{k=0}^{m+n}c_kx^k" >}}
Mit den Koeffizienten:
{{< katex display="c_k=\sum_{\mathclap{0\leq i\leq n,\, 0\leq j\leq m,\, i+j=k}}a_ib_j" >}}
Zum Beispiel:
* {{< katex "c_0 = a_0b_0" >}}
* {{< katex "c_1 = a_0b_1 + a_1b_0" >}}
* {{< katex "c_2 = a_0b_2 + a_1b_1 + a_2b_0" >}}
* {{< katex "\ldots" >}}
(Denn für alle {{< katex "a_ib_j" >}} mit {{< katex "i+j=k" >}} ist der variable Term {{< katex "x^k" >}}.)

Dabei gilt {{< katex "\text{Grad}(pq) = \text{Grad}(p) + \text{Grad}(q)" >}}.

## Division mit Rest

Im Gegensatz zu Addition, Subtraktion und Multiplikation von Polynomen, ergibt die Division von Polynomen nicht notwendig wieder ein Polynom. Z.B. ist {{< katex "\frac{p}{q}=\frac{1}{x}" >}} für {{< katex "p=1" >}} und {{< katex "q=x" >}} kein Polynom. Es gibt aber eindeutig bestimmte Polynome {{< katex "s,r" >}}, so dass
{{< katex display="p=sq+r" >}}
mit {{< katex "\text{Grad}(r)<\text{Grad}(q)" >}}.
Hier ist ein Algorithmus, um {{< katex "s,r" >}} zu bestimmen:

```
function euclidian_division(p, q)
  s = 0;
  r = p;
  d = degree(q);
  c = leading_coefficient(q);

  while degree(r) >= d
    t = leading_coefficient(r)/c * x^(degree(r) - d);
    s = s + t;
    r = r - t * q;
  end

  return (s, r);
end
```

Den **größten gemeinsamen Teiler** zweier Polynome erhält man dann durch wiederholte Division, bis der Rest 0 ist:
```
function gcd(p1, p2)
  (q, r) = euclidian_division(p1, p2);

  # Which means:
  # p1 = q * p2 + r

  if (r == 0)
    return q;
  else
    return gcd(r, q);
  end
end
```

Ein Polynom ist **irreduzibel**, wenn es sich nicht als Produkt zweier Polynome schreiben lässt.
Für Polynome über Körpern gilt:

* Polynome vom Grad 1 sind irreduzibel.  
* In einem algebraisch abgeschlossenen Körper (z.B. {{< katex "\mathbb{C}">}}) haben alle irreduziblen Polynome Grad 1.
* In {{< katex "\mathbb{R}">}} haben alle irreduziblen Polynome Grad 1 oder 2. (Weil der algebraische Abschluss {{< katex "\mathbb{C}">}} den Grad 2 über {{< katex "\mathbb{R}">}} hat.)
* In anderen Körpern sind Polynome vom Grad 2 oder 3 dann irreduzibel, wenn sie keine Nullstellen haben.

## Komposition

# Nullstellen und Faktorisierung

Zu jedem normierten Polynom

{{< katex display="p(x) = x^n+a_{n-1}x^{n-1}+\ldots+a_1x+a_0" >}}

gibt es eindeutig bestimmte Zahlen {{< katex "\lambda_1,\ldots,\lambda_n\in\mathbb{C}" >}}, so dass das Polynom
äquivalent in seine Linearfaktorzerlegung umgeformt werden kann:

{{< katex display="p(x) = (x-\lambda_1)\cdots(x-\lambda_n)" >}}

Das sind genau die Nullstellen des Polynoms, d.h. für jedes {{< katex "\lambda" >}} gilt:

{{< katex display="p(\lambda) = \lambda^n+a_{n-1}\lambda^{n-1}+\ldots+a_1\lambda+a_0 = 0" >}}

D.h. {{< katex "\lambda" >}} ist eine Nullstelle genau dann, wenn {{< katex "(x-\lambda)" >}} ein Faktor des Polynoms ist.

Die Nullstellen müssen nicht verschieden sein, ein Polynom {{< katex "n" >}}-ten Grades hat also höchstens {{< katex "n" >}} Nullstellen. Wie oft eine Nullstelle in einem Faktor vorkommt, nennt man ihre Vielfachheit.

Vor allem müssen die Nullstellen nicht reell sein, d.h. in {{< katex "\mathbb{R}" >}} kann es sein, dass eine Faktorisierung nur unvollständig möglich ist: Ist {{< katex "r" >}} eine reelle Nullstelle des Polynoms {{< katex "p(x)" >}}, dann ist {{< katex "p(x)=(x-r)q(x)" >}} eine Faktorisierung des Polynoms (wobei {{< katex "q(x)" >}} wieder ein Polynom ist).

Ein Körper {{< katex "\mathbb{K}" >}} heißt **algebraisch abgeschlossen**, wenn jedes nicht-konstante Polynom {{< katex "p\in \mathbb{K}[x]" >}} (d.h. jedes Polynom in {{< katex "\mathbb{K}[x]\backslash\mathbb{K}" >}}) eine Nullstelle in {{< katex "\mathbb{K}" >}} besitzt. Das ist äquivalent dazu, dass das Polynom in Linearfaktoren zerfällt, denn hat ein Polynom eine Nullstelle {{< katex "\lambda" >}}, so ist es ohne Rest durch {{< katex "(x-\lambda)" >}} teilbar.

**Fundamentalsatz der Algebra:** {{< katex "\mathbb{C}" >}} ist algebraisch abgeschlossen.

({{< katex "\mathbb{N},\mathbb{Z}, \mathbb{Q},\mathbb{R}" >}} sind alle nicht algebraisch abgeschlossen. Z.B. hat das Polynom {{< katex "x^2 + 1" >}} in keinem dieser Körper eine Nullstelle, weil {{< katex "x^2 + 1 = 0" >}} bedeutet, dass {{< katex "x = \sqrt{-1}" >}}.)

**Mitternachtsformel**: Ein Polynom {{< katex "ax^2 + bx + c">}} hat folgende Nullstellen:
{{< katex display="x_{1,2} = \frac{-b\pm\sqrt{b^2-4ac}}{2a}">}}

# Approximation mit Polynomen

Jede stetige Funktion kann durch ein Polynom approximiert werden.

**Satz von Weierstrass:** Für jede Funktion {{< katex "f\in\mathbb{C}[a,b]">}} und ein beliebiges {{< katex "\varepsilon > 0">}} gibt es ein Polynom {{< katex "p">}}, so dass {{< katex "\| f-p \|_\infty < \varepsilon">}} (mit {{< katex "\|f\|_\infty = \max_{x\in[ab]}|f|">}} die Maximumnorm).

Polynomfunktionen sind für Approximationen besonders geeignet, weil sie einfach zu differenzieren und integrieren sind und ihre Nullstellen durch Standardalgorithmen bestimmt werden können.

## Taylorpolynome

## Interpolation
