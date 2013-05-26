/*
*   CAD file for the UConduit belt clips. These are used to attach the belt to the carriage.
*
*  Creative Commons Share Alike 3.0
*  Copyright (c) 2013 David Lee Miller
* 
*/
include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

belt_thickness = 1.25;
screw_sep = 20;
beltW=6;

difference(){
 cube([6.5,30,8],center=true);  // main block
 translate([0,30/2+screw_sep/2-2-beltW-4,0]) cube([belt_thickness,30,8+1],center=true); // belt cutout
 translate([0,-screw_sep/2,0]) rotate([0,90,0]) cylinder(r=2+0.05,h=10,center=true); // screw holes
 translate([0,screw_sep/2,0]) rotate([0,90,0]) cylinder(r=2+0.05,h=10,center=true);
}