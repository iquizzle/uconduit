include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/nuts_and_bolts.scad>

$fn = 100;

smallOD = 5.4;
smallH = 20;
largeOD = 3/8*25.4;
largeH = 15;
wall = 4;
//translate([25,0,0]) zcoup(1);
zcoupS();
translate([28,0,0]) zcoupS();
translate([14,32,0]) rotate([0,0,180]) zcoupL();
translate([-14,32,0]) rotate([0,0,180]) zcoupL();

module zcoupL(){
rotate([-90,0,0])
difference(){
union(){
translate([-10,-7,0]) cube([20,14,15]);
translate([-2,-7,15]) cube([4,14,11]);
translate([-4.35,4.63,largeH+2.5-0.15]) rotate([0,90,0]) rotate([90,0,0]) fillet(2.5,4.75);
translate([4.35,4.63,largeH+2.5-0.15]) rotate([0,180,0]) rotate([90,0,0]) fillet(2.5,4.75);}
translate([0,0,largeH+largeOD/2+1]) sphere(r=largeOD/2);
translate([-10,-2.25,largeH+0.002]) cube([20,4.5,11]);
translate([0,0,-0.01]) cylinder(r=largeOD/2,h=largeH-1);
translate([largeOD/2+3/2+0.5,0,largeH/2]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=100,center=true);
translate([-(largeOD/2+3/2+0.5),0,largeH/2]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=100,center=true);
translate([0,-25+0.5,25-0.01]) cube(50,center=true);
}}

module zcoupS(){
rotate([-90,0,0])
difference(){
union(){
translate([-8,-7,0]) cube([16,14,15]);
translate([-2,-7,15]) cube([4,14,11]);
translate([-4.35,4.63,largeH+2.5-0.15]) rotate([0,90,0]) rotate([90,0,0]) fillet(2.5,4.75);
translate([4.35,4.63,largeH+2.5-0.15]) rotate([0,180,0]) rotate([90,0,0]) fillet(2.5,4.75);}
translate([0,0,largeH+largeOD/2+1]) sphere(r=largeOD/2);
translate([-10,-2.25,largeH+0.002]) cube([20,4.5,11]);
translate([0,0,-0.01]) cylinder(r=smallOD/2,h=largeH-1);
translate([smallOD/2+3/2+0.5,0,largeH/2]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=100,center=true);
translate([-(smallOD/2+3/2+0.5),0,largeH/2]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=100,center=true);
translate([0,-25+0.5,25-0.01]) cube(50,center=true);
}}