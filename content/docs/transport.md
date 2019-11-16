---
title: "Transport"
summary: "Mass and heat transport."
date: 2019-11-16
weight: 11
math: true
toc: true
---

Heat transfer can be due to:

* convection (transport of heat by a flowing fluid)
* conduction (transfer of heat by collision of particles in fluids)
* radiation (transfer of heat by means of wave motion in space)

## Flux and flow

**Flux** {{< katex "q" >}} is the rate of transfer per unit area normal to the direction of the transfer.

**Flow** {{< katex "\phi = q\cdot A" >}} is the rate of energy or mass transferred through a given surface {{< katex "A" >}}.

In general:

* flux = conductivity x driving force
* flow = conductivity x driving force x cross-sectional area

In a steady state, the flux is constant.

The driving force for conductive and convective heat transfer is a temperature difference.

When starting to analyze a situation, get clear about what kind of situation this is:

* conduction vs convection
* steady vs unsteady
* short time (penetration) vs long time (permeation)

# Heat conduction (Fourier's law)

In the one-dimensional case of conduction in the {{< katex "x" >}} dimension, the rate of conduction is:
{{< katex display="\phi_q = -k A \frac{dT}{dx}" >}}

* {{< katex "k" >}} [{{< katex "J/msK" >}}] is the conductivity coefficient of the material (the substance's ability to transfer heat by conduction)
* {{< katex "\cfrac{dT}{dx}" >}} is the temperature gradient

If the temperature gradient is linear, it can be simplified to:
{{< katex display="\phi_q = -k A \frac{\Delta T}{\Delta x}" >}}

The _heat flux_ is {{< katex "\cfrac{\phi_q}{A}" >}}.

# Mass conduction (a.k.a. concentration diffusion or Fick's first law)

Diffusion is mass transport across a concentration gradient. The driving force is a concentration difference. In the one-dimensional case of diffusion in the {{< katex "x" >}} dimension, the rate of diffusion is:

{{< katex display="\phi_m = -D A \frac{dc}{dx}" >}}

* {{< katex "D" >}} [{{< katex "m^2/s" >}}] is the diffusion coefficient of the material
* {{< katex "\frac{dc}{dx}" >}} is the concentration gradient

If the concentration gradient is linear, we can simplify Fick's law:
{{< katex display="\phi_m = -D A \frac{\Delta c}{\Delta x}" >}}

The _mass flux_ is {{< katex "\frac{\phi_m}{A}" >}}.

In order to calculate the temperature or concentration at a specific point:

1. Substitute {{< katex "A" >}} by the surface area of that geometry (a function of {{< katex "x" >}}).
2. Solve the differential equation by separation of variables and integrating.
3. Use the boundary condition(s) to determine the integration constant.

The concentration profile {{< katex "c(x)" >}} varies for different geometries.

* Flat (e.g. membrane): {{< katex "c(x)=f(x)" >}}
* Sphere: {{< katex "c(x)=f(\frac{1}{x})" >}}
* Cylinder: {{< katex "c(x)=f(\text{ln}\,x)" >}}

If the concentration profile is linear, we can simplify Fick's law:
{{< katex display="\phi_m = -D A \frac{\Delta c}{\Delta x}" >}}

# Heat convection (Newton's law of cooling)

Convective heat transport:
{{< katex display="\phi_q = U A \Delta T" >}}

* {{< katex "A" >}} is the cross-sectional area through which heat flows
* {{< katex "U" >}} is the overall heat transfer coefficient ($\frac{1}{U}" >}} can be seen as the resistance to heat transfer). For multiple layers, the heat transfer coefficient can be calculated as:

{{< katex display="\frac{1}{U} = \frac{1}{h_1} + \frac{1}{h_2} + ..." >}}

Note that the the heat transfer coefficient {{< katex "h" >}} [{{< katex "W/m^2K" >}}] relates to conductivity depending on the geometry:

* flat plate: {{< katex "h=\cfrac{k}{d}" >}}
* sphere: {{< katex "h = \cfrac{k}{r}" >}}
* cylinder: {{< katex "h = \cfrac{2k}{r_2\,\text{ln}(\frac{r_2}{r_1})}" >}}

Also, cf. *Nusselt number*.

# Mass convection

Convective mass transport:

{{< katex display="\phi_m = k A \Delta c" >}}

* {{< katex "k" >}} [{{< katex "m/s" >}}] is the mass transfer coefficient ({{< katex "\frac{1}{k}" >}} can be seen as the resistance to mass transfer)

# Analytical solution for mass and heat conduction

**Temperature conduction:** {{< katex "\cfrac{dT}{dt}=k(T_e-T)" >}}

Where {{< katex "T" >}} the temperature of some substance, {{< katex "T_e" >}} the external temperature, and {{< katex "k" >}} the conductivity of whatever separates them ($k=0" >}} would be a perfect insulator). If {{< katex "T_e<T" >}}, the equation means that the rate of cooling of the substance is proportional to the temperature difference.

**Concentration diffusion:** {{< katex "\cfrac{dC}{dt}=k(C_e-C)" >}}

Where {{< katex "C" >}} the concentration in the solution under question, and {{< katex "C_e" >}} the concentration in the surrounding solution.

**Standard form:** {{< katex "\cfrac{dT}{dt}+kT=kT_e" >}} and {{< katex "\cfrac{dC}{dt}+kC=kC_e" >}}

Or, with {{< katex "y" >}} for {{< katex "T" >}} and {{< katex "C" >}}, and {{< katex "x" >}} for {{< katex "T_e" >}} and {{< katex "C_e" >}}:

{{< katex display="\cfrac{dy}{dt}+ky=kx" >}}

**General solution:** {{< katex "y=x+(x(0)-x)e^{-kt}" >}}

Here, {{< katex "x" >}} is the _steady state solution_ that {{< katex "y" >}} will approach for {{< katex "t\to\infty" >}}, and {{< katex "(x(0)-x)e^{-kt}" >}} is the _transient solution_, which will approach 0 for {{< katex "t\to\infty" >}}.
