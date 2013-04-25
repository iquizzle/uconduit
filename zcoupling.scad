/*
*   CAD file for the UConduit leadscrew/motor coupling assembly. Uses 3/8"-12 ACME leadscrews.
*
*  Creative Commons Share Alike 3.0
*  Copyright (c) 2013 David Lee Miller
* 
*/
use <MCAD/nuts_and_bolts.scad>;

$fn = 100;

smallOD = 5.2;          // motor shaft diameter
smallH = 20-2;          // length of motor clamp
largeOD = 3/8*25.4; // leadscrew diameter
largeH = 15-2;          // length of leadscrew clamp
wall = 4;                  // wall thickness


translate([25,0,0]) zcoup();
zcoup();

module zcoup(screwtol=0.05){
 difference(){
  linear_extrude(height=6.5)
  difference(){
   minkowski(){
    union(){
     translate([-smallOD/2,largeH-0.01,0]) square([smallOD,smallH]);
     translate([-largeOD/2,0,0]) square([largeOD,largeH]);
     translate([-smallOD/2-3/2-0.5,largeH+3*smallH/4,0]) circle(r=3/2+0.55);
     translate([smallOD/2+3/2+0.5,largeH+3*smallH/4,0]) circle(r=3/2+0.55);
     translate([-largeOD/2-3/2-0.5,largeH/4,0]) circle(r=3/2+0.55);
     translate([largeOD/2+3/2+0.5,largeH/4,0]) circle(r=3/2+0.55);
     }
    circle(r=2);}
    translate([-smallOD/2-3/2-0.5,largeH+3*smallH/4,0]) circle(r=3/2+screwtol);
    translate([smallOD/2+3/2+0.5,largeH+3*smallH/4,0]) circle(r=3/2+screwtol);
    translate([-largeOD/2-3/2-0.5,largeH/4,0]) circle(r=3/2+screwtol);
    translate([largeOD/2+3/2+0.5,largeH/4,0]) circle(r=3/2+screwtol);}
    translate([0,largeH+smallH/2+2,6.5+0.5]) rotate([-90,0,0]) cylinder(r=smallOD/2,h=smallH,center=true);
    translate([0,largeH/2-2,6.5+0.5]) rotate([-90,0,0]) cylinder(r=largeOD/2,h=smallH,center=true);
}}
