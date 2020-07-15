---
title: "Nuclear reactions"
summary: "Q-value, alpha, beta, and gamma decay, decay rate and probability, radioactive dating."
date: 2019-11-15
weight: 8
math: true
toc: true
---

Nuclear reactions are reactions where nuclear particles interact; comprising decay processes as well as collision reactions like fission and fusion.

**Notation:** {{< katex "a + A \to B + b" >}} or {{< katex "A(a,b)B" >}}

Where:

* {{< katex "a" >}} the projectile
* {{< katex "A, B" >}} nuclei
* {{< katex "b" >}} the ejectile(s)

Nuclear reactions conserve:

* mass (number of nucleons)
* energy
* momentum
* charge

# Q-value

The _Q-value_ of a nuclear reaction is a measure of energy transfer: the amount of mass that is turned into energy, i.e. the difference between the sum of the masses of the initial reactants and the sum of the masses of the final products.

Given conservation of mass and energy (and the equivalence of mass and energy), for a reaction

{{< katex display="a + A \to B + b" >}}

the following must hold:

{{< katex display="E_{a,\text{kin}} + m_a c^2 + E_{A,\text{kin}} + m_A c^2 = E_{B,\text{kin}} + m_B c^2 + E_{b,\text{kin}} m_b c^2" >}}

Sometimes the kinetic energy of a nucleus at rest ({{< katex "E_{A,\text{kin}}" >}}) is very small compared to the other kinetic energies, and thus can be neglected. This is, however, not the case for fission with thermal neutrons.

And since the reaction results have equal (though opposite) momentum, we also have:

{{< katex display="m_b E_{b,\text{kin}} = m_B E_{B,\text{kin}}" >}}

The Q-value is the difference in mass (or kinetic energy) between before and after the reaction:

{{< katex display="Q=((m_a + m_A) - (m_b + m_B))\,c^2\ \text{[amu]}" >}}

Or, using the conversion factor 1 amu = 943.49 {{< katex "\frac{\text{MeV}}{c^2} " >}}:

{{< katex display="Q=((m_a + m_A) - (m_b + m_B))\times 931.49\ \text{[MeV]}" >}}

{{< katex "m" >}} can be both the mass of the nuclei and the mass of the neutral atoms (be aware which one, because it does make a difference).

The Q-value can also be computed on the basis of the binding energies:

{{< katex display="Q=((BE_a + BE_A) - (BE_b + BE_B)) \text{[MeV]}" >}}

(Note that the binding energy of a neutron is 0, as it is not bound anywhere.)

If the binding energy of the product nuclei is larger than that of the initial nucleus, i.e. when the reaction produces a more stable configuration, energy is released.

When {{< katex "Q" >}} is positive, there is a net increase in the energy of the particles. The reaction is **exothermic**. The energy surplus comes from a conversion of mass to kinetic energy.

When {{< katex "Q" >}} is negative, there is a net decrease in energy, i.e. energy has to be supplied for the reaction to take place. The reaction is **endothermic**. Energy is usually supplied in the form of kinetic energy of the incident particle, which is then partly converted into mass.

# Decay

Emitted particles are referred to by their Greek letters when they come from the nucleus. So its origin from the nucleus is what what makes Helium an alpha particle, what makes an electron or positron a beta particle, and what makes photons (electromagnetic waves) gamma rays.

## Alpha decay

{{< katex display="{}^A_Z X \to {}^{A-4}_{Z-2} Y^{(-2)} + {}^4_2He^{(+2)}" >}}

A relatively heavy atom emits an alpha particle, in order to get to a more stable state. Alpha particles are Helium nuclei {{< katex "{}^4_2He^{2+}" >}}, i.e. Helium atoms stripped off their electrons. The positive charge of {{< katex "+2" >}}, in fact, doesn't last long, as alpha particles are very quick to grab two electrons; likewise {{< katex "Y" >}} has a negative charge of {{< katex "-2" >}} but very quickly loses the two excess electrons.

**Example:**
![Alpha decay](/images/docs/decay_alpha.png)
(The y-axis is released energy, the x-axis is atomic number Z. Arrow to the left means decreasing the number of protons.)

## Beta decay

Beta decay comes in two flavors, with beta particles being electrons and positrons from the nucleus.

## Beta minus ({{< katex "\beta^-" >}}) decay

A neutron splits into a proton and an electron as well as an antineutrino.
{{< katex display="{}^A_Z X \to {}^{\ \ \ \ A}_{Z+1} Y^{(+)} + {}^{\ \ \,0}_{-1}e + \overline{v}" >}}

