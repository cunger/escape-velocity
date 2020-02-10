---
title: "Energy"
summary: "Kinetic and potential energy, enthalpy, mass-energy equivalence."
date: 2019-11-16T11:38:21+01:00
weight: 4
math: true
toc: true
---

Energy is defined as the capacity to do work or produce heat.

Energy cannot be created or destroyed. It can only be converted from one form to another or transferred from one system to another.

**Work** is applying force on something causing it to move, thus transferring energy by mechanical movement, **heat** is transferring energy by thermal interactions.

# Forms of energy

Besides mass, there are two main forms of energy: kinetic and potential energy. The sum of both is described as mechanical energy.

**Kinetic energy** is the energy associated with an object's motion.
{{< katex display="E_\text{kin}=\frac{1}{2}mv^2" >}}
With {{< katex "m" >}} the object's mass and {{< katex "v" >}} its velocity.

Work is applying a force {{< katex "F" >}} for a distance {{< katex "d" >}}: {{< katex "W=Fd" >}}.

**Potential energy** is the energy of an object due to its position in a potential field. More specifically, the _gravitational energy_ is the energy of an object due to its position in a gravitational field. (Also see the entry on [gravitation](/docs/nuctec/forces/#gravitational-force).) On a planet, this is:
{{< katex display="E_\text{pot}=mgh" >}}
Where {{< katex "g" >}} is the gravitational acceleration (about {{< katex "9.81 m/s^2" >}} close to the Earth's surface), {{< katex "m" >}} is the object's mass and {{< katex "h" >}} is its height relative to some vertical reference point.

**Internal energy** {{< katex "U" >}} is all energy contained within a system.

**Thermal energy** is the kinetic energy associated with the random motion of atoms and molecules. _Temperature_ is the average thermal energy of a group of molecules, and _heat_ is the transfer of thermal energy between objects. When there is a difference in temperature between two points, heat flows from high to low temperature. By convention, heat is positive if it flows into the system (increasing its energy), and negative if it is transferred from the system to the surroundings (energy loss).

A change in temperature {{< katex "T" >}} leads to a change in internal energy (where {{< katex "c_p" >}} is heat capacity, which might be a function of temperature):
{{< katex display="\Delta U=mc_p\Delta T" >}}

**Chemical energy** is the energy stored in bonds between atoms within molecules. It is released when those bonds are broken up, e.g. through combustion. **Nuclear energy** is the energy stored in nuclei.

# Enthalpy

Enthalpy {{< katex "H" >}} is a system's internal energy plus the amount of work required to make room for it within its surroundings:
{{< katex display="H=U+pV" >}}
At constant pressure, change in enthalpy is basically the heat gained or lost by the system.
{{< katex display="\Delta H= \Delta U + p\Delta V" >}}

# Mass-energy equivalence

Mass and energy are equivalent, as described by Einstein's formula {{< katex "E=mc^2" >}}, where {{< katex "E" >}} is the rest energy of an object and {{< katex "m" >}} is its mass. Since {{< katex "c" >}} is a large number, this means that there is a tremendous amount of energy in mass. So in a way, mass can be seen as concentrated energy.

While neutrons usually have small kinetic energies in practice, many electrons have a large kinetic energy, so it's often necessary to use the relativistic version of Einstein's formula for electrons, stating that the kinetic energy of a particle is the difference between its total energy and its rest mass energy:
{{< katex display="E=mc^2 - m_{\text{rest}}c^2" >}}
Where the mass {{< katex "m" >}} of a particle in motion increases relative to an observer at rest, depending on its speed {{< katex "v" >}}, according to:
{{< katex display="m=\frac{m_{\text{rest}}}{\sqrt{1-v²/c²}}" >}}

This does not apply to particles without mass, such as photons. Photons always travel at the speed of light, and their energy is {{< katex "E=hv" >}}, where {{< katex "v" >}} is the frequency of the associated electromagnetic wave, and {{< katex "h" >}} is Planck's constant:
```
h = 4.136e-15 [eV*s]
```

Mass and energy can be converted into one another.

**Conversion factor:** 931.49 {{< katex "\text{MeV}\cdot\text{amu}^{-1}\cdot c^{-2}" >}}

This is the energy equivalent to 1 atomic mass unit.

# Mass defect and binding energy

The _mass defect_ is the difference between the sum of the masses of all nucleons and the observed mass of the nucleus. It corresponds to the _binding energy_ in the nucleus. That is, some of the mass of the nucleons was released as binding energy when the nucleus was formed.

Energy release in nuclear reactions happens on an MeV scale, while chemical reactions release energy on an eV scale.
