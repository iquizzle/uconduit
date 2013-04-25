/*
*   CAD file for the UConduit jhead mount. Mounts to carriage. Uses a 3mm X 1/8" NPT quick connect
*   adapter for bowden tube connection.
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

// jhead mount parameters
base_h = 7;
pushfit_dia = 0.35*25.4;



difference(){
 union(){
  translate([-bushingL/2,-32/2-2,0]) cube([bushingL,32,3]);  //base
  translate([-bushingL/2-3,-3-16.5,0]) cube([bushingL+6,23,(5/8)*25.4+base_h]);  //groove mount
  translate([0,-4.5/2+1.5,base_h+(5/16)*25.4+6+3/2+0.25]) rotate([0,-90,0]) 
   cylinder(r=8/2+0.05,h=bushingL+6,center=true); // add material for top M3 screw to hold jhead
  translate([0,-22.5,4]) cube([bushingL+6,8,8],center=true); // top cube for belt clip mounts
 }
 // M4 screws for belt clip mounts
 translate([0,-2.5,4]) rotate([0,90,0]) cylinder(r=2+0.05,h=100,center=true);
 translate([0,-22.5,4]) rotate([0,90,0]) cylinder(r=2+0.05,h=100,center=true);

 //middle M4 screw holes
 translate([-bushingL/2+3.5,8,0]) rotate([0,0,0]) cylinder(r=2+0.05,h=30,center=true);
 translate([bushingL/2-3.5,8,0]) rotate([0,0,0]) cylinder(r=2+0.05,h=30,center=true);

 //bottom M4 slotted screw holes
 translate([-bushingL/2+3.5,8-screw_sep,14]) rotate([0,0,0]) cylinder(r=3.75/2+0.05,h=30,center=true);
 for ( pp = [0 : 0.25 : 8] ){
  translate([-bushingL/2+3.5-pp,8-screw_sep,5.5]) rotate([0,180,0]) boltHole(4,length=10,tolerance=0.1);
  translate([-bushingL/2+3.5-pp,8-screw_sep,4]) rotate([0,180,0]) boltHole(4,length=10,tolerance=0.1);}

 translate([bushingL/2-3.5,8-screw_sep,14]) rotate([0,0,0]) cylinder(r=3.75/2+0.05,h=30,center=true);
 for ( pp = [0 : 0.25 : 8] ){
  translate([bushingL/2-3.5+pp,8-screw_sep,5.5]) rotate([0,180,0]) boltHole(4,length=10,tolerance=0.1);
  translate([bushingL/2-3.5+pp,8-screw_sep,4]) rotate([0,180,0]) boltHole(4,length=10,tolerance=0.1);}

 //jhead mounting groove
 for ( i = [0 : 0.4 : 10] ){
  if (i==0){
   translate([0,1.5,base_h+(5/16)*25.4+0.5+i]) rotate([90,0,0]) hotend(pfit=1);}
  else{
  translate([0,1.5,base_h+(5/16)*25.4+0.5+i]) rotate([90,0,0]) hotend(pfit=0);}
}
 // M3 screw hole to hold jhead
 translate([0,-4.5/2+1.5,base_h+(5/16)*25.4+6+3/2+0.25]) rotate([0,-90,0]) 
  cylinder(r=3/2+0.05,h=50,center=true);
}


module hotend(tol=0.1,pfit=0){ // makes a jhead model for subtraction to make groove mount
 union(){
  translate([0,0,4.5-0.01]) cylinder(r=5/16*25.4+0.05,h=5.5); // top cylinder of jhead
  translate([0,5/16*25.4/2,7.75-0.01]) cube([3,5/16*25.4,6.5],center=true); // slot for 1.75 tube
  translate([0,0,0]) cylinder(r=12/2+0.025,h=4.64); // jhead groove head mount
  translate([0,0,-10+0.01]) cylinder(r=5/16*25.4+0.05,h=10); // main body of jhead
 if (pfit == 1){
  cylinder(r=pushfit_dia/2+tol,h=100);}
}}

