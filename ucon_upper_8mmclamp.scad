include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

module rtriangle(side,thickness){
difference(){
cube([side,side,thickness],center=true);
translate(sqrt(2)*side/4*[1,-1,0]) rotate([0,0,45]) cube([4*side,side,thickness+0.2],center=true);
}}


difference(){

translate([42.3/2,42.3/2,0])
difference(){
cube([42.35,42.35,12],center=true);

rotate([0,0,45]) translate([-5.75,-5.75,0]) cylinder(h=100,r=2.1,center=true);
rotate([0,0,-45]) translate([-5.75,-5.75,0]) cylinder(h=100,r=2.1,center=true);



translate([13.2,13.2,0]) rotate([0,0,45]) cube([37.05,87.05,55.2],center=true);
translate([-8,-8,0]) rotate([0,0,90]) rtriangle(27,55.2);
translate([0.14,0.14,0]) cylinder(h=100,r=4,center=true);

}

translate([6,6,0]) rotate([90,0,0]) cylinder(h=100,r=4,center=true);
translate([6,6,0]) rotate([0,90,0]) cylinder(h=100,r=4,center=true);

translate([21,21,0]) cube([30,30,1],center=true);
translate([15,15,-6]) rotate([0,0,45]) rotate([90,0,0]) cube([12,12,2],center=true);
}