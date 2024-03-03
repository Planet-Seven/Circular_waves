# 01 Overview

Welcome to the Circular Wave Simulation documentation. This program is designed to simulate the propagation of circular waves within a visual medium, providing a platform for exploring the dynamics of wave interactions. Generative AI was used to draft some parts of the documentation, but NOT the code.

## Purpose
The primary goal of this simulation is to provide a visual representation of circular wave propagation. By rendering a grid of circles and altering their diameters to simulate wave effects, users can observe and experiment with phenomena such as constructive and destructive interference.

## Features
- **Interactive Wave Generation:** Users can create waves by clicking the left mouse button anywhere on the screen, initiating concentric circles representing wavefronts.
- **Realistic Wave Behavior:** Waves propagate outward from their source with customizable parameters such as speed, amplitude, and dissipation factor, allowing for realistic wave simulations.
- **Visual Customization:** The simulation offers flexibility in visual customization through adjustable constants, enabling users to create a wide range of visual effects and behaviors.

## Usage
To begin exploring the simulation, simply run the program and interact with the environment by creating waves with mouse clicks. Experiment with different parameter values to observe how they affect the behavior and appearance of the waves.

## Documentation Structure
This documentation consists of four main sections:
1. **Overview:** You're reading it! This section provides an introduction to the simulation and outlines its features and purpose.
2. **Wave Mechanics:** Here, you'll find a brief explanation of the mechanics behind circular waves, providing a conceptual understanding of the simulation.
3. **Code:** This section delves into the implementation details of the simulation, explaining how the code works and how it simulates physics.
4. **Variables:** Learn how to customize the simulation by adjusting various constants within the code, allowing for different visual effects and behaviors.
5. **Learnings:** Finally, explore reflections on the growth and learning experiences gained through the development of this simulation, offering insights into the creative and technical process.

# 02 Circular Waves in Wave Mechanics

Circular waves are a fundamental concept in wave mechanics, representing the propagation of disturbances through a medium in a circular pattern. These waves exhibit unique properties that can be mathematically described and visualized.

## Wavefront Propagation

When a wave is generated, it propagates outward from its source with a constant speed, resulting in the expansion of the wavefront over time. This propagation can be mathematically described using the equation:

r = v ⋅ t

Where:
- *r* is the radius of the wavefront,
- *v* is the speed of propagation, and
- *t* is the time elapsed since the wave was generated.

## Amplitude Modulation

The amplitude of a wave determines its intensity or strength at any given point in space. In this simulation, the amplitude of a circular wave is represented by the height of the wavefront, with larger amplitudes corresponding to taller wavefronts. Mathematically, the amplitude of a wave can be described as:

A(x,y,t) = Amax ⋅ sin⁡(2π/λ ⋅ sqrt((x−x0)²+(y−y0)²) − ωt + ϕ)

Where:
- *A(x,y,t)* is the amplitude of the wave at position (x,y) at time *t*,
- *Amax* is the maximum amplitude of the wave,
- *λ* is the wavelength of the wave,
- *(x0, y0)* are the coordinates of the wave source,
- *ω* is the angular frequency of the wave, and
- *ϕ* is the phase angle.

## Wave Interference

When multiple waves interact with each other, they undergo interference, resulting in complex patterns of reinforcement (constructive interference) or cancellation (destructive interference). This phenomenon arises from the superposition principle, which states that the total displacement at any point is the sum of the displacements caused by individual waves (Tsokos, 2014, p. 177).

# 03 Code

The provided code implements a simulation of circular wave propagation using the Processing programming environment. Here's how it works:

1. **Initialization:** The program initializes various constants and sets up the environment, including defining colors and establishing initial parameters for the waves.

2. **Wave Generation:** When the left mouse button is clicked, a new wave is created at the position of the mouse pointer. Each wave object stores its position (x, y) and its current radius.

3. **Wave Propagation:** In the `draw()` function, each existing wave expands outward with a constant speed. If a wave's radius exceeds a maximum threshold (`maxRadius`), it is removed from the simulation to prevent clutter.

4. **Circle Rendering:** The simulation renders a grid of circles across the screen. For each circle, the program calculates its radius based on the contribution of all active waves. The radius of each circle is determined by the distance to the nearest wavefront and the amplitude of the waves.

5. **Visualization:** The circles are drawn on the screen, visually representing the effect of the waves on the medium. The color and outline of the circles can be customized by altering the corresponding constants.

# 04 Variables

The behavior of the simulation can be modified by adjusting the following constants:

- **speed:** Speed of wave propagation.
- **maxRadius:** Maximum radius at which a wave gets deleted.
- **offset:** Spacing between individual points in the grid.
- **wavelength:** Wavelength of the waves in pixels.
- **waveCount:** Number of periods before wave propagation stops.
- **initialRadius:** Initial radius of the fixed circles.
- **amplitude:** Amplitude of a wave.
- **dissipationFactor:** Rate at which the wave dissipates. Higher values result in slower dissipation.
- **bgColor:** Background color of the simulation.
- **circleColor:** Color of the circles representing the waves.
- **outlineColor:** Color of the circle outlines.

By adjusting these constants, various visual effects and wave behaviors can be achieved.

# 05 Learnings

Engaging in the development of this simulation has provided valuable insights and growth opportunities as both a programmer and a designer. Through experimentation with the code and exploration of the underlying physics principles, I've gained a deeper understanding of wave mechanics and their visualization.

This project has reinforced the importance of parameter tuning and experimentation in creative coding. By tweaking constants and observing the resulting changes in the simulation, I've honed my ability to iterate and refine artistic creations through code. Additionally, the process of translating abstract concepts into interactive visualizations has enhanced my skills in both programming and design, fostering a more holistic approach to creative expression through technology.

Overall, the experience of developing this simulation has been both educational and fulfilling, pushing the boundaries of my technical capabilities while fostering a deeper appreciation for the beauty and complexity of wave phenomena.

