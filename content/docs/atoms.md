---
title: "Atoms"
summary: "What atoms are composed of, their energy, charge, mass, and stability."
date: 2019-11-04
weight: 5
math: true
toc: true
---

Atoms consist of a nucleus of protons (p+) and neutrons (n), called _nucleons_, together with surrounding electrons (e-).  

Elements are determined by their number of protons.

* A _neutral atom_ has the same number of protons and electrons, thus has an overall net charge of 0.
* An _ion_ has a different number of electrons, and thus has a positive or negative net charge. Ionizing radiation is anything that has enough energy to eject an electron from an atom, thus forming an ion.
* An _isotope_ has a different number of neutrons, and thus has a different mass.

**Notation:** {{< katex "{}^A_Z X^C" >}}

* {{< katex "X" >}} the element symbol
* {{< katex "Z" >}} the atomic number (the number of protons)
* {{< katex "A = Z + N" >}} the mass number (with {{< katex "N" >}} the number of neutrons)
* {{< katex "C" >}} the overall charge of the atom

For example, {{< katex "{}^4_2He^{+}" >}} is a Helium atom with 2 protons, 2 neutrons, and 1 electron.

Nuclei are quantum mechanical systems, thus can be found in different energy states. {{< katex "{}^A_Z X" >}} denotes the _ground state_, {{< katex "{}^A_Z X^\ast" >}} denotes an _excited state_ (with more energy). Long-lived excited states are called _isomeric states_.

# Electrical charge and rest mass

Particles with different charge are subject to electrostatic attraction, particles with like charge are subject to electrostatic repulsion.

Most protons have a positive charge, and most electrons have a negative charge. (Positive electrons e+ are called _positrons_ and are relatively rare.)

The _atomic weight_ of an atom is defined as the mass of the neutral atom relative to the mass of a neutral carbon-12 atom (the most common isotope of carbon). Since it is a ratio, it is unitless, specified in terms atomic unit masses `amu`.

```
mass_proton   = 1.007276 amu
mass_neutron  = 1.008665 amu
mass_electron = 0.000549 amu
```

The actual mass of an atom is a bit smaller than the sum of its particles. This mass defect is the atom's binding energy - the energy needed to separate the particles in the nucleus.

# Energy

The electrons and nucleons in an atom can be in different states. The _ground state_ is the state of lowest energy and constitutes the one in which the atom is normally found. When an atom possesses more energy than its ground state energy, it is in an _excited state_.

Atoms do not remain in an excited state indefinitely, they will return to their ground state, usually by emitting a photon.

# Stability

Elements with {{< katex "Z<20" >}} tend to be stable if {{< katex "\frac{N}{Z}=1" >}}, i.e. if they have the same number of protons and neutrons in the nucleus. In contrast, e.g. {{< katex "{}^{14}_{\ 6}C" >}} (carbon-14) is unstable.

For elements with high {{< katex "Z" >}}, the stable ratio is about {{< katex "\frac{N}{Z}=1.5" >}}, i.e. if they have more neutrons than protons. The reason is that the strong force that holds together protons in the nucleus (overcoming their electrostatic repulsion) acts only at very short distances. In larger nuclei, the distances get too big and finally repulsion begins to win over. More neutrons can help keeping a balance, but only up to a certain point; elements with {{< katex "Z>83" >}} are pretty much all unstable.

Especially stable are nuclei with a _magic number_ of {{< katex "Z" >}} or {{< katex "N = 2, 8, 20, 28, 50, 82, 126" >}}, as the average binding energy per nucleon is higher than expected (probably because they correspond to closed shells in the nucleus). Also, atoms with a magic number of neutrons are reluctant to absorb neutrons and thus make good materials where neutron absorption must be avoided.
