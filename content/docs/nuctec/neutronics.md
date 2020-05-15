---
title: "Neutronics"
summary: "Neutrons, energy distribution, neutron interactions, iron valley."
date: 2019-11-16
weight: 9
math: true
toc: true
---

Neutrons have roughly the same mass as a proton, but no charge.

# Free neutrons

Free neutrons are unstable, with a halflife of about 10.4 minutes. They undergo {{< katex "\beta^-" >}} decay, yielding a proton, an electron and an antineutrino:
{{< katex display="{}^1_0n \to {}^1_1p + {}^{\ \ \,0}_{-1}e + \overline{v}" >}}

## Classification

Free neutrons can be classified according to their kinetic energy.

* _Thermal neutrons_ (up to 1 eV) are in a thermal equilibrium with their surrounding, with the most probable energy at 20 degrees C being 0.025 eV (~ 2km/s). They often have a much larger neutron absorption cross-section than fast neutrons.
* _Resonance neutrons_ (1 eV - 100 keV) have energies where the neutron capture cross-sections peak, and the probability of capture exceeds the probability of fusion.
* _Fast neutrons_ (1-10 MeV) are produced by nuclear fission. They have a Maxwell-Boltzmann distribution of energy with a mean energy of 2 MeV in the case of uranium-235 fission.

Thermal reactors use thermal neutrons to sustain the fission chain reaction. They thus slow down the produced fast neutrons using a neutron moderator, until their energy is in thermal equilibrium with the atoms in the system. [Fast reactors](https://world-nuclear.org/information-library/current-and-future-generation/fast-neutron-reactors.aspx), on the other hand, use fast neutrons to sustain the fission chain reaction, not using any neutron moderator.

The energy of a neutron has a big impact on its cross-sections. An important property of a reactor core thus is its neutron energy distribution.

# Neutron interactions

Since neutrons have no charge, they pass easily through electron clouds and directly interact with nuclei. Those interactions can be thought of as two steps: first the neutron is absorbed by the nucleus, forming a compound nucleus, which then decays.

There are two main kinds of interactions: scattering and absorption.

**Elastic scattering** (n,n): The neutron and nucleus are left unchanged, no energy is transferred. Q=0. It can be understood as a collision where the neutron bounces off the nucleus, and is the only interaction that is not considered to form a compound nucleus.

**Inelastic scattering** (n,n'): The neutron penetrates the nucleus, forming a compound nucleus in an excited state. This compound nucleus returns to its ground state by gamma decay, emitting a neutron.

In general, scattering refers to nuclear reactions in which the outgoing particle is the same as the incident particle.

**Radioactive capture** (n,{{< katex "\gamma" >}}): The neutron is absorbed by the nucleus, and gamma rays are emitted. Other neutron absorption reactions are (n,{{< katex "\alpha" >}}) and (n,p), which can be either exothermic or endothermic.

**Neutron production** (n,2n) and (n,3n): The nucleus emits one or more neutrons. For example, {{< katex "{}^2H" >}} and {{< katex "{}^9Be" >}} have loosely bound neutrons that can easily be extracted.

**Fission**: The neutron causes the nucleus to split into two fission products, emitting 2 to 4 neutrons and releasing energy.
{{< katex display="X \to Y + Z + {}^1_0n" >}}
This can also happen spontaneously, but it's unlikely. (Californium has an exceedingly high probability for spontaneous fission, ~3%, which is why it is sometimes used to jumpstart nuclear reactors).

_Example:_ Uranium fission

{{< katex display="{}^1_0n + {}^{235}_{92}U \,\to\, {}^{236}_{92}U \,\to\, {}^{92}_{36}Kr + {}^{141}_{56}Ba + \sim2.5{}^1_0n" >}}

The energy of the resulting neutrons is a probability distribution, with the most likely energy ~700 keV and the average energy ~2 MeV. The are, however, too high-energy to engage in further fission events. In a reactor, they thus need to be slowed down by a moderator like water, where neutrons successively lose energy through elastic scattering.

**Fission vs fusion and the iron valley:**
![Iron valley](/images/docs/ironvalley.png)
(Picture taken from MITx 22.011x course slides.)

# Cross-sections

Cross-sections characterize the probability of a neutron interaction, quantified in terms of characteristic target areas (where a larger area means a larger probability of interaction).

The **microscopic cross-section** {{< katex "\sigma" >}} specifies the probability of a particular neutron interaction with a target nucleus, depending on the energy of the neutron.

The **macroscopic cross-section** {{< katex "\Sigma" >}} specifies this probability of a neutron interaction for the whole medium.
It is considered per unit path length that the neutron travels. The average distance a neutron travels before interacting with a nucleus is its **mean free path** {{< katex "\frac{1}{\Sigma}" >}}.

**Resonance region:**
> When the sum of the kinetic energy of the neutron and the binding energy correspond to an energy level of the compound nucleus, the neutron cross section exhibits a spike in its probability of interaction which are called resonances.
