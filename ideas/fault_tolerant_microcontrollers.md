# Fault Tolerant Microcontrollers

We would be building a system where we can test and demonstrate different fault
tolerance techniques. This would likely be demonstrated by emulating a simple
computer architecture and adding proxies to the memory reads/writes that
sometimes randomly distort the bits. Then we would write programs for that
simple architecture which attempts to resolve any problems that they have.

# Specifications

I feel that a good architecture to use (labeled $ARCH for the rest of this
document) would be the CHIP-8 architecture. This is because there are only a
handful of instructions (35) and the majority of applications written for it are
games, which would be a nice demo to show off when it comes time to do our
poster (in particular, I think it would be cool to show how the original code
fails after some random bits are flipped and then show how the new one is a
little slower, but ultimately can recover a lot faster/easier).

# Requirements

* 1\. It must be able to run existing programs for $ARCH.
    * 1\.1\. It must have a full test suite that it can run to test itself.
* 2\. It must be able to randomly flip bits according to a given parameter.
    * 2\.1\. It must be repeatable according to some random seed.
    * 2\.2\. It must log the actions that it takes.
    * 2\.3\. It must be able to flip bits in registers as well as RAM.
* 4\. It must have an way to interact with the simulations.
    * 4\.1\. It must be able to tune the randomness parameter.
    * 4\.2\. It must be able to show the changes it made to memory.
    * 4\.3\. It must be able to show the output from the program.

# Additional Reading

* [Fault Tolerance Overview](https://en.wikipedia.org/wiki/Fault_tolerance)
* [CHIP-8 Overview](https://en.wikipedia.org/wiki/CHIP-8)
* [Specific Techniques for Fault Tolerance in Noisy/Radioactive Environments](http://stackoverflow.com/questions/36827659/compiling-an-application-for-use-in-highly-radioactive-environments)
