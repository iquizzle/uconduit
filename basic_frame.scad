include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

//PLEASE NOTE! This file is for demonstration purposes only. It is not dimensionally exact. Final dimensions will depend on actual designed parts.

//bottom square
translate([-125,125,40]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([-125,-125,40]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([125,125,40]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([-125,125,40]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,250);

//top square
translate([-125,125,250]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([-125,-125,250]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([125,125,250]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([-125,125,250]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,250);

//vertical conduit
translate([-125,125,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([-125,-125,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([125,125,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,250);
translate([125,-125,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,250);

//vertical 8mm rods & leadscrews
translate([-105,105,0]) rotate([0,0,0]) tube(0,0,0,8,0,250);
translate([-100,-100,0]) rotate([0,0,0]) tube(0,0,0,8,0,250);
translate([100,100,0]) rotate([0,0,0]) tube(0,0,0,8,0,250);
translate([105,-105,0]) rotate([0,0,0]) tube(0,0,0,8,0,250);

// heat bed
translate([0,0,190]) square(8*25.4,center=true);

//lower motors
translate([-100,-100,40]) stepper_motor_mount(17);
translate([100,100,40]) stepper_motor_mount(17);

//upper motors
translate([120,-120,270]) rotate([0,-90,0]) stepper_motor_mount(17);
translate([-120,120,270]) rotate([0,90,0]) stepper_motor_mount(17);

//upper linear rods
translate([-105,105,250]) rotate([0,90,0]) tube(0,0,0,8,0,200);
translate([-105,-105,250]) rotate([0,90,0]) tube(0,0,0,8,0,200);
translate([105,105,250]) rotate([90,0,0]) tube(0,0,0,8,0,200);
translate([-105,105,250]) rotate([90,0,0]) tube(0,0,0,8,0,200);

//extruder guide rods
translate([-100,-25,250]) rotate([0,90,0]) tube(0,0,0,8,0,200);
translate([-25,100,250]) rotate([90,0,0]) tube(0,0,0,8,0,200);

//extruder head
translate([-25,-25,235]) rotate([0,0,0]) cylinder(h=40,r=9,center=true);
translate([-25,-25,214]) rotate([0,0,0]) cylinder(h=10,r1=2,r2=9,center=true);