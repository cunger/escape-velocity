---
title: "Electromagnetic radiation"
summary: "Making waves."
date: 2019-11-05
weight: 3
math: true
toc: true
---

A charge creates an electric field, and a current creates a magnetic field. Also, a changing electric field induces a magnetic field and vice versa.

_Electromagnetic waves_ are a magnetic field {{< katex "B" >}} and an electric field {{< katex "E" >}} generating each other. They're self-sustaining and thus can travel without a medium.

![Electromagnetic wave](https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/EM-Wave_noGIF.svg/1024px-EM-Wave_noGIF.svg.png)
(Image source: WikiMedia)

_Mechanical waves_ are caused by a disturbance or vibration in matter (solid, gas, liquid, plasma). For example, sound waves are formed by vibrations in air or water. They travel through their medium by causing the molecules to bump into each other, transferring energy from one to the next. In vacuum, there is no medium to transmit mechanical waves. So sound waves, for example, cannot travel in space.

# Electromagnetic spectrum

A wave's **frequency** {{< katex "\nu" >}} is the number of full wavelengths {{< katex "\lambda" >}} that pass by a given point in space every second. Its unit is Hertz (Hz), which is equivalent to per second ({{< katex "s^{-1}" >}}).

In vacuum, electromagnetic waves travel at the constant speed of light, and they're slowed down when traveling through matter.

{{< katex display="c=\lambda\nu" >}}

The more energy an EM wave has, the shorter its wavelength, and vice versa. See the [electromagnetic spectrum](https://eo-college.org/wp-content/uploads/2017/09/electromagnetic-spectrum-nasa.jpeg). High-energy EM waves, starting somewhere in the ultraviolet, are ionizing, i.e. they have enough energy that they can give electrons enough energy to escape their atoms, forming ions. Earth's atmosphere has an optical window and a radio window, and absorbs most of the other wavelengths. This shields us especially from ionizing radiation from the sun. On the other hand, the atmosphere is transparent to radio waves and thus makes radar remote sensing possible (which is largely independent of cloud coverage and rain fall, as the size of those droplets is much smaller than the wavelength).

# Stefan-Boltzmann law

Electromagnetic radiation (_light_) is the flow of energy in the form of electromagnetic waves. All objects with a temperature above absolute zero emit energy in the form of electromagnetic radiation, across all frequencies. The relationship between radiated energy and temperature of an object is captured by the **Stefan-Boltzmann Law**:

{{< katex display="P=eA\sigma T^4" >}}

Where
* {{< katex "P" >}} is the power radiated (energy per unit time) per unit surface area
* {{< katex "A" >}} is the surface area
* {{< katex "T" >}} is the temperature of the object
* {{< katex "e" >}} is the emission coefficient, a measure for how good of a radiator the object is, ranging from 0 to 1 (1 for a blackbody and a function of {{< katex "\lambda" >}} for real bodies)
* {{< katex "\sigma=5.67 * 10^{-8} \frac{W}{m^2K^4}" >}} is the Stefan-Boltzmann constant (the power per unit area emitted by a black body, i.e. an object that absorbs all energy and reflects none)

The Stefan-Boltzmann law can also be used to calculate the net heat flux between two objects that radiate toward each other.

# Photons

Energy is emitted and absorbed in whole number multiples of {{< katex "h\nu" >}}, where {{< katex "h=6.626 * 10^{-34} J" >}} is **Planck's constant**. Energy thus is _quantized_. A quantum of an electromagnetic wave is a **photon**. When an atom or molecule loses energy, it emits a photon that carries exactly that energy. That energy is given by:

{{< katex display="E=h\nu" >}}
