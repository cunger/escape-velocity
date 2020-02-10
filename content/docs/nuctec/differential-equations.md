---
title: "Differential equations"
summary: "Analytical solutions to first-order linear ODEs."
date: 2019-11-16
weight: 3
math: true
toc: true
---

Differential equations contain functions as well as their derivatives. The order of the equation corresponds to the order of the highest derivative.

* An _ordinary differential equation_ (ODE) contains functions of only one independent variable.
* A _partial differential equation_ (PDE) contains functions of more than one independent variables.

# First-order linear ODEs

**Standard form:** {{< katex "y'+p(t)\,y=q(t)" >}}

Where {{< katex "t" >}} is the independent variable (in models this is often time).

The equation is _homogeneous_ if {{< katex "q(t)=0" >}}, and _inhomogeneous_ otherwise.

## Homogeneous first-order linear ODEs

Can always be solved by separation of variables:

{{< katex "\cfrac{dy}{dt}+p(t)\,y=0" >}} becomes {{< katex "\cfrac{dy}{y}=-p(t)dt" >}}

**General solution:** {{< katex "y=c\,e^{-P(t)}" >}}

Steps: Integrating both sides gives {{< katex "\int\cfrac{1}{y}dy=-\int p(t)dt" >}}, which is {{< katex "ln|y|=-P(t) + C" >}} with {{< katex "P(t)=\int p(t)dt" >}}. Then solve for {{< katex "y" >}}:

{{< katex "|y|=e^{-P(t) + C}" >}}

{{< katex "y=\pm e^{-P(t) + C}" >}}

{{< katex "y=\pm e^{-P(t)}e^{C}" >}}

{{< katex "y=c\,e^{-P(t)}" >}}

## Inhomogeneous first-order linear ODEs

Can be solved by variation of parameters.

**General solution:** {{< katex "y=u(t)\,y_h" >}}

Where {{< katex "y_h" >}} is a non-zero solution to the associated homogeneous ODE, and {{< katex "u" >}} is determined as follows. Substitute {{< katex "y=u\,y_h" >}} into the inhomogeneous equation:

{{< katex "\cfrac{d}{dt}(uy_h) + puy_h=q" >}}

Applying the product rule:

{{< katex "u'y_h+uy_h'+puy_h=q" >}}
{{< katex "u'y_h+u(y_h'+py_h)=q" >}}

Note that {{< katex "y_h'+py_h=0" >}}, because {{< katex "y_h" >}} is a solution to the homogeneous ODE. Thus {{< katex "u'y_h=q" >}}. Then integrate {{< katex "u'=\cfrac{q}{y_h}" >}}, in order to solve for {{< katex "u" >}}.

This is equivalent to finding the **integrating factor**. The idea is to find a factor {{< katex "u" >}} such that when multiplying both sides by it ({{< katex "uy'+puy=qu" >}}), the left-hand side corresponds to {{< katex "(uy)'" >}} after applying the product rule. This is the case when {{< katex "u'=pu" >}}, which is a homogeneous ODE that can be solved by separation of variables and gives as integrating factor:

{{< katex display="u=e^{\int p(t)dt}" >}}

After calculating the integrating factor {{< katex "u" >}}, multiply both sides of the equation by {{< katex "u" >}}, and rewrite the left-hand side as {{< katex "(uy)'" >}}. Then integrate.

## Linear combinations

A linear combination of functions {{< katex "f_1,f_2,..." >}} are functions of the form {{< katex "c_1f_1 + c_2f_2 + ..." >}} with {{< katex "c_1,c_2,..." >}} any numbers.

Superposition principles:
![Superposition principles](images/docs/superposition.png)

That is, for linear homogeneous ODEs, all linear combinations of solutions are solutions:

* 0 is a solution.
* Multiplying any solution by a scalar gives another solution.
* Adding any two solutions gives another solution.

Also the general inhomogeneous solution {{< katex "y=y_p+y_h" >}}, where

* {{< katex "y_p" >}} is a particular inhomogenous solution and
* {{< katex "y_h" >}} is the general homogeneous solution.

## Special cases

If we have an **inhomogeneous linear ODE where {{< katex "q(t)" >}} is constant**: If there is a constant solution, then {{< katex "y'=0" >}} and the equation simplifies to {{< katex "p(t)y=q" >}}, thus one particular solution is {{< katex "y=\frac{q}{p(t)}" >}}. Using the superposition principle, all solutions take the form:

{{< katex display="y=\frac{q}{p(t)} + Ce^{p(t)t}" >}}

Solutions to {{< katex "z^n=1" >}} with {{< katex "z" >}} any [complex number](/docs/nuctec/complex-numbers/) are {{< katex "e^{i(\frac{2\pi k}{n})}" >}} for {{< katex "k=0,1,...n-1" >}}.

Solutions to {{< katex "x''+x=0" >}} are all linear combinations of sine and cosine: {{< katex "x=c_1\text{cos}(t)+c_2\text{sin}(t)" >}} with {{< katex "c_1,c_2" >}} any real number.
