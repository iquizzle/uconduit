/*
*   CAD file for the UConduit xends. 4 parts per xends, 4 624 bearings and 2 lm8uu's used.
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


xoffset=10;
bearing624OD = 13;

translate([22,-16,-6]) xendA();
translate([-22,-16,-6]) xendA();
xendB();


module xendA(mode=1){
 difference(){
  cross_sectionA();
  rotate([0,0,90]) rodsnbushings(mode=mode);
 }
}

module cross_sectionA(){
 difference(){
  linear_extrude(height=bushingL)
  minkowski(){
   translate([0,14.5,0]) square([13,23],center=true);
   circle(r=3.05);
  }
  translate([-16/4-1,24/2+16/2+4,-0.1]) cylinder(r=2+0.05,h=bushingL+1,center=false);
  translate([16/4+1,24/2+16/2+4,-0.1]) cylinder(r=2+0.05,h=bushingL+1,center=false);
  translate([-10,20,bushingL/2+4]) cube([20,20,bushingL]);
 }
}

module xendB(){
 difference(){
  rotate([0,90,0])
  union(){
   translate([0,0,11/2-0.001]) xendB_profile();
   translate([0,0,-11/2]) rotate([0,180,0]) scale([-1,1,1]) xendB_profile();
  }
  bearing_clear();

  //subtract the rod clamping pieces
  translate([0,20,0]) cube([0.5,100,30],center=true);
  translate([-8,25,6]) rotate([0,90,0]) boltHole(4,length=30,tolerance=0.1);
  translate([-7,25,6]) rotate([0,90,0]) boltHole(4,length=30,tolerance=0.1);
  translate([-8,25,6]) rotate([0,90,0]) cylinder(r=2+0.05,h=30);
  translate([-7,42,4.5]) rotate([0,90,0]) boltHole(4,length=30,tolerance=0.1);
  translate([-8,42,4.5]) rotate([0,90,0]) boltHole(4,length=30,tolerance=0.1);
  translate([-8,42,4.5]) rotate([0,90,0]) cylinder(r=2+0.05,h=30);
  translate([7,25,6]) rotate([0,-90,0]) nutSlot(10,0.1);
 }
}


module bearing_clear(){
 union(){
  union(){
   translate([-5.5,-2,3.55+8.9]) cube([11.1,bushingOD+5.1,bushingOD+4.1],center=true);
   translate([-17.5+3.2,-2,8.55]) cube([17.5+0.01-11,bushingOD+5.1,bushingOD+13.1],center=true);
  }
  translate([0,-2,0]) rotate([0,0,180])
  union(){
   translate([-5.5,0,3.55+8.9]) cube([11.1,bushingOD+5.1,bushingOD+4.1],center=true);
   translate([-17.5+3.2,0,8.55]) cube([17.5-11,bushingOD+5.1,bushingOD+13.1],center=true);
  }
  translate([0,4,-1]) rotate([0,90,0]) cylinder(r=2.05,h=100,center=true);
  translate([0,-6,-1]) rotate([0,90,0]) cylinder(r=2.05,h=100,center=true);
 }
}

module xendB_profile(){
 difference(){
  union(){
   difference(){
    cross_sectionB(11);
    rotate([0,0,180]) translate([-6.5,-25,5.6]) rotate([90,0,0]) rotate([0,0,90]) fillet(4,12);
    translate([-xoffset-8-12/2-2,0,0]) rotate([90,0,0]) cylinder(r=2,h=20,center=true);
    translate([0,15,-11/2]) rotate([0,90,0]) cylinder(r=4+0.05,h=50,center=true);
    translate([0,35,-11/2]) rotate([0,90,0]) cylinder(r=4+0.05,h=50,center=true);
   }

   translate([0,25+2+12/2,11/2+bearing624OD/2-0.01])
   difference(){
    rotate([0,0,180]) 
    union(){
     cube([12,4,bearing624OD],center=true);
     translate([0,-2,-6.5-0.1]) rotate([0,90,0]) fillet(5,12);
    }
    translate([0,0,bearing624OD/2-4]) rotate([90,0,0]) cylinder(r=2,h=10,center=true);
   }

   translate([0,25-2-12/2,11/2+bearing624OD/2-0.01])
   difference(){
    union(){
     cube([12,4,bearing624OD],center=true);
     translate([0,-2,-6.5-0.1]) rotate([0,90,0]) fillet(5,12);
    }
    translate([0,0,bearing624OD/2-4]) rotate([90,0,0]) cylinder(r=2,h=10,center=true);
   }
  }
 }
}

module cross_sectionB(thickness,minkwid=4.5){
 translate([0,0,-thickness/4])
 minkowski(){
  linear_extrude(height=thickness/2)
  translate([-3.5,18,0]) square([10,50],center=true);
  cylinder(r=minkwid,h=thickness/2,center=true);
 }
}

module rodsnbushings(mode=1){
 translate([0,0,bushingL/2])
 translate([12-1.5,0,0]) cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
}

module fillet(rad,height){
translate([-rad,-rad,0])
difference(){
translate([0,0,-height/2]) cube([rad+0.01,rad+0.01,height]);
cylinder(h=height+1,r=rad,center=true);
}}