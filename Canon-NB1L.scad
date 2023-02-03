/*
A module to create the shell of a Canon NB1L battery as used by the Digital Ixus.
Jenny List 2023
CC-BY-SA 4.0

This just creates a 3D printable shell for the battery, ready for springy contacts. 
I'm using it with an external power supply, maybe you could find a Li-Po cell with on-board protection and temp sensor to fit.
Do *NOT* use a cell without a protection board!

**Requirements**
This module needs my project box library to run.
This can be found at https://github.com/JennyList/Jennys-rectangular-project-box

You'll find two parts, the box and the lid. 
You'll need four small self-tapping screws to assemble it.

*/

// Edit this path to point wherever your copy of the project box library is.
include <../jennys-rectangular-project-box.scad>

//Makes a Canon NB1L battery case
module NB1L(){
    union(){
        difference(){
            union(){
                projectBox(50,32,9.25,2,1,1.25); //battery case
                translate([1,1,1]) cube([30,30,1]); //base of contact area
            }
            translate([0,2,0]) cube([29,28,1]); // cut-out for contact area
            //Contact strip recesses
            translate([0,4.5,0]) cube([5,4,1.5]); //-ve contact
            translate([0,14,0]) cube([5,4,1.5]); //temp contact
            translate([0,23.5,0]) cube([5,4,1.5]); //+ve contact
            //Rear contact strip slots
            translate([4.5,4.5,0]) cube([0.5,4,2.5]); //-ve contact
            translate([4.5,14,0]) cube([0.5,4,2.5]); //temp contact
            translate([4.5,23.5,0]) cube([0.5,4,2.5]); //+ve contact
            //Front contact strip slots
            translate([0,4.5,0]) cube([1,4,2.5]); //-ve contact
            translate([0,14,0]) cube([1,4,2.5]); //temp contact
            translate([0,23.5,0]) cube([1,4,2.5]); //+ve contact
            // Text labels for contacts
            translate([6,7,0]) linear_extrude(1.5) text("_", size = 3); //-ve label
            translate([6,14.5,0]) linear_extrude(1.5) text("T", size = 3); //T abel
            translate([6,24,0]) linear_extrude(1.5) text("+", size = 3); //+ve label
            //Hole for power cable
            translate([45,16,5]) rotate([0,90,0]) cylinder(10,2,2,$fn=30);
        }
        translate([16,9,0]) cube([14,14,1]); //middle notch to locate with camera
    }
    translate([0,40,0]) projectBoxLid(50,32.25,2,1,1.25);
}

NB1L();
