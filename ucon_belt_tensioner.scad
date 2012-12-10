include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

$fn=100;


module rtriangle(side,thickness){
difference(){
cube([side,side,thickness],center=true);
translate(sqrt(2)*side/4*[1,-1,0]) rotate([0,0,45]) cube([4*side,side,thickness+0.2],center=true);
}}

translate([0,10.25,0])
difference(){
cube([10.1,20.5,10],center=true);
translate([0,5,-8]) boltHole(4,units="MM",length=30,tolerance=0.5);
translate([0,-5,-8]) boltHole(4,units="MM",length=30,tolerance=0.5);
}

translate([10.29,-21.1,0]) rotate([0,0,180])
difference(){
cube([42.35,42.35,10],center=true);
translate([10.7,9.0,0]) rotate([0,0,45]) cube([36.05,88.05,50],center=true);
translate([-8,-8,0]) rotate([0,0,90]) rtriangle(26.5,50);
}
//translate([10.29,-21,0]) rotate([0,0,180]) translate([10.7,9.7,0]) rotate([0,0,45]) cube([37.05,87.05,50],center=true);
