include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

difference(){
union(){
difference(){
union(){
translate([-9.5/2,66,0]) cube([9.5,2,9.5],center=true);
translate([66,-9.5/2,0]) cube([2,9.5,9.5],center=true);
translate([0,0,-9.5/2]) cube([67,67,9.5]);}

translate([66.5,66.5,0]) rotate([0,0,45]) cube([66*sqrt(2),100,100],center=true);
translate([-7,-7,0]) rotate([0,0,45]) cube([66*sqrt(2),100,100],center=true);
}

translate([66-0.5,0.5,0]) cylinder(r=2,h=9.5,center=true);
translate([0.5,66-0.5,0]) cylinder(r=2,h=9.5,center=true);
translate([42.3/2+35/2,42.3/2+35/2,0]) cylinder(r=22.25/2+3,h=9.5,center=true);
translate([66/sqrt(2)-25,66/sqrt(2)+20,0]) rotate([0,0,270-45]) fillet(20,9.5);
translate([66/sqrt(2)+20,66/sqrt(2)-25,0]) rotate([0,0,270-135]) fillet(20,9.5);
}

translate([42.3/2+35/2,42.3/2+35/2,-1]) cylinder(r=22.25/2+0.025,h=6,center=false);
translate([42.3/2+35/2,42.3/2+35/2,0]) cylinder(r=12.25/2+0.025,h=10,center=true);
translate([-10/2,66-6,0]) cube([10,10,9.6],center=true);
translate([66-6,-10/2,0]) cube([10,10,9.6],center=true);

translate([66,-4.5,0]) rotate([0,90,0]) cylinder(r=2+0.05,h=10,center=true);
translate([-4.5,66,0]) rotate([90,0,0]) cylinder(r=2+0.05,h=10,center=true);
}
