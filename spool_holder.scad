/*
*   CAD file for the UConduit spool holder.
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

height = 35;

difference(){
union(){
cylinder(r=tubeOD/2+3,h=height);
translate([-tubeOD/2-10,-6/2,0]) cube([tubeOD+20,6,height]);
translate([-5+tubeOD/3,tubeOD/3,0]) cube([8,tubeOD+3.5,height-8]);
translate([-3-tubeOD/3,tubeOD/3,0]) cube([8,tubeOD+3.5,height-8]);
translate([-tubeOD/3-3,tubeOD/2+12,height/2]) rotate([0,90,0]) cylinder(r=tubeOD/2+3,h=2*tubeOD/3+6);}

translate([-tubeOD/2-11,-1/2,-0.1]) cube([tubeOD+22,1,height+0.2]);
translate([-tubeOD/3-4,tubeOD/2+12,height/2]) rotate([0,90,0]) cylinder(r=tubeOD/2,h=2*tubeOD/3+8);
translate([0,0,-0.5]) cylinder(r=tubeOD/2,h=height+1);
translate([tubeOD/2+6,15/2,6]) rotate([90,0,0]) cylinder(r=4/2+0.1,h=15);
translate([-tubeOD/2-6,15/2,6]) rotate([90,0,0]) cylinder(r=4/2+0.1,h=15);
translate([tubeOD/2+6,15/2,height-6]) rotate([90,0,0]) cylinder(r=4/2+0.1,h=15);
translate([-tubeOD/2-6,15/2,height-6]) rotate([90,0,0]) cylinder(r=4/2+0.1,h=15);
translate([tubeOD/2+6,15/2,height/2]) rotate([90,0,0]) cylinder(r=4/2+0.1,h=15);
translate([-tubeOD/2-6,15/2,height/2]) rotate([90,0,0]) cylinder(r=4/2+0.1,h=15);}
