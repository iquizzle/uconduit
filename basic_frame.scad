include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

//PLEASE NOTE! This file is for demonstration purposes only. It is not dimensionally exact. Final dimensions will depend on actual designed parts.

//bottom square
color("navy",0.9) translate([-125,125,40]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([-125,-125,40]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([125,125,40]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([-125,125,40]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,250);

//top square
color("navy",0.9) translate([-125,125,250]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([-125,-125,250]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([125,125,250]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([-125,125,250]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,250);

//vertical conduit
color("navy",0.9) translate([-125,125,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([-125,-125,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([125,125,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,250);
color("navy",0.9) translate([125,-125,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,250);

//vertical 8mm rods & leadscrews
color("silver",0.8) translate([-105,105,0]) rotate([0,0,0]) tube(0,0,0,8,0,250);
color("darkslategray",0.8) translate([-100,-100,0]) rotate([0,0,0]) tube(0,0,0,8,0,250);
color("darkslategray",0.8) translate([100,100,0]) rotate([0,0,0]) tube(0,0,0,8,0,250);
color("silver",0.8) translate([105,-105,0]) rotate([0,0,0]) tube(0,0,0,8,0,250);

// heat bed
color("darkred",0.9) translate([0,0,190]) square(8*25.4,center=true);

//lower motors
translate([-100,-100,40]) stepper_motor_mount(17);
translate([100,100,40]) stepper_motor_mount(17);

//upper motors
translate([120,-120,270]) rotate([-90,0,0]) stepper_motor_mount(17);
translate([-120,120,270]) rotate([0,90,0]) stepper_motor_mount(17);

//upper linear rods
color("silver",0.8) translate([-105,105,250]) rotate([0,90,0]) tube(0,0,0,8,0,200);
color("silver",0.8) translate([-105,-105,250]) rotate([0,90,0]) tube(0,0,0,8,0,200);
color("silver",0.8) translate([105,105,250]) rotate([90,0,0]) tube(0,0,0,8,0,200);
color("silver",0.8) translate([-105,105,250]) rotate([90,0,0]) tube(0,0,0,8,0,200);

//extruder guide rods
color("silver",0.8) translate([-100,-25,250]) rotate([0,90,0]) tube(0,0,0,8,0,200);
color("silver",0.8) translate([-25,100,250]) rotate([90,0,0]) tube(0,0,0,8,0,200);

//extruder head
color("black",0.8) translate([-25,-25,235]) rotate([0,0,0]) cylinder(h=40,r=9,center=true);
color("darkgoldenrod",0.8) translate([-25,-25,214]) rotate([0,0,0]) cylinder(h=10,r1=2,r2=9,center=true);