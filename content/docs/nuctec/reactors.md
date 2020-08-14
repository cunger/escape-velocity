---
title: "Fission reactors"
summary: "Draft."
date: 2019-11-16
weight: 5
math: true
toc: true
draft: false
---

# Fission reaction

Fission reactors are based on a neutron-driven fission chain reaction producing heat. Most commonly:

{{< katex display="{}^{235}_{92}U + {}^1_0n \to [{}^{236}_{92}U] \to \text{fission products} + 2.44\ {}^1_0n + \gamma\text{ or }\beta + \overline{v} + Q" >}}

Where {{< katex "\overline{v}" >}} are antineutrinos.

When a neutron hits a uranium nucleus (most of which happens in the thermal energy region), it is absorbed and they form a compound nucleus, which lasts for about {{< katex "10^{-14}" >}} seconds and then splits.
The thus produced fission products decay, either by emitting neutrons (almost instantaneously, after around {{< katex "10^{-17}" >}} seconds) or by beta or gamma decay (after around {{< katex "10^{-13}" >}} seconds). After about {{< katex "10^{-10}" >}} to {{< katex "10^{-6}" >}} seconds, we arrive at the right-hand side.
The fission products carry kinetic energy in the order of nano meters, i.e. they stay in the fuel, which corresponds to the release of energy {{< katex "Q" >}} (the Q-value of the reaction).

## Fuel

**Fissionable material** are isotopes that can undergo fission with either slow or fast neutrons.

**Fissile material** is the subset of isotopes that can undergo fission with thermal neutrons.
For example: U-235, Pu-239 (where U-235 is the one with the largest cross-section for fission).

**Fertile material** are isotopes that can be converted into fissile material (through the absorption of neutrons and subsequent decay).
For example U-238, Th-232.

## Moderator

The moderator slows down neutrons to the thermal energy range, where the probability of fission is much higher.

## Poisoning and slagging

[Fuel burn-up and reactor poisoning/slagging](https://www.nuclear-power.net/nuclear-power/reactor-physics/reactor-operation/fuel-burnup/neutron-poisons-reactor-poisoning/)

# Neutron transport

The **neutron population**
{{< katex "n(\overrightarrow{r},E,\overrightarrow{\Omega},t)" >}}
is the number of neutrons at each position {{< katex "\overrightarrow{r}" >}} (e.g. {{< katex "(x,y,z)" >}} coordinates), for each energy level {{< katex "E" >}}, each direction {{< katex "\overrightarrow{\Omega}" >}} (solid angle {{< katex "(\Theta, \Phi)" >}}, usually ignored when the number of neutrons within a reactor is considered) and each time {{< katex "t" >}}.

**Balance equation:**

{{< katex display="\cfrac{\delta n(\overrightarrow{r},E,\overrightarrow{\Omega},t)}{\delta t} = \text{gains} - \text{losses}" >}}

Where the gains are:
* fission
* {{< katex "(n, i\times n)" >}} reactions
* external neutron sources (e.g. Cf to jumpstart reactor)
* scattering (neutrons from another energy range scatter and enter energy range {{< katex "E" >}})

And the losses are:
* any reaction (fission, capture, scattering, etc.) that changes the energy or angle of neutrons, combined in the total macroscopic cross-section {{< katex "\Sigma_\text{total}" >}}
* leakage (neutron leaves the control volume without reaction)

Each of the gain and loss terms (except for leakage) has the general form:
{{< katex display="\text{multiplier} \times \int_\text{stuff} \text{reaction rate}\ d\ \text{stuff}" >}}

## Delayed neutrons

Not all neutron production is instantaneous.

# Reactor types

## Light water reactors (LWRs)

Coolant: Water
Moderator: water, pressurized

### Boiling water reactors (BWRs | Siedewassereaktoren)

### Pressurized water reactors (PWRs | Druckwasserreaktoren)

## Heavy water reactors

e.g. CANDU (Canada Deuterium-Uranium reactor)

Fuel: natural or low-enriched uranium
Coolant: D2O (deuterium oxide)
Moderator: D2O (deuterium oxide), unpressurized

smaller absorption cross-section, so uranium doesn't need to be enriched (so much).

deuterium oxide is expensive.

## Gas cooled reactors

Fuel: low-enriched uranium
Coolant: CO2
Moderator: Graphite

Low power density, because CO2 is less dense and has a lower heat capacity than water.

## Liquid metal cooled reactors

Coolant: liquid metals
* lead-bismuth eutectic (LBE, eutectic = lowest possible melting point alloy)
* sodium-potassium allow (NaK)

Fast reactors, because liquid metals are not good moderators
fast fission with U-238

(lead-bismuth reactor e.g. used in Russian Alfa submarines, which can even outrun torpedos (at the risk of a nuclear run-away))

## Molten salt reactors (Flüssigsalzreaktor)

Fuel: molten salt
Coolant: molten salt
Moderator: Graphite

## Small modular reactors
