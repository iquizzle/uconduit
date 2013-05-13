/*
*   CAD file for various clamps that can be used to clamp things to the conduit.
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

//// Select mounting clamp type ////
// choose 0 for M4 screw mounts
// choose 1 for mounting 00str00der
// choose 2 for zip tie mounts

type = 1;

////////////////////////////////////////////

if (type == 0){
 mid_mount();
}
else if (type == 1){
 lower_mount();
}
else{
 cable_mount2();
}


module cable_mount2(){
 difference(){
  union(){
   cylinder(r=tubeOD/2+3,h=10);
   translate([0,5/2,10/2]) cube([9,50,10],center=true);
   translate([18/2,0,10/2]) cube([20,12,10],center=true);
  }

  translate([0,0,-0.5]) cylinder(r=tubeOD/2,h=21);

  translate([-10,-18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=40);
  translate([-10,18+5,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
  translate([16,0,10/2]) cube([1.75,4,20],center=true);
  cube([1,100,100],center=true);
 }
}


module cable_mount(){
 difference(){
  union(){
   cylinder(r=tubeOD/2+3,h=10);
   translate([0,0,10/2]) cube([9,45,10],center=true);
   translate([18/2,0,10/2]) cube([20,12,10],center=true);
  }

  translate([0,0,-0.5]) cylinder(r=tubeOD/2,h=21);

  translate([-10,-18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=40);
  translate([-10,18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
  translate([16,0,10/2]) cube([1.75,4,20],center=true);
  cube([1,100,100],center=true);
 }
}

module lower_mount(){
 difference(){
  union(){
   cylinder(r=tubeOD/2+3,h=20);
   translate([0,0,20/2]) cube([9,45,20],center=true);
   translate([14/2,-tubeOD/2,20/2]) cube([14,22,20],center=true);
  }

  translate([0,0,-0.5]) cylinder(r=tubeOD/2,h=21);

  translate([-10,-18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=40);
  translate([-10,-18,20/2+5]) rotate([0,90,0]) cylinder(r=2.1,h=40);
  translate([-10,18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
  translate([-10,18,20/2+5]) rotate([0,90,0]) cylinder(r=2.1,h=20);

  cube([1,100,100],center=true);
 }
}

module mid_mount(){
 difference(){
  union(){
   hull(){
    cylinder(r=tubeOD/2+3,h=20);
    translate([tubeOD/2+3+2,0,20/2]) cube([4,8,20],center=true);
   }
   translate([0,0,20/2]) cube([9,45,20],center=true);
  }

  translate([0,0,-0.5]) cylinder(r=tubeOD/2,h=21);
  translate([0,0,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
  translate([0,0,20/2+5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
  translate([14,0,20/2+5]) rotate([0,90,0]) boltHole(4,20,tolerance=0.2);
  translate([15.5,0,20/2+5]) rotate([0,90,0]) boltHole(4,20,tolerance=0.2);
  translate([14,0,20/2-5]) rotate([0,90,0]) boltHole(4,20,tolerance=0.2);
  translate([15.5,0,20/2-5]) rotate([0,90,0]) boltHole(4,20,tolerance=0.2);

  translate([-10,-18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
  translate([-10,-18,20/2+5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
  translate([-10,18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
  translate([-10,18,20/2+5]) rotate([0,90,0]) cylinder(r=2.1,h=20);

  cube([1,100,100],center=true);

 }
}