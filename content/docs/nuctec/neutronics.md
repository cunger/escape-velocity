---
title: "Neutronics"
summary: "Neutrons, energy distribution, neutron interactions, iron valley."
date: 2019-11-16
weight: 9
math: true
toc: true
---

# Neutron classification

Free neutrons can be classified according to their kinetic energy.

* _Thermal neutrons_ (up to 1 eV) are in a thermal equilibrium with their surrounding, with the most probable energy at 20 degrees C being 0.025 eV (~ 2km/s). They often have a much larger #neutron absorption cross-section than fast neutrons.
* _Resonance neutrons_ (1 eV - 100 keV) have energies where the neutron capture cross-sections peak, and the probability of capture exceeds the probability of fusion.
* _Fast neutrons_ (1-10 MeV) are produced by nuclear fission. They have a Maxwell-Boltzmann distribution of energy with a mean energy of 2 MeV in the case of uranium-235 fission.

_Thermal reactors_ use thermal neutrons to sustain the chain reaction; they thus slow down the produced fast neutrons using a neutron moderator, until their energy is in thermal equilibrium with the atoms in the system.

_Fast reactors_ user fast neutrons for fission, not using any neutron moderator.

The energy of a neutron has a big impact on its cross-sections. An important property of a reactor core thus is its neutron energy distribution.

# Neutron interactions

Since neutrons have no charge, they pass easily through electron clouds and directly interact with nuclei. Those interactions can be thought of as two steps: first the #neutron is absorbed by the nucleus, forming a compound nucleus, which then decays.

There are two main kinds of interactions: scattering and absorption.

**Elastic scattering** (n,n): The nucleus is in its ground state and is left unchanged. Q=0.

**Inelastic scattering** (n,n'): The nucleus is left in an excited state. It then returns to its ground state by gamma decay.

In general, #scattering refers to nuclear reactions in which the outgoing particle is the same as the incident particle.

**Radioactive capture** (n,{{< katex "\gamma" >}}): The neutron is absorbed by the nucleus, and gamma rays are emitted. Other neutron absorption reactions are (n,{{< katex "\alpha" >}}) and (n,p), which can be either exothermic or endothermic.

**Neutron production** (n,2n) and (n,3n): The nucleus emits one or more neutrons. For example, {{< katex "{}^2H" >}} and {{< katex "{}^9Be" >}} have loosely bound neutrons that can easily be extracted.

**Fission**: The neutron causes the nucleus to split into two fission products, emitting 2 to 4 neutrons and releasing energy.
{{< katex display="X \to Y + Z + {}^1_0n" >}}
This can also happen spontaneously, but it's unlikely. (Californium has an exceedingly high probability for spontaneous fission, ~3%, which is why it is sometimes used to jumpstart nuclear reactors).

_Example:_ Uranium fission

{{< katex display="{}^1_0n + {}^{235}_{92}U \,\to\, {}^{236}_{92}U \,\to\, {}^{92}_{36}Kr + {}^{141}_{56}Ba + \sim2.5{}^1_0n" >}}

The energy of the resulting neutrons is a probability distribution, with the most likely energy ~700 keV and the average energy ~2 MeV. The are, however, too high-energy to engage in further fission events. In a reactor, they thus need to be slowed down by a moderator like water, where neutrons successively lose energy through elastic scattering.

**Fission vs fusion:**
![Iron valley](/images/docs/iron-valley.png)
(Picture taken from MITx 22.011x course slides.)