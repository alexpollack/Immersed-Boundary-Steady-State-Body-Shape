# Studying the Steady-State Body Shape of a Falling Immersed Body
## "Bubble Translation"


## The System
  The system of interest was that of a 2D closed body, immersed in a fluid, falling through that fluid. The body was created with a set number of body boundary points. The body was set to fall by creating a downward force applied equally across each point of the body, essentially giving it an equally distributed weight (and there for equal mass distribution) across the surface. To avoid rapid downward acceleration, the fluid was given a uniform upward (normal) force to counter this to create a simulated pseudo terminal velocity that the object reaches.

## Selection of constant values: Ks, Kb, Fd, Fn
  For a stable body and system, it was found the best selections for the stretching and bending force constants Ks and Kb were when Ks was relatively small and Kb was relatively large (relative to the system components, that is)
* Ks set around 0.0005
* Kb set around 1.0

  Let Fd and Fn be downward body force (weight) and fluid normal force (upward) respectively, it was found to be most stable when they were roughly around the ratio Fd : Fn ≈1:16
* Fd set around 0.08 ( magnitude = -0.08 since downward force, subtracted each timestep) 
* Fn set around 0.005

## What Was Being Studied
  Initially, I planned to study a rod/disconnected line in a similar system to see if as it fell it would take some optimal stable shape/how it would fall. However, as I began to set up the system I noticed something interesting when using closed body systems of different shapes.

  For different bodies of different initial shapes, but relatively similar initial areas, the apparent steady-state shape during descent in the fluid appeared to be a predominately circular.

  This was interesting to me, as considering the force and volume of the viscous fluid, to me it was excepted that as there was flow past the body it was take one of two shapes: 
  * Aerodynamic shape – a shape similar to that of a torpedo or airplane wing (pointed in direction of motion and “area bottom heavy” in the tail direction since the body has the same fluid inside and out. (represented by the upside down egg)
  * Logical shape – a shape somewhat similar to a rain drop, bottom heavy with a tail. This made sense because rain falling through air is a similar system, except this has a filled body that is denser than the fluid. It is also the common shape in nature for other such objects like the tail of a comet or heat trail of a meteor.

## Why Study This?
This was interesting to me, because it showed that it was more in the natural of the closed elastic immersed body to maintain an equilibrium shape more close to what would be a normal relaxed body (circular) even while falling through a fluid.

During the fall, the bodies appear to have a periodic sway left and right (x-direction), this was expected as well for the initial rod (like simulating a falling piece of paper). However here, before the body reaches a some sort of steady-state shape, it looks as though it almost bounces off the fluid, the fluid slowing it and causing it to make this left-right/right-left pattern, before reshaping to a circle and continuing this pattern.

To test this, I ran the system with various bodies of relatively similar initial areas and positions, but different initial shapes. Amongst these, I included some initial shapes close to what I expected the steady-state shape to be that I felt might give bias to lead to the expected shape.

# Body Shapes
Standard shapes:
![alt text](/graphics/gender_race.png "Standard Shapes")
