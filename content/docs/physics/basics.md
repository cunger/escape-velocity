---
title: "Units and constants"
summary: "Nothing more. Nothing less."
date: 2019-11-16T12:00:51+01:00
weight: 1
math: true
toc: true
---

# Prefixes

```
k  (kilo)  = 1.0e3  = 1000
M  (mega)  = 1.0e6  = 1_000_000
G  (giga)  = 1.0e9  = 1_000_000_000
T  (tera)  = 1.0e12
P  (peta)  = 1.0e15
E  (exa)   = 1.0e18

c  (centi) = 1.0e-2 = 0.01
m  (milli) = 1.0e-3 = 0.001
mu (micro) = 1.0e-6 = 0.000001
n  (nano)  = 1.0e-9 = 0.000000001
p  (pico)  = 1.0e-12
```

# Units

**Newton** (N) = {{< katex "kg\cdot\cfrac{m}{s^2}" >}}

**Joule** (J) = {{< katex "kg\cdot\cfrac{m^2}{s^2} = N\cdot m" >}}. 1 Joule is the energy transferred when a force of 1 Newton is applied to an object, moving it a distance of 1 meter.

Power is given in **Watts** (W) = {{< katex "\cfrac{J}{s}" >}}.

Pressure is given in **Pascal** (Pa) = {{< katex "\cfrac{J}{m^3}" >}} (with {{< katex "1\,\text{Pa}=10^{-5}\,\text{bar}" >}}). Atmospheric pressure is 101325 Pa.

The **atomic mass unit** is defined such that the atomic weight of a neutral carbon-12 atom in its ground state is exactly 12 amu.
```
1 amu = 1.66053906660e−27 kg
      = 1.49241808560e−10 J
      = 931.49410242 MeV
```
The ratio of amu/atom is the same as the ratio of g/mol. **Mole** is a measure for the amount of a substance, where one mole is the quantity of anything that has the same number of atoms found in 12.000 grams of carbon-12, which are 6.023e23 atoms (**Avogadro's number**). So there are 6.023e23 atoms/mol.

The **electronvolt** is the energy gained or lost by an electron when accelerated through 1 volt of electric potential difference.
```
1 eV  = 1.602176634e-19 J
```
Electronvolt can also be used as a unit of mass, which is usually given in {{< katex "\cfrac{\text{eV}}{c^2}" >}} (with {{< katex "c" >}} the speed of light in vacuum).

The conversion factor between amu and MeV is {{< katex "931.49 \cfrac{\text{MeV}}{\text{amu}\cdot c^2}" >}}.

Cross-sections are specified in **barn**.
```
1 barn = 10e-28 m^2
```

Distances on the sub-atomic level are usually given in **fermi**.
```
1 fm = 10e-15 m
```

## Activity and radiation dose

The activity of decay is usually given in **Curies**.
```
1 Ci = 3.7e10 disintegrations (decayed nuclei) per second
```

**Gray** specifies the energy absorption of some mass. Multiplying it by a quality factor gives a risk in **Sievert**.
```
1 Gy = 1 J/kg
1 Sv = Q * Gy
```
The quality factor is the product of a factor for the type of tissue and one for the type of radiation.
* `Q=1` for X rays and gamma and beta rays of all energies.
* `Q=5...20` for neutrons, depending on their energy (highest for `0.1...2 MeV`).
* `Q=20` for alpha particles (because they have a very short range and deposit a great amount of energy, so they're not that harmful when outside the body but very harmful when inside it).
* `Q` is higher for tissue with more quickly dividing cells (because then the cells divide with the defect before cell repair mechanisms can fix it, more quickly spreading it), and therefore also at younger age.

Corresponding non-SI units are **rad** (energy absorption, where `1 erg = 10^(-7) J`) and **rem** (Roentgen equivalent man, specifying increased cancer risk).
```
1 rad = erg/g
1 Gy = 100 rad
1 Sv = 100 rem
```

# Constants

```
e = 2.718281828459045
c = 299_792_458 m/s
```
