include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>

module slot_head(rad,height,slot){
union(){
for (i=[-slot/2:0.5:slot/2]){
	translate([0,i,0]) cylinder(h=height,r=rad);
}}}

module slot_motor_mount(){
translate([15.5,15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
translate([-15.5,-15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
translate([15.5,-15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
translate([-15.5,15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
cylinder(h=50,r=14);
translate([2,2,0]) cylinder(h=50,r=14);
}

union(){
translate([-35/2,42.3/2,0]) rotate([-90,90,0]) quadflat1CapNut(0,0,0,35,35,42.3,12);

translate([42.3/2,-35/2,0]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35,35,42.3,12);

translate([-35/2,-35/2,0]) rotate([0,0,90]) quadflatFlange2(0,0,0,35+0.05,35+0.05,35);

translate([42.3/2,42.3/2,35/2-2.5])
difference(){
cube([42.35,42.35,5],center=true);
translate([16,16,0]) rotate([0,0,45]) cube([37.05,57.05,5.2],center=true);
translate([0,0,-6]) slot_motor_mount();
}}

//translate([42.3/2,42.3/2,35/2-2.5]) stepper_motor_mount(17);