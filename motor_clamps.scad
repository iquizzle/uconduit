/*
*   CAD file for the UConduit motor clamp mounts.
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

rotate([-90,0,0]) motor_clamps();
translate([-28,-28,0]) rotate([-90,0,0]) motor_clamps();



module motor_clamps(){
 difference(){
  union(){
   translate([35/2+42/2,35/2-5/2,35+42/2])
   rotate([90,0,0])
   difference(){
    cube([42,42,5],center=true);
    slot_motor_mount();
   }

   translate([35/2+15+15/2+2.75,35/2-35/2,35/2]) rotate([0,180,0]) 
    rotate([0,90,0]) quadflatFlange1(0,0,0,35.01,35,20,10);
   translate([0,0,35/2+40+2.75]) rotate([180,0,0]) quadflatFlange1(0,0,0,35.01,35,20,10);
  }
  translate([35/2+15-0.25,15,35+15/2]) cube([1.01,30,15.1],center=true);
  translate([35/2-30/2+42,15,35-30/2+42]) cube([30.1,30,30.1],center=true);
  translate([35/2,15,35]) rotate([0,180,0]) rotate([90,0,0]) fillet(4,30);
 }
}

module slot_motor_mount(){
 translate([15.5,15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
 translate([-15.5,-15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
 translate([15.5,-15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
 translate([-15.5,15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
 for (i=[-1:0.5:1]){
	translate([i,i,-0.1]) cylinder(h=25,r=14,center=true);
 }
}


module slot_head(rad,height,slot){
 union(){
  for (i=[-slot/2:0.5:slot/2]){
	translate([0,i,-0.1]) cylinder(h=height,r=rad,center=true);
  }
 }
}