include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

mounting_sep = 15.3-7;
switch_sep = 9.5;

//carriage_endstop();
rotate([0,90,0]) outer_endstop();

module outer_endstop(){
difference(){
translate([0,0,2]) cube([8,14,18],center=true);

translate([0,0,-7]) cube([9,6,14],center=true);
translate([0,0,1.5]) rotate([0,90,0]) cylinder(r=4,h=15,center=true);
translate([0,switch_sep/2,13]) cylinder(r=2/2-0.05,h=20,center=true);
translate([0,-switch_sep/2,13]) cylinder(r=2/2-0.05,h=20,center=true);
translate([0,0,-4.25]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=20,center=true);}
}

module carriage_endstop(){
difference(){
union(){
translate([0,2,0]) cube([8,20,4],center=true);
translate([0,8+9-0.1,0]) cube([20,10,4],center=true);}

translate([0,mounting_sep/2,0]) cylinder(r=3/2+0.05,h=10,center=true);
translate([0,-mounting_sep/2,0]) cylinder(r=3/2+0.05,h=10,center=true);

translate([switch_sep/2,8+9-0.1,0]) cylinder(r=2/2+0.05,h=10,center=true);
translate([-switch_sep/2,8+9-0.1,0]) cylinder(r=2/2+0.05,h=10,center=true);

}
}