The resulting atom {{< katex "Y" >}}has a positive charge but is very quick in capturing an electron to become neutral again.

**Example:**

![Beta minus decay](/images/docs/decay_betaminus_b12.png)
![Beta minus decay](/images/docs/decay_betaminus_c14.png)

(Arrow to the right means increase of protons.)

## Beta plus ({{< katex "\beta^+" >}}) decay

A proton is transformed into a neutron, and a positron and a neutrino are emitted.
{{< katex display="{}^A_Z X \to {}^{\ \ \ \ A}_{Z-1} Y^{(-)} + {}^0_1e + v" >}}

**Example** (EC = electron capture):
![Beta plus decay](/images/docs/decay_betaplus.png)

## Gamma decay

Reconfiguration of an atom to go from an excited state to a ground state. The nucleus is not changing, it just loses energy but emitting high energy gamma rays {{< katex "{}^0_0\gamma" >}}. These high wave-length electromagnetic waves are _photons_, particles with zero rest mass and charge, traveling at the speed of light.

Usually, the de-excitement happens in an unmeasurable short time after the excited state was formed. When it is delayed, the longer-lived excited states are called _isomeric states_, and decays from these states are called _isomeric transitions_ (IT).

**Example:**
![Gamma decay](/images/docs/decay_gamma.png)
(Atom number does not change, thus line is straight down.)

IT competes with with _internal conversion_ (IC), which can be thought of the gamma ray hitting an electron on the way out of the nucleus, leading to the gamma ray to be absorbed and the electron to be emitted from the atom. Subsequently, an outer electron will fill the resulting hole, emitting an x-ray (which could also hit an electron on the way out; the thus emitted electron is called Auger electron).

## Decay rate and decay probability

The decay rate of nuclei is specified as:

{{< katex display="\frac{dN}{dt}=-\lambda N" >}}

Where {{< katex "N" >}} is the number of nuclei present, and {{< katex "\lambda" >}} is the decay constant for the element. If nuclides are also produced at a constant rate {{< katex "R" >}}, the right-hand side changes to {{< katex "-\lambda N + R" >}}.

The analytical solution to this differential equation is:

{{< katex display="N(t)=N(0)\,e^{-\lambda t}" >}}

Where {{< katex "N(t)" >}} is the number of nuclei still present at time {{< katex "t" >}}, and {{< katex "N(0)" >}} is the initial number of nuclei. Or, in the case of simultaneous constant production:

{{< katex display="N(t)=N(0)\,e^{-\lambda (t)} + \frac{R}{\lambda}(1-e^{-\lambda (t)})" >}}

{{< katex "\frac{N(t)}{N(0)}" >}} is the ratio of nuclei surviving until time {{< katex "t" >}}. This can be seen as the probability of one nucleus to survive up to {{< katex "t" >}}, so {{< katex "1-\frac{N(t)}{N(0)}" >}} corresponds to the probability of the nucleus decaying until {{< katex "t" >}}. With {{< katex "\frac{N(t)}{N(0)}=e^{-\lambda t}" >}}", this gives the following probability of a nucleus to have decayed after time {{< katex "t" >}}:

{{< katex display="p = 1 - e^{-\lambda t}" >}}

(For infinitesimal {{< katex "t" >}} this can be approximated as {{< katex "\lambda t" >}}.)

This matches the intuition that the probability of decaying until one half-life is 0.5, the probability of decaying until two half-lives is 0.75 (0.5 + 0.5*0.5, or: the conditional probability of decaying within one half-life plus the conditional probability of decaying within the second half-life given it survived the first half-life), and the probability of decaying within a very large number of half-lives approaches 1.

The decay constant is related to the half-life {{< katex "T" >}} as follows (which we arrive at when setting {{< katex "N=\frac{1}{2}N(0)" >}}"):

{{< katex display="\lambda = \cfrac{\text{ln}\,2}{T}" >}}and {{< katex "T = \cfrac{\text{ln}\,2}{\lambda}" >}}

The average life expectancy (or _mean life_) of a nucleus is {{< katex "\frac{1}{\lambda}" >}}.

**Code:** [github.com/cunger/simulacron/nuclei](https://github.com/cunger/lab/tree/master/nuclei)

## Radioactive dating

Solving the decay equation for {{< katex "t" >}} allows for radioactive dating, e.g. where {{< katex "N(t)" >}} is the current amount of carbon-14 present in the sample, {{< katex "N(0)" >}} is the amount of carbon-14 in living tissue, and the half life of carbon-14 is 5700 years.

**Code:** [decay.exs](https://github.com/cunger/simulacron/blob/master/decay.exs)
