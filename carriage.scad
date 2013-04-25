/*
*   CAD file for the UConduit carriage. The carriage holds the hotend, belt clips and bowden tube.
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

ycarriage();


module ycarriage(option=1){
 difference(){
  cross_section();
  //middle M4 screw holes
  translate([0,0,3.5]) rotate([0,90,0]) cylinder(r=2+0.05,h=30,center=true);
  translate([0,0,bushingL-3.5]) rotate([0,90,0]) cylinder(r=2+0.05,h=30,center=true);
  translate([9.5,0,bushingL-3.5]) rotate([0,-90,0]) nutSlot(10,0.1);
  translate([9.5,0,3.5]) rotate([180,0,0]) rotate([0,-90,0]) nutSlot(10,0.1);
  //bottom M4 screw holes
  translate([0,bushingOD/2+rod_spacing/2+3,3.5]) rotate([0,90,0]) 
   cylinder(r=2+0.05,h=30,center=true);
  translate([0,bushingOD/2+rod_spacing/2+3,bushingL-3.5]) rotate([0,90,0]) 
   cylinder(r=2+0.05,h=30,center=true);
  translate([10,bushingOD/2+rod_spacing/2+3,bushingL-3.5]) rotate([0,-90,0]) nutSlot(10,0.1);
  translate([10,bushingOD/2+rod_spacing/2+3,3.5]) rotate([180,0,0]) rotate([0,-90,0]) nutSlot(10,0.1);
  //top M3 screw holes
  translate([8,-bushingOD/2-rod_spacing/2-3,3.5]) rotate([90,0,0]) 
   cylinder(r=3/2+0.05,h=12,center=true);
  translate([8,-bushingOD/2-rod_spacing/2-3,bushingL-3.5]) rotate([90,0,0]) 
   cylinder(r=3/2+0.05,h=12,center=true);
  translate([8,-bushingOD/2-rod_spacing/2-2,bushingL-3.5]) rotate([0,0,90]) rotate([0,-90,0]) 
   nutSlot(10,0.1,size=3);
  translate([8,-bushingOD/2-rod_spacing/2-2,3.5]) rotate([0,180,0]) rotate([0,0,90]) rotate([0,-90,0]) 
   nutSlot(10,0.1,size=3);
  // make holes for bearing
  rotate([0,0,90]) translate([rod_spacing/2,0,bushingL/2]) 
   cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
  rotate([0,0,90]) translate([-rod_spacing/2,0,bushingL/2]) 
   cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
}}



module cross_section(){ // creates the basic shape of the carriage
 difference(){
   union(){
   linear_extrude(height=bushingL)
    minkowski(){
     union(){
      // two bearings
      translate([0,rod_spacing/2,0]) circle(r=bushingOD/2,center=true);
      translate([0,-rod_spacing/2,0]) circle(r=bushingOD/2,center=true);
      // connect them
      translate([bushingOD/4+2.0,0,0]) square([bushingOD/2+2.0,rod_spacing+bushingOD],center=true);
      // add top and bottom blocks
      translate([4,-bushingOD-8/2,0]) square([bushingOD-2,8],center=true);
      translate([4,bushingOD+9/2,0]) square([bushingOD-2,9],center=true);
     }
    circle(r=3);} // 3mm wall thickness
   translate([0,0,bushingL/2]) cube([14,10,bushingL],center=true); // add a flat between the bearings
  }}
}
