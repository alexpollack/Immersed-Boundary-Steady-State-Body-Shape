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
## Standard shapes: Circle and Oval

![alt text](/images/oval_circle.png "Oblong Shapes")


## Oblong Shaped Bodies: Blob, Log, Pole
![alt text](/images/polecircbloblogshapes.png "Oblong Shapes")

These were to see if forcing the body to maintain a distinct (in the raindrop cases) shape similar to what may have been expected
   
## Forced Result Bodies: Upside Down Raindrop, Raindrop, Upside Down Egg, Egg
![alt text](/images/ovalorder.png "Forced Shapes")

These were to see if elongated shape or even horizontal start would increase/decrease steady-state tendency. ”Blob” essentially has the observed steady-state shape

## What Was Noticed?

![alt text](/images/xpos_p5.png "X-Position Vs. Time")

The most interesting thing observed was that it seemed initial shapes more closely centered/more similar to a circle tended to have the least dramatic x-trajectory, while ”Blob” and “Log” seem to phase away from the rest.

The main commonality between these last two is that they are the first two that begin to become horizontally positioned shapes, and this seems to show some sort of trend going forward

## 1st Trend
The first trend noticed was that it while looking at the x-positions of the the various shapes, it seemed that Pole and circle were nearly the same, but 180˚ out of phase. 

![alt text](/images/polecircbloblogshapes.png "Phase Order")

Almost at the same time, I noticed it also seemed as though from Circle to Blob, and then Blob to Log was a translation of the same wave, predominately in x (large shift down) as well as slightly in time (slightly shifts right).

Stepping back to look at it together with the body shapes (top right), it makes sense that these may be sequential steps and related shapes at 4 different phases in time. As the body starts shaped like Pole and tries to reshape to something more stable (Circle), and bounces in between Pole, Circle, (something like) Blob, to Log and back.

![alt text](/images/polecirclebloblog.png "Phase Wave Order")

Given the initial shape being Pole, the laws of physics in mind, it makes sense to see this happen to the shape of the elastic bodies.

Here, the positions of these four bodies were normalized so it can be seen that they are in fact a set of four out of phase waves as it sways back and fourth in the x-dimension.

It can also bee seen from this plot that having the initial shape of circle is the most stable in terms of displacement from initial position. As the initial shape becomes more and more similar to circle, while the body still sways in x, its overall displacement stays considerably inline with the initial centered x position.

![alt text](/images/normalpolelogset.png "Phase Wave Order")

## 2nd Trend
Something similar can somewhat be seen between another set, Raindrop, Oval, Upside Down Raindrop, Egg, Upside down Egg, and Circle. 

![alt text](/images/ovalorder.png "Oval Phase Wave Order")

Moving left to right, top to bottom in the top left figure, it can been seen visually how the shape of the elastic body could transition from Raindrop to Circle. This can be seen also in the x-position plot, as it appears that Circle is the most stable in terms of x-position. 

That is, displacement stability of the order noted above seems to be the same as the order of x-position curves, top to bottom (most to lease displacement from initial x = 0.5). As the initial shape becomes more and more similar to circle, while the body still sways in x, its overall displacement stays considerably inline with the initial centered x position.

![alt text](/images/ovalorder_pos.png "Oval Phase Wave Order")

## Y-Position
While no trends as interesting as those in x-position were noticed in the y-position, there were still some surprising details. 

Considering the similarities seen before between shapes Pole and Log, Pole “sank” at roughly similar rate as Circle, while Log was much slower. In fact for the most part Log had the slowest descent. 

A similarity between the Raindrops and the Eggs can be seen, however. That is that for both shapes, the upward facing of the two appeared to have a slower descent. 

![alt text](/images/ypos_p5.png "Y-Position")

## Area Over Time
To me, for what was being looked at in these test the area over time was what I had expected to be the most interesting due to the different initial shapes. It had made sense to me that the more distressed the initial shape (Log, Pole, Raindrop), the more quickly the body may reduce in area. Here, area is the region within the shape, being a 2D system. 

![alt text](/images/normalizedarea.png "Area Over Time")

It instead appeared that they were all relatively similar, with Circle having the most nearly linear change in area. 


# Conclusions
* Regardless of the initial shape for a falling body immersed in a fluid, the apparent steady-state shape for the or relaxed falling shape for the body appears to be roughly a circle
* The expected steady steady-state shape similar to that of either a rain drop or more like a torpedo was not the experimental result
* As the body falls, it has a sway in the x-position that can be shown as a sinusoidal 
* Depending on the initial shape, the sway in the x-position can be modeled as phases of the same trend for a body that starts initially as a circle. These phases can show different points in the rotation of the body due to its initial shape, modeling different points in its path toward a steady-state shape
* On average the initial shape did not effect the rate of change of the area dramatically, while for certain shapes the area change spiked in the beginning, by the end of the max time the trends were all on a relatively similar path


