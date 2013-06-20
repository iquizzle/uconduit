/*
*   CAD file for some endstop mounts. The "T" shaped endstop holder mounts to the top of the
*  carriage. The other mounts clip onto 8mm linear rods. 
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

// endstop mounting parameters
mounting_sep = bushingL-7;
switch_sep = 9.5;


// set type to 1 if carriage endstop mount, 2 if 8mm rod mount
type = 2;

if(type == 1) carriage_endstop();
else rotate([0,90,0]) outer_endstop();

module outer_endstop(){
 difference(){
  translate([0,0,2]) cube([8,14,18],center=true); // main block
  translate([0,0,-7]) cube([9,6,14],center=true); // make an opening for the 8mm rod
  translate([0,0,1.5]) rotate([0,90,0]) cylinder(r=4,h=15,center=true); // circular opening
  translate([0,switch_sep/2,13]) cylinder(r=2/2-0.05,h=20,center=true);  // screw hole mounts
  translate([0,-switch_sep/2,13]) cylinder(r=2/2-0.05,h=20,center=true);
  translate([0,0,-4.25]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=20,center=true); // clip tension screw
}}

module carriage_endstop(){
 difference(){
  union(){ // T shaped block
   translate([0,2,0]) cube([8,20,4],center=true);
   translate([0,8+9-0.1,0]) cube([20,10,4],center=true);}
  // M3 screw mounts for carriage
  translate([0,mounting_sep/2,0]) cylinder(r=3/2+0.05,h=10,center=true);
  translate([0,-mounting_sep/2,0]) cylinder(r=3/2+0.05,h=10,center=true);
  // M2 screw mounts for endstop
  translate([switch_sep/2,8+9-0.1,0]) cylinder(r=2/2+0.05,h=10,center=true);
  translate([-switch_sep/2,8+9-0.1,0]) cylinder(r=2/2+0.05,h=10,center=true);
}}

