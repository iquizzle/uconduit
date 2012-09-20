include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

module rtriangle(side,thickness){
difference(){
cube([side,side,thickness],center=true);
translate(sqrt(2)*side/4*[1,-1,0]) rotate([0,0,45]) cube([4*side,side,thickness+0.2],center=true);
}}


union(){
translate([-35/2,42.3/2,0]) rotate([-90,90,0]) quadflat1CapNut(0,0,0,35,35,42.3,12);

translate([42.3/2,-35/2,0]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35,35,42.3,12);

translate([-35/2,-35/2,0]) rotate([0,0,90]) quadflatFlange2(0,0,0,35+0.05,35+0.05,35);

translate([42.3/2,42.3/2,35/2-7.5])
difference(){
cube([42.35,42.35,15],center=true);
translate([13.2,13.2,0]) rotate([0,0,45]) cube([37.05,87.05,15.2],center=true);
translate([-8,-8,0]) rotate([0,0,90]) rtriangle(27,55.2);
translate([0.14,0.14,0]) cylinder(h=100,r=4,center=true);
translate([13/1.414,-13/1.414,0]) rotate([0,0,45]) rotate([0,90,0]) cylinder(h=30,r=2.05,center=true);
translate([-13/1.414,13/1.414,0]) rotate([0,0,45]) rotate([0,90,0]) cylinder(h=30,r=2.05,center=true);
translate([-13/1.414,13/1.414,0]) translate([-5.7,-5.7,0]) rotate([0,0,-45]) rotate([90,0,0]) nutHole(4,tolerance=0.1);
translate([13/1.414,-13/1.414,0]) translate([-5.7,-5.7,0]) rotate([0,0,-45]) rotate([90,0,0]) nutHole(4,tolerance=0.1);
}}


//translate([42.3/2,42.3/2,35/2-2.5]) stepper_motor_mount(17);