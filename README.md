#### Description
MetronOSH is a fully open source (hardware and software) extended function metronome.  By providing functions only found in $100+ proprietary devices, it allows proper music rehearsal to be as accessible and free as the act of enjoying music itself.  The open source design of MetronOSH allows it to evolve and adapt to new styles and techniques to better suit the ever-changing musical culture.

While it is commonly said that "practice makes perfect," practice is only effective if the correct skills are in use.  Rehearsing without the consistent rhythm of a metronome reinforces improper techniques and bad habits.  MetronOSH hopes to effectively eliminate these cases and bring rhythmic accuracy to everyone.

#### Schematics
Circuit schematics were generated with the open source `gschem` application, part of the [gEDA](www.gpleda.org) suite of design tools.  Designs generated by this tool are located in the `sch/` directory.

#### Firmware
FIrmware source code for MetronOSH is included in the `src/` directory.  It is currently written only for ATMEga328-based [Arduino](www.arduino.cc) devices (the Deumilanove and Uno), though porting to other Arduino devices should be easy.  Eventually, a univeral source file may be developed for use on several devices, but at the moment I am limited by the devices I have.
