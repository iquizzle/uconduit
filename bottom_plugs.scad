/*
*   CAD file for the UConduit bottom plugs / cable guides.
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

plugOD = 30;
plugID = 11;
height = 10;
clipheight = 12;


//annulus();
//translate([0,0,-10]) cube([0.75,20,20]);
//translate([0,0,clipheight/2+2]) clips();

difference(){
union(){
cylinder(r=plugOD/2,h=height);
translate([plugOD/2-2,-3,0]) cube([8,6,height]);}
difference(){
translate([0,0,height-2]) cylinder(r=tubeOD/2+0.1,h=height,center=true);
translate([0,0,height-2]) cylinder(r=tubeID/2,h=height,center=true);

}
translate([0,plugOD/2,0]) rotate([90,0,0]) cylinder(r=plugID/2,h=plugOD,center=true);
translate([0,-1/2,-height/2-1]) cube([30,1,2*height+2]);
translate([0,0,height/2]) cylinder(r=plugID/2,h=height+0.2,center=true);
translate([plugOD/2+2,0,height/2]) rotate([90,0,0]) cylinder(r=3/2+0.1,h=plugOD,center=true);
}




module annulus(){

difference(){
cylinder(r=plugOD/2,h=height,center=true);

difference(){
translate([0,0,height-2]) cylinder(r=25/2,h=height,center=true);
translate([0,0,height-2]) cylinder(r=21/2,h=height,center=true);
}
cylinder(r=plugID/2,h=height+0.1,center=true);
translate([0,plugOD/2,-height/2-2]) rotate([90,0,0]) cylinder(r=plugID/2,h=plugOD,center=true);
}}


module clips(){
difference(){
union(){
cylinder(r=21/2,h=clipheight,center=true);
translate([0,0,clipheight/2-2]) cylinder(r1=22/2,r2=21/2,h=2);
translate([0,0,clipheight/2-4]) cylinder(r1=21/2,r2=22/2,h=2);
}
cylinder(r=15/2,h=clipheight+1, center=true);
cube([4,30,30],center=true);
cube([30,4,30],center=true);
}}


