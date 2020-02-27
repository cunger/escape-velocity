---
title: "Complex numbers"
summary: "Cartesian and polar coordinates, arithmetic operations, Euler's formula."
date: 2019-11-16T12:02:48+01:00
weight: 2
math: true
toc: true
---

> [Complex numbers] are essential to quantum physics, electromagnetism, and many more fields. They are naturally suited to describe anything that turns, waves, ripples, combines or interferes, with itself or with others. [...] Whenever we're describing wavelike phenomena, whether it's sound, electricity or subatomic particles, we're also interested in how the wave evolves and changes. Complex operations are eminently suited for this, because they naturally take place on circles. Numbers that oppose can cancel out, numbers in the same direction will amplify each other, just like two waves do when they meet. (http://acko.net/blog/how-to-fold-a-julia-fractal/)

A complex number {{< katex "z" >}} can be defined as

* {{< katex "z=x+yi" >}}
  with a real part {{< katex "x" >}} and an imaginary part {{< katex "y" >}}
* {{< katex "z=re^{i\theta}" >}}
  with magnitude {{< katex "r" >}} (its distance to the origin) and phase angle {{< katex "\theta" >}}

Where {{< katex "i^2=-1" >}}. And thus:

![Powers of i](/images/docs/powers-of-i.png)

{{< katex "(x,y)" >}} is a **Cartesian coordinate**.

* {{< katex "x = r\,\text{cos}(\theta)" >}}
* {{< katex "y = r\,\text{sin}(\theta)" >}}

{{< katex "(r,\theta)" >}} is a **polar coordinate**, with {{< katex "r" >}} the _modulus_ and {{< katex "\theta" >}} the _argument_.

* {{< katex "r = |z| = \sqrt{x^2 + y^2}" >}}
* {{< katex "\theta = \text{atan}2(y,x)" >}}

It holds that {{< katex "|z^n| = |z|^n" >}} and {{< katex "\text{arg}(z)^n = n\,\text{arg}(z)" >}}. And note that the phase angle comes from:

{{< katex "\quad\text{tan}(\theta) = \cfrac{\text{sin}(\theta)}{\text{cos}(\theta)} = \cfrac{y}{x}" >}}

Figure from the [Feynman lectures on algebra](http://www.feynmanlectures.caltech.edu/I_22.html):

![Unification of algebra and geometry](/images/docs/complex-number.png)

# Arithmetic operations

**Code:** [complex.exs](https://github.com/cunger/simulacron/blob/master/complex.exs)

While addition is straight-forward in Cartesian form, most operations are much more intuitive in polar form, as they constitute transformations in the Cartesian plane.

### Addition

* {{< katex "(x_1+y_1i) + (x_2+y_2i) = (x_1+x_2) + (y_1+y_2)i" >}}

### Multiplication

* {{< katex "\quad(x_1+y_1i)(x_2+y_2i) = (x_1x_2 - y_1y_2) + (x_1y_2 + x_2y_1)" >}}
* {{< katex "(r_1e^{i\theta_1})(r_2e^{i\theta_2}) = r_1r_2e^{i(\theta_1+\theta_2)}" >}}

### n-th power

* {{< katex "(re^{i\theta})^n = r^n e^{in\theta}" >}}

### Division

* {{< katex "\quad\cfrac{x_1+y_1i}{x_2+y_2i} = \cfrac{x_1x_2 + y_1y_2}{x_2^2+y_2^2} + \cfrac{x_2y_1 - x_1y_2}{x_2^2+y_2^2}i" >}}
* {{< katex "\cfrac{r_1e^{i\theta_1}}{r_2e^{i\theta_2}} = \cfrac{r_1}{r_2} e^{i(\theta_1-\theta_2)}" >}}

### Reciprocal

* {{< katex "\cfrac{1}{x+yi} = \cfrac{x-yi}{x^2+y^2}" >}}
* {{< katex "\cfrac{1}{re^{i\theta}} = \cfrac{1}{r}e^{-i\theta}" >}}

## Complex conjugate

Taking the complex conjugate corresponds to negating the imaginary component:

{{< katex display="\overline{x+yi} = x-yi" >}}
{{< katex display="\overline{re^{i\theta}} = re^{-i\theta}" >}}

This is equivalent to reflecting the complex number across the real axis.

Multiplying a complex number by its conjugate, we get a real number (the square of its distance to the origin):

{{< katex display="z\,\overline{z} = x^2+y^2 = |z|^2" >}}

# Euler's formula

What is the exponential function {{< katex "e^{x+yi}" >}}? Using the exponential law yields {{< katex "e^{x+yi} = e^{x}e^{yi}" >}}, so the question boils down to: What is {{< katex "e^{yi}" >}}? Euler defined this with what is now known as _Euler's formula_:
{{< katex display="e^{iy} = \text{cos}(y)+i\,\text{sin}(y)" >}}
(For the complex conjugate we have {{< katex "e^{-iy} = \text{cos}(y)-i\,\text{sin}(y)" >}}.)

Because this is how everything else works out (like {{< katex "\frac{d}{dt}e^{it}=ie^{it}" >}} and exponential laws, including {{< katex "e^{0+0i}=1" >}}). So we have:
{{< katex display="e^{x+yi} = e^x(\text{cos}(y)+i\,\text{sin}(y))" >}}
And: {{< katex "|e^{iy}|=1" >}}.

For any complex numbers {{< katex "z,w" >}}, we get:

{{< katex "e^{z+w}=e^ze^w" >}}
{{< katex "(e^z)^n=e^{n\,z}" >}} (in particular {{< katex "(e^z)^{-1}=e^{-z}" >}})

# Solving real problems in the complex domain

Every algebraic equation can be solved in the complex domain.

Some problems are easier to solve in the complex domain than in the real domain, even if they have a real solution. For example: The integral of the real part of a complex number is the real part of the integral of the complex number (which might be much easier to integrate than the real one).
