include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


difference(){

union(){
hull(){
cylinder(r=tubeOD/2+3,h=20);
translate([tubeOD/2+3+2,0,20/2]) cube([4,8,20],center=true);}
translate([0,0,20/2]) cube([9,45,20],center=true);
}

translate([0,0,-0.5]) cylinder(r=tubeOD/2,h=21);
translate([0,0,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
translate([0,0,20/2+5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
translate([14,0,20/2+5]) rotate([0,90,0]) boltHole(4,20,tolerance=0.2);
translate([15.5,0,20/2+5]) rotate([0,90,0]) boltHole(4,20,tolerance=0.2);
translate([14,0,20/2-5]) rotate([0,90,0]) boltHole(4,20,tolerance=0.2);
translate([15.5,0,20/2-5]) rotate([0,90,0]) boltHole(4,20,tolerance=0.2);

translate([-10,-18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
translate([-10,-18,20/2+5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
translate([-10,18,20/2-5]) rotate([0,90,0]) cylinder(r=2.1,h=20);
translate([-10,18,20/2+5]) rotate([0,90,0]) cylinder(r=2.1,h=20);

cube([1,100,100],center=true);

}