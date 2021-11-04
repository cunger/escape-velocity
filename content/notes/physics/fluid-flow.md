---
title: "Fluid flow"
summary: "Flow rate. Drag force."
date: 2019-11-16T12:19:28+01:00
weight: 7
math: true
toc: true
---

Fluids comprise both liquids (generally incompressible, i.e. volume does not change in response to a pressure change) and gases (compressible).

# Steady flow

**Flow rate**: {{< katex "\Phi_V = \cfrac{\Phi_m}{\rho}" >}}.

**Velocity**: {{< katex "v = \cfrac{\Phi_V}{A}" >}}
With {{< katex "A" >}} the cross-sectional area.

The flow rate has an impact on whether the flow is laminar (usually at low velocities), turbulant (usually at high velocities) or in some transition phase between the two types.

* _Laminar flow_ is ordered, characterized by smooth layers of fluid. Viscous forces dominate.
* _Turbulant flow_ is disordered. Inertial forces dominate.

**Continuity** states that for an incompressible fluid flowing in a pipe, the flow rate is the same everywhere in the pipe:
{{< katex display="\rho_1 A_1 v_1 = \rho_2 A_2 v_2" >}}
With {{< katex "\rho" >}} the density, {{< katex "A" >}} the cross-sectional area, and {{< katex "v" >}} the velocity.

# Drag force

A solid object moving through a fluid generates a drag force.

![The four forces in flight](http://code7700.com/images/forces_g450_fictitious.png)

(Image source: [7700.com](http://code7700.com))

**Friction drag** mainly depends on the surface area parallel to the flow.

![Friction drag](/images/docs/friction-drag.png)

**Form drag** mainly depends on the surface area perpendicular to the flow. It creates a pressure difference, due to an agglomeration of fluid in front of the object and a corresponding lack of fluid behind it.

![Form drag](/images/docs/form-drag.png)

The **drag force** is determined as follows:
{{< katex display="F_D = C_D\cdot A\cdot \frac{1}{2}\rho_f v_r^2" >}}
Where:

* {{< katex "A" >}} is the relevant cross-sectional area of the object. This is {{< katex "A_\bot" >}} for form drag (the area perpendicular to the flow).
* {{< katex "v_r" >}} is the relative velocity of object and fluid: {{< katex "v_r = v_f - v_o" >}}
* {{< katex "\rho_f" >}} is the density of the fluid.
* {{< katex "C_D" >}} is the object's drag coefficient.

The drag coefficient is a function of the object's shape and the **Reynolds number**:
{{< katex display="Re = \cfrac{\rho_f v_r D}{\mu}" >}}
Where {{< katex "\mu" >}} the viscosity of the fluid and {{< katex "D" >}} the diameter of the object. The Reynolds number describes the ratio of inertial forces to viscous forces in a flowing fluid.

Finding an analytical solution for the drag coefficient from the flow equations is possible only for low Reynolds number (< 1) and simple shapes. In the case of spheres, the drag coefficient is {{< katex "C_D=\frac{24}{Re}" >}}, which yields a drag force following **Stoke's law**:
{{< katex display="F_D = 3\pi D \mu v_r" >}}
Where form drag contributes {{< katex "\pi\mu Dv" >}} and friction drag contributes {{< katex "2\pi\mu Dv" >}}. (Note that the viscosity {{< katex "\mu" >}} of the fluid is important, not its density.)

For large Reynolds numbers (> {{< katex "10^4" >}}), {{< katex "C_D" >}} is constant.

For flows with a low Reynolds number, most drag is due to friction. These are _laminal_ flows. For flows with a high Reynolds number, form drag increases due to the pressure difference becoming significant. These are _turbulent_ flows.

## Determining the drag coefficient iteratively

Start with a rough estimate for the drag coefficient. For a high Reynolds number, for example, we can start assuming {{< katex "C_D=1" >}}.

1. Compute according velocity {{< katex "v" >}}.
2. Based on the velocity, compute the Reynolds number {{< katex "Re=\cfrac{\rho_\text{fluid} v D}{\mu_\text{fluid}}" >}}.
3. Look up the drag coefficient {{< katex "C_D" >}} for that Reynolds number (given the object's shape).  

Iterate until {{< katex "C_D" >}} and {{< katex "v" >}} don't change anymore.

## Terminal velocity

When an object is freely falling or rising through a fluid, as its velocity increases, so does the drag restraining the movement. At some point, these forces are balanced, and since there is no net force on the object, its acceleration is zero. It is then falling or rising with its _terminal velocity_, the steady-state velocity of an object in a fluid when its acceleration is zero and all upward and downward forces are balanced.

For falling objects: {{< katex "F_\text{gravitation}=F_\text{buoyancy} + F_\text{drag}" >}}

For rising objects: {{< katex "F_\text{buoyancy} = F_\text{gravitation} + F_\text{drag}" >}}

Where:

* {{< katex "F_\text{gravitation}=mg=\rho_\text{object} V g" >}}
* {{< katex "F_\text{buoyancy}=mg=\rho_\text{fluid} V g" >}}
* {{< katex "F_\text{drag}=C_D A \frac{1}{2}\rho_f v_t^2" >}} (see above)

Terminal velocity is the highest velocity the object can achieve falling freely through the fluid.
