---
title: "Atoms"
summary: "What atoms are composed of, their energy, charge, mass, and stability."
date: 2019-11-04
weight: 7
math: true
toc: true
---

# Composition

Atoms consist of a nucleus of protons ({{< katex "{}^1_1p" >}}) and neutrons ({{< katex "{}^1_0n" >}}), called _nucleons_, together with surrounding electrons ({{< katex "{}^{\ \ \ 0}_{-1}e" >}}).  

**Notation:** {{< katex "{}^A_Z X^C" >}}

* {{< katex "X" >}} the element symbol
* {{< katex "Z" >}} the atomic number (the number of protons)
* {{< katex "A = Z + N" >}} the mass number (with {{< katex "N" >}} the number of neutrons)
* {{< katex "C" >}} the overall charge of the atom

For example:
* {{< katex "{}^1_1H" >}} is a neutral Hydrogen atom consisting of 1 proton and 1 electron.
* {{< katex "{}^4_2He^{+}" >}} is a Helium atom with 2 protons, 2 neutrons, and 1 electron.

Elements are determined by their number of protons.

* A **neutral atom** has the same number of protons and electrons, thus has an overall net charge of 0.
* An **ion** has a different number of electrons, and thus has a positive or negative net charge. Ionizing radiation is anything that has enough energy to eject an electron from an atom, thus forming an ion.
* An **isotope** has a different number of neutrons, and thus has a different mass.

Nuclei are quantum mechanical systems, thus can be found in different energy states. {{< katex "{}^A_Z X" >}} denotes the _ground state_, {{< katex "{}^A_Z X^\ast" >}} denotes an _excited state_ (with more energy). Long-lived excited states are called _isomeric states_.

# Electrical charge

Particles with different charge are subject to electrostatic attraction, particles with like charge are subject to electrostatic repulsion.

Most protons p+ have a positive charge, and most electrons e- have a negative charge. (Positive electrons e+ are called _positrons_ and are relatively rare.)

# Mass

The _atomic weight_ of an atom is defined as the mass of the neutral atom relative to the mass of a neutral carbon-12 atom (the most common isotope of carbon). Since it is a ratio, it is unitless, specified in terms atomic unit masses `amu`.

Rest masses of atomic particles:
```
mass_proton   = 1.0072766   amu = 938.256 MeV
mass_neutron  = 1.0086654   amu = 939.550 MeV
mass_electron = 0.000548597 amu = 0.511006 MeV
```

The actual mass of an atom is a bit smaller than the sum of its particles. This mass defect ({{< katex "\Delta = m_\text{atomic} - A" >}}) is the atom's binding energy, see the section below.

# Energy

The electrons and nucleons in an atom can be in different states. The _ground state_ is the state of lowest energy and constitutes the one in which the atom is normally found. When an atom possesses more energy than its ground state energy, it is in an _excited state_.

Atoms do not remain in an excited state indefinitely, they will return to their ground state, usually by emitting a photon.

## Mass defect and binding energy

The _mass defect_ ({{< katex "\Delta = m_\text{atomic} - A" >}}) is the difference between the sum of the masses of all nucleons (greater) and the observed mass of the nucleus (smaller). This difference corresponds to the _binding energy_ in the nucleus. That is, some of the mass of the nucleons was converted to binding energy when the nucleus was formed, corresponding to the work required in order to separate the nucleons again.

**Binding energy:**

{{< katex display="B(A,Z) = (Z\times m_\text{proton} + (A-Z)\times m_\text{neutron} - m_\text{atomic}(A,Z)) c^2 \text{[amu]}" >}}

Using the conversion factor 1 amu = 943.49 {{< katex "\frac{\text{MeV}}{c^2} " >}}, this gives:

{{< katex display="B(A,Z) = (Z\times m_\text{proton} + (A-Z)\times m_\text{neutron} - m_\text{atomic}(A,Z))\times 943.39 \text{[MeV]}" >}}

Note that binding energy and atomic mass are negatively related, i.e. the higher the binding energy of a nucleus, the lower its mass, and vice versa.

(Also note that {{< katex "m_\text{atomic}(A,Z)" >}} includes the electrons, but the error in disregarding their isolated mass is very small.)

Energy release in nuclear reactions happens on an MeV scale, while chemical reactions release energy on an eV scale.
In order to raise the (kinetic) energy of a particle in the MeV range, we thus need particle accelerators (as chemical heating could raise the kinetic energy only in the eV range).

![Binding energy per nucleon](/images/docs/bindingenergy.gif)

From the right towards iron, fission reactions release binding energy.
From the left towards iron, fusion reactions release binding energy.

# Stability

The stability of a nucleus depends, among others, on the number of nuclei and the ratio of protons vs neutrons, including even vs odd numbers of protons and neutrons.
Also, the more binding energy a nucleus has, the more stable it is.
(On average, a mass defect {{< katex "\Delta > 0" >}} means the nucleus is stable, while a mass defect {{< katex "\Delta < 0" >}} means the nucleus is unstable.)

Unstable elements decay (usually in a decay chain) in order to reach the most stable configuration.  

Elements with {{< katex "Z<20" >}} tend to be stable if {{< katex "\frac{N}{Z}=1" >}}, i.e. if they have the same number of protons and neutrons in the nucleus. With exceptions, e.g. {{< katex "{}^{14}_{\ 6}C" >}} (carbon-14) is unstable.

For elements with high {{< katex "Z" >}}, the stable ratio is about {{< katex "\frac{N}{Z}=1.5" >}}, i.e. if they have more neutrons than protons. The reason is that the strong force that holds together protons in the nucleus (overcoming their electrostatic repulsion) acts only at very short distances. In larger nuclei, the distances get too big and finally repulsion begins to win over. More neutrons can help keeping a balance, but only up to a certain point. Elements with {{< katex "Z>83" >}} are pretty much all unstable.

Isotopes with even numbers of protons and neutrons tend to be more stable. Especially stable are nuclei with a **magic number** of {{< katex "Z" >}} or {{< katex "N = 2, 8, 20, 28, 50, 82, 126" >}}, as the average binding energy per nucleon is higher than expected (maybe because they correspond to closed shells in the nucleus). Also, atoms with a magic number of neutrons are reluctant to absorb neutrons and thus make good materials where neutron absorption must be avoided.

![Stability](/images/docs/stability.jpeg)

(Image source: [Chemistry Libre Texts](https://chem.libretexts.org/Courses/University_of_Missouri/MU%3A__1330H_(Keller)/21%3A_Nuclear_Chemistry/21.2%3A_Patterns_of_Nuclear_Stability))
