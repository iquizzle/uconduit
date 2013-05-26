/*
*   CAD file for the UConduit vertexes. 4 top and 4 bottom sets required.
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

//////// Select Vertex Style ////////

top = true;    // Set to true if printing top vertex pair

//////////////////////////////////////


rotate([180,0,0]) halfvertex(top=false);
translate([52,-38,0]) rotate([0,180,0]) halfvertex(top=top);


module halfvertex(top=false){
 union(){
  difference(){
   union(){
    translate([35/2+15/2,0,0]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35+0.01,35+0.01,15,10);
    rotate([0,0,90]) translate([35/2+15/2,0,0]) rotate([0,90,0]) 
     quadflat1CapNut(0,0,0,35+0.01,35+0.01,15,10);
   }
   translate([0,0,-50]) cube([100,100,100],center=true);
  }
  translate([0,0,35/4]) rotate([0,180,0]) quadflatFlange1(0,0,0,35+0.01,35+0.01,35/2,closed=top);
 }
}

