include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


difference(){
union(){
linear_extrude(height=15)
difference(){
hull(){
square(35-0.01,center=true);
translate([35/2,35/2,0]) rotate(-45) square([10,30],center=true);}
square(35,center=true);}

translate([0,0,15/2]) quadflatFlange1(0,0,0,35.01,35.01,15,35/2);}

translate([22,22,0]) cylinder(r=4,h=100,center=true);}

//translate([22,22,0]) cylinder(r=15/2,h=100,center=true);