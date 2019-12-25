---
title: "Balances"
summary: "Equations for mass and energy balances. Macro and micro balances."
date: 2019-11-16
weight: 9
math: true
toc: true
---

Balancing equations are a way of bookkeeping for the main quantities involved in a process: mass, energy, and momentum. It comprises everything through which a quantity enters the system or leaves it, is produced or absorbed, and which resistances there are to the transport of the quantity. (Also see [heat and mass transport](https://write.as/christina-unger/heat-and-mass-flow).)

General balance of {{< katex "x" >}}:

{{< katex display="\frac{dx}{dt}=\Phi_{x,in} - \Phi_{x,out} + \text{production}(x)" >}}

Where:

* {{< katex "\frac{dx}{dt}" >}} is the rate of change of {{< katex "x" >}} in the system as a function of time. In a steady state, {{< katex "\frac{dx}{dt}=0" >}}.
* {{< katex "\Phi_{x,in}" >}} is the rate of {{< katex "x" >}} entering the system.
* {{< katex "\Phi_{x,out}" >}} is the rate of {{< katex "x" >}} leaving the system.
* {{< katex "\text{production}(x)" >}} includes production and consumption or loss of {{< katex "x" >}}, and thus can be positive or negative.

Balances can be set up on different levels:

* **Macro balances** describe the change of quantities over the whole system. They are set up on an integral balance.
* **Micro balances** describe the change of quantities over a very small volume. They are set up on a differential basis. ({{< katex "\Phi_{x,in} - \Phi_{x,out}" >}} becomes {{< katex "\Phi_x|_{t} - \Phi_x|_{t+dt}" >}} which is the same as {{< katex "d\Phi_x" >}}.)
This provides information about temperature, concentration, velocity profiles within the system.

# Mass balance

### Total mass balance:

{{< katex display="\frac{dm}{dt}=\Phi_{m,in} - \Phi_{m,out} + \text{production}(m)" >}}

With {{< katex "\Phi_m" >}} having the standard unit kg/s.

Since mass is volume times concentration ({{< katex "m=Vc" >}}) and volume times density ({{< katex "m=V\rho" >}}), the mass flow rate {{< katex "\Phi_m" >}} can be rewritten as {{< katex "\Phi_{V}c" >}} or {{< katex "\Phi_{V}\rho" >}} (with {{< katex "\Phi_{V}" >}} having the standard unit m^3/s, and {{< katex "c" >}} and {{< katex "\rho" >}} having the standard unit kg/m^3). Further, if the volume does not change, this becomes an equation of concentration:

{{< katex display="V\frac{dc}{dt}=\Phi_{V,in}c_\text{in} - \Phi_{V,out}c_\text{out} + \text{production}(m)" >}}

_For more on volume flow in fluids, see [fluid flow](https://write.as/christina-unger/fluid-flow)._

# Energy balance

### Total energy balance:

{{< katex display="\frac{de}{dt}=\Phi_{m,in}ec_\text{in} - \Phi_{m,out}ec_\text{out} + \Phi_q + \Phi_W" >}}

Where:

* {{< katex "\Phi_W" >}} is the work done on the system.
* {{< katex "\Phi_q" >}} is the heat flow into the system.
* {{< katex "\Phi_{m,in}" >}} is the mass inflow and {{< katex "\Phi_{m,out}" >}} is the mass outflow.
* {{< katex "ec" >}} is the energy concentration:

{{< katex display="ec=u+gh+\frac{1}{2}v^2+\frac{p}{\rho}" >}}

With:

* {{< katex "u" >}} the internal energy
* {{< katex "gh" >}} the potential energy (per mass unit)
* {{< katex "\frac{1}{2}v^2" >}} the kinetic energy (per mass unit)
* {{< katex "\frac{p}{\rho}" >}} the pressure energy of an incompressible fluid (where {{< katex "p" >}} the pressure and {{< katex "\rho" >}} the density)

The total energy balance can be split into mechanical and thermal energy.

## Mechanical energy

{{< katex display="\frac{de}{dt}=\Phi_{m,in}(gh+\frac{1}{2}v^2+\frac{p}{\rho})_\text{in} - \Phi_{m,out}(gh+\frac{1}{2}v^2+\frac{p}{\rho})_\text{out} + \Phi_W" >}}
(minus energy lost from friction)

Neglecting friction, in a steady-state system with equal in- and outflow, where no work is performed, this can be simplified to _Bernoulli's equation_:
{{< katex display="(gh+\frac{1}{2}v^2+\frac{p}{\rho})_\text{out}=(gh+\frac{1}{2}v^2+\frac{p}{\rho})_\text{in}" >}}

## Thermal energy

{{< katex display="\frac{de}{dt}=\Phi_{m,in} c_{p,\text{in}} T_\text{in} - \Phi_{m,out} c_{p,\text{out}} T_\text{out} + \Phi_q" >}}
Plus energy gained from friction.

_For a primer on the different forms of energy, cf. the entry on [energy](/docs/energy/)._
