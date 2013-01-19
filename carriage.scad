include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


rod_spacing = 20;
bearing_spacing = 12;
bushingOD = 16+0.1;
bushingOD2 = 18;
bushingL = 11.5;
hotendsep = 11.65;

translate([15,0,0]) ycarriage();
translate([-15,0,0]) scale([-1,1,1]) ycarriage();


module ycarriage(){

difference(){
cross_section();
translate([0,0,2+hotendsep/2]) rotate([0,90,0]) cylinder(r=2,h=30,center=true);
translate([9.5,0,2+hotendsep/2]) rotate([0,-90,0]) nutSlot(10,0.1);
rotate([0,0,90]) rodsnbushings();
}
}

module cross_section(){
difference(){
union(){
linear_extrude(height=12)
minkowski(){
union(){
translate([0,rod_spacing/2,0]) circle(r=bushingOD/2,center=true);
translate([0,-rod_spacing/2,0]) circle(r=bushingOD/2,center=true);
translate([bushingOD/4+1.0,0,0]) square([bushingOD/2+1.0,rod_spacing+bushingOD],center=true);
}
circle(r=3);}
translate([0,0,6]) cube([14,10,12],center=true);
translate([-bushingOD/2,rod_spacing/2+bushingOD/2,0]) cylinder(r=9/2,h=12,center=false);
translate([-bushingOD/2,-rod_spacing/2-bushingOD/2,0]) cylinder(r=9/2,h=12,center=false);
translate([bushingOD/2,rod_spacing/2+bushingOD/2,0]) cylinder(r=9/2,h=12,center=false);
translate([bushingOD/2,-rod_spacing/2-bushingOD/2,0]) cylinder(r=9/2,h=12,center=false);}
translate([-bushingOD/2,rod_spacing/2+bushingOD/2,-0.1]) cylinder(r=2,h=15,center=false);
translate([-bushingOD/2,-rod_spacing/2-bushingOD/2,-0.1]) cylinder(r=2,h=15,center=false);
translate([bushingOD/2,rod_spacing/2+bushingOD/2,-0.1]) cylinder(r=2,h=15,center=false);
translate([bushingOD/2,-rod_spacing/2-bushingOD/2,-0.1]) cylinder(r=2,h=15,center=false);}


//translate([-13.5,0,0]) cube([1.5,6,20],center=true);
}

module rodsnbushings(){
translate([0,0,bushingL/2])
union(){
translate([rod_spacing/2,0,0]) cylinder(r=4.1,h=100,center=true);
translate([-rod_spacing/2,0,0]) cylinder(r=4.1,h=100,center=true);
translate([rod_spacing/2,0,0]) cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
translate([-rod_spacing/2,0,0]) cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
translate([rod_spacing/2,0,bushingL]) cylinder(r=bushingOD2/2,h=bushingL+0.05,center=true);
translate([-rod_spacing/2,0,bushingL]) cylinder(r=bushingOD2/2,h=bushingL+0.05,center=true);
}}