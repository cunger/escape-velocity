---
title: "Forces"
summary: "The fundamental forces of physics."
date: 2019-11-16
weight: 3
math: true
toc: true
---

# Electromagnetic and weak force

Electromagnetism is the interaction between objects due to their charge. This comprises attraction and repulsion between charged particles.

The weak nuclear force is the interaction between subatomic particles with "color".

# Strong nuclear force

The strong nuclear force is the interaction between subatomic particles with "flavor".

![Strong vs electromagnetic force](/images/docs/strong-vs-coulomb.png)

# Gravitational force

Gravity is the interaction between objects due to their mass. It is a relatively weak force (compared to others), but operates over long distances.

{{< katex display="F = \frac{GMm}{r^2}" >}}
Where:

* {{< katex "G" >}} is the gravitational constant
* {{< katex "M" >}} and {{< katex "m" >}} are the masses of the two bodies

{{< katex "GM" >}} is the standard gravitational parameter {{< katex "\mu" >}} of a celestial body.

![Gravitation between two planets](/images/docs/gravity1.png)

Consider a spacecraft of mass {{< katex "m" >}} in the gravitational field of a much larger mass {{< katex "M" >}}. That is, {{< katex "m << M" >}} and the center of mass of the two bodies is practically at the center of the large mass.

![Gravitation between planet and spacecraft](/images/docs/gravity2.png)

The velocity of an object in circular orbit is {{< katex "v^2=\cfrac{GM}{r}" >}}, so the farther away the object is, the slower it is. Note that {{< katex "m" >}} does not matter, as any object at the same distance {{< katex "r" >}} moves at the same velocity.

## Sphere of influence and escape velocity

When leaving a body's sphere of influence, you need to reach the required _escape velocity_, which depends on your distance {{< katex "r" >}} from the body's center:
{{< katex display="v_\text{escape} = \sqrt{\frac{2GM}{r}}" >}}

For the Earth, this amounts to ~ 11.2 km/s from the surface and less from higher altitudes.

The _hyperbolic excess velocity_ is the residual velocity you have left when you reach the boundary of the body's sphere of influence. It will be constant until infinity (or at least would be if there were no other bodies exerting any force on you). So if you start with just the escape velocity, your hyperbolic excess velocity will be 0; anything you add to the escape velocity will be your hyperbolic excess velocity.

## Energy

The total energy in a gravitational field is the sum of the kinetic energy and the potential energy. In a conservative force field (e.g. a gravitational force field without dissipative forces), mechanical energy is preserved.

_Potential energy:_
{{< katex display="E_{\text{pot}} = - G M \frac{m}{r}" >}}

_Kinetic energy:_
{{< katex display="E_{\text{kin}} = \frac{1}{2}\,m\,v^2" >}}
