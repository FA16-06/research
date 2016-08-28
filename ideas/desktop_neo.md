# Desktop Neo

This would be an implementation of some of the ideas of the Desktop Neo
conceptual desktop. We would likely build this around a custom desktop/window
manager for Linux, perhaps based on the 2wm window manager. Some of the things
we might implement are:

* panels (a different way to interact with apps)
* finder (a better way to access files and search for them)
* gestures (patterns on the trackpad that act as shortcuts for common uses)
* tags (a filesystem which features tags as a first class citizen, perhaps using
 a FUSE module)
* gaze interaction (switch to different windows based on which one you are
  looking at)
* voice interaction (speak to your computer to do things)

# Specifications

Which operating system do we want to build this for? Linux is fun to build for,
but Mac OS is also a worthy choice.

Which window manager might we base this on? 2wm is an option I know of.

Would we make a new filesystem or just a layer on top of an existing one? FUSE
is an option I know of.

What might we use for gaze interaction?

What might we use for voice interaction? CMUSphinx is one option I know of.

# Requirements

TBD.

# Additional Reading

* [Desktop Neo Official Website](https://www.desktopneo.com/)
* [2wm Window Manager](http://git.suckless.org/2wm/tree/README)
* [FUSE Overview](https://en.wikipedia.org/wiki/Filesystem_in_Userspace)
* [CMUSphinx Official Website](http://cmusphinx.sourceforge.net/)
