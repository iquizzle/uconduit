/*
*   CAD file for the UConduit z-end assembly. Uses 3/8"-12 ACME leadscrews and standard ACME nuts.
*
*  Creative Commons Share Alike 3.0
*  Copyright (c) 2013 David Lee Miller
* 
*/

include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


ACMENutOD = 20+0.1; // Measure hex nut point-to-point
ACMENutH = 9.4;
ACMEScrewOD = (3./8)*25.4;
BearingH = 15.0;
BearingOD = 15;
rod_spacing = 24;

// layout the four parts of a single z-end (two sets required)
translate([0,0,0]) rotate([0,0,45]) z_end();
translate([40,0,15.0-ACMENutH-4]) rotate([0,0,45]) z_hexclamp();
translate([-14,45,BearingH]) rotate([0,180,-90]) bearingHolder();
translate([32,18,BearingH]) rotate([0,180,-90]) bearingHolder();


module z_end(){
 difference(){
  union(){
   cross_section(ACMENutH); // main body
   translate([28,28,(ACMENutH)/2]) rotate([0,0,180]) fillet(16,ACMENutH); // smooth inside corner
  }

  // cut out the ACME nut hole
  translate([-6,-6,2]) rotate([0,0,15]) cylinder(r=ACMENutOD/2,h=ACMENutH,$fn=6);
 
  //imprint logo
  translate([7.75,7.75,3*ACMENutH/4+1.5]) rotate([0,0,-45]) 3dU(ACMENutH);
  translate([7.75,7.75,3*ACMENutH/4+1.5]) rotate([0,0,-135]) 3dU(ACMENutH);
  translate([7.75,7.75,3*ACMENutH/4+1.5]) difference(){
  cylinder(r=8,h=ACMENutH+1);
  cylinder(r=7,h=ACMENutH+1);}

  // make space for the leadscrew
  translate([-6,-6,-0.1]) rotate([0,0,15]) cylinder(r=ACMEScrewOD/2+0.5,h=ACMENutH+2);
  // make holes four M4 mounting screws
  translate([25,7,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
  translate([45,7,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
  translate([7,25,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
  translate([7,45,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
  translate([-6-9,-6+9,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
  translate([-6+9,-6-9,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
  translate([-19,-8.5,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
  translate([-8.5,-19,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);

  // bearing cutout
  translate([-6-(((35/sqrt(2)+42.3/sqrt(2))-(35/sqrt(2)+6.5))/sqrt(2)),-6-(((35/sqrt(2)+42.3/sqrt(2))-(35/sqrt(2)+6.5))/sqrt(2)),ACMENutH/2-0.1]) cylinder(r=15/2+2.5,h=ACMENutH+1,center=true);

}}

module z_hexclamp(noholes=0){
 height = 15.0-ACMENutH;
 difference(){
  
  // start from the full z-end cross section
  translate([0,0,-height+4]) cross_section(15.0-ACMENutH);


 if (noholes==0){ 
  // cut out and slightly taper ACME nut cutout
  translate([-6,-6,2.01]) rotate([0,0,15]) cylinder(r1=ACMENutOD/2-0.5,r2=ACMENutOD/2,h=2,$fn=6);

  // make a hole for the leadscrew
  translate([-6,-6,-0.1-height+4]) rotate([0,0,15]) cylinder(r=ACMEScrewOD/2+0.5,h=height+2);

  // cut out M4 holes for the clamp
  translate([-6-9,-6+9,-0.1-height+4]) cylinder(r=2+0.05,h=height+2);
  translate([-6+9,-6-9,-0.1-height+4]) cylinder(r=2+0.05,h=height+2);
  translate([-19,-8.5,-0.1-height+4]) cylinder(r=2+0.05,h=height+2);
  translate([-8.5,-19,-0.1-height+4]) cylinder(r=2+0.05,h=height+2);}

 // remove the z-end wings
 rotate([0,0,15]) translate([31,31,-0.1]) rotate([0,0,45]) cube([80,80,15],center=true);
 rotate([0,0,-15]) translate([31,31,-0.1]) rotate([0,0,45]) cube([80,80,15],center=true);

 // make space for the bearings
 translate([-6-(((35/sqrt(2)+42.3/sqrt(2))-(35/sqrt(2)+6.5))/sqrt(2)),-6-(((35/sqrt(2)+42.3/sqrt(2))-(35/sqrt(2)+6.5))/sqrt(2)),-0.1-height+4]) cylinder(r=15/2+2.5,h=height+2);

}}


module cross_section(height){

linear_extrude(height=height)
minkowski(){ // round the corners of the part
 union(){

  //make the left wing
  hull(){
   translate([-8,-8,0]) circle(r=BearingOD/2);
   translate([8,2,0]) square([1,50]);}

  //make the right wing
  hull(){
   translate([-8,-8,0]) circle(r=BearingOD/2);
   translate([2,8,0]) square([50,1]);}

 // add the "moonlander" hex top
 translate([-6,-6,0]) rotate([0,0,-15]) circle(r=16,$fn=6);

}
circle(r=4);}}

module 3dU(height){ // makes an imprint for UConduit logo
 difference(){
  cylinder(r=5,h=height);
  translate([0,0,-0.05]) cylinder(r=4,h=height+0.1);
  translate([-5.5,0,-0.05]) cube([11,11,height+0.1]);
 }
  translate([4,-0.1,0]) cube([1,6,height]);
  translate([-5,-0.1,0]) cube([1,6,height]);
}

module bearingHolder(){
 difference(){

  // make the basic cross section
  cross_sectionA();

  // make a hole for the bearing
  rotate([0,0,90]) translate([0,0,BearingH/2])
  translate([rod_spacing/2-1.5,0,0]) cylinder(r=BearingOD/2,h=BearingH+0.05,center=true);

  // make an inset for the hex clamp
  translate([0,42.15,-1]) rotate([0,0,45]) z_hexclamp(noholes=1);}
}

module cross_sectionA(){
 difference(){
  linear_extrude(height=BearingH)
  minkowski(){
   translate([0,14,0]) square([17,23],center=true);
   circle(r=3.05);}
  
  // make 2 holes for M4 mounting screws
  translate([-26/4-1,rod_spacing/2+14/2+4,-0.1]) cylinder(r=2+0.05,h=BearingH+1,center=false);
  translate([26/4+1,rod_spacing/2+14/2+4,-0.1]) cylinder(r=2+0.05,h=BearingH+1,center=false);
}}
