/*
*   CAD file for the UConduit compression flanges. Top flanges (qty 4) are 16mm, 
*    bottom (qty 8) are 12mm
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


////// 16mm compression flanges for the top (4 required)  //////
translate([-38/2,38/2,0]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,16,12);
translate([-38/2,-38/2,0]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,16,12);
translate([38/2,38/2,0]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,16,12);
translate([38/2,-38/2,0]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,16,12);

////// 12mm compression flanges for the top (8 required)  //////
translate([38/2,38*3/2,-2]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,12,12);
translate([-38/2,38*3/2,-2]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,12,12);
translate([38*3/2,38/2,-2]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,12,12);
translate([38*3/2,-38/2,-2]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,12,12);
translate([38*3/2,38*3/2,-2]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,12,12);
translate([38/2,38*5/2,-2]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,12,12);
translate([-38/2,38*5/2,-2]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,12,12);
translate([38*3/2,38*5/2,-2]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,12,12);