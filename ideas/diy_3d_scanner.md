# DIY 3D Scanner

We would be building a scanner that can be used to make a 3D computer-based
model of a real object.

# Specifications

There are two ways that I could see us doing this: a laser-operated system (not
too hard, but not too easy) or a natural-light-operated system (a lot
harder). Both systems would likely involve a camera (to determine where the
laser is from the view of the camera, which we could use to find the location in
3D space; or as the main input device to look at the object, respectively).

If we did the laser system, we would need some way to vary the laser angle or
position, but the camera would remain stationary. We could change up the
microcontroller and the motor that moves the laser as we see fit. We would also
need to look into some of the math involved in converting the laser angle and XY
coordinates on the camera plane to the XYZ coordinates of the surface of the
object.

If we did the natural light system, we would need to decide between letting the
camera move anywhere (e.g. being held by a person) or having the camera move
along a fixed path (e.g. around the object). We would need to look into the
libraries we could use for feature detection and matching, so that as we moved
the camera, we could determine how the points of the surface moved in relation
to the camera movement, which tells us the 3D position of it (one example of
this is using SIFT and GIST features of the images).

We would also need to decide which format to export the models using. A very
simple one is the OBJ format. Another one we could use is some sort of
voxel-based system.

# Requirements

TBD.

# Additional Reading

* [3D Scanner Overview](https://en.wikipedia.org/wiki/3D_scanner)
* [SIFT Features Overview](https://en.wikipedia.org/wiki/Scale-invariant_feature_transform)
