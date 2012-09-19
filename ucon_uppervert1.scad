include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

module rtriangle(side,thickness){
difference(){
cube([side,side,thickness],center=true);
translate(sqrt(2)*side/4*[1,-1,0]) rotate([0,0,45]) cube([4*side,side,thickness+0.2],center=true);
}}

module rodclamp(){ 
difference(){
cube([18,12,14],center=true);
translate([0,0,2]) cube([19,1,14],center=true);
translate([0,0,-2]) rotate([0,90,0]) cylinder(h=50,r=4,center=true);
translate([0,0,4])rotate([90,0,0]) cylinder(h=50,r=2,center=true);}}

module slot_head(rad,height,slot){
union(){
for (i=[-slot/2:0.5:slot/2]){
	translate([0,i,0]) cylinder(h=height,r=rad);
}}}

module slot_motor_mount(){
translate([15.5,15.5,-10]) slot_head(3,13,2);
translate([-15.5,-15.5,-10]) slot_head(3,13,2);
translate([15.5,-15.5,-10]) slot_head(3,13,2);
translate([-15.5,15.5,-10]) slot_head(3,13,2);
translate([15.5,15.5,0]) slot_head(1.75,20,2);
translate([-15.5,-15.5,0]) slot_head(1.75,20,2);
translate([15.5,-15.5,0]) slot_head(1.75,20,2);
translate([-15.5,15.5,0]) slot_head(1.75,20,2);
cylinder(h=50,r=13.5);
translate([0,0,37.3]) cube(42.3,center=true);
}

union(){
//add 

translate([-35/2,42.3/2,0]) rotate([-90,90,0]) quadflat1CapNut(0,0,0,35,35,42.3);
difference(){
translate([42.3/2,-35/2,0]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35,35,42.3);
translate([42.3/2,-42.3/2-35+15,35/2-2.5+15]) rotate([180-45,0,0]) slot_motor_mount();}
translate([-35/2,-35/2,0]) rotate([0,0,90]) quadflatFlange2(0,0,0,35+0.05,35+0.05,35);


difference(){
translate([42.3/2,-35/2-35+0.1,35/2-12/2]) cube([42.3-0.05,35,12],center=true);
translate([42.3/2,-42.3/2-35+15,35/2-2.5+15]) rotate([180-45,0,0]) slot_motor_mount();}

translate([42.3/2,42.3/2,35/2-7.5])
difference(){
cube([42.35,42.35,15],center=true);

rotate([0,0,45]) translate([-5.75,-5.75,0]) cylinder(h=100,r=2.1,center=true);
rotate([0,0,-45]) translate([-5.75,-5.75,0]) cylinder(h=100,r=2.1,center=true);

rotate([0,0,45]) translate([-5.75,-5.75,-15/2-0.1]) rotate([0,0,15]) nutHole(4,tolerance=0.1);
rotate([0,0,-45]) translate([-5.75,-5.75,-15/2-0.1]) rotate([0,0,15]) nutHole(4,tolerance=0.1);

translate([13.2,13.2,0]) rotate([0,0,45]) cube([37.05,87.05,55.2],center=true);
translate([-8,-8,0]) rotate([0,0,90]) rtriangle(27,55.2);
translate([0.14,0.14,0]) cylinder(h=100,r=4,center=true);
translate([13/1.414,-13/1.414,0]) rotate([0,0,45]) rotate([0,90,0]) cylinder(h=30,r=2.05,center=true);
translate([-13/1.414,13/1.414,0]) rotate([0,0,45]) rotate([0,90,0]) cylinder(h=30,r=2.05,center=true);
translate([-13/1.414,13/1.414,0]) translate([-5.7,-5.7,0]) rotate([0,0,-45]) rotate([90,0,0]) nutHole(4,tolerance=0.1);
translate([13/1.414,-13/1.414,0]) translate([-5.7,-5.7,0]) rotate([0,0,-45]) rotate([90,0,0]) nutHole(4,tolerance=0.1);
}}



translate([42.3/2,-42.3/2-35+2,35/2-2.5+5]) rotate([-45,0,0]) stepper_motor_mount(17);