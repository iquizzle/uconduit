include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


ACMENutOD = 20+0.1;
ACMENutH = 9.4;
ACMEScrewOD = (3./8)*25.4;
BearingH = 15.3;
BearingOD = 15;

z_end();
//z_hexclamp();

module z_end(type=2){
difference(){
union(){
translate([28,28,(ACMENutH)/2]) rotate([0,0,180]) fillet(16,ACMENutH);
cross_section(ACMENutH,type=type);
if(type==2){
difference(){
translate([-6,-6,0]) cylinder(r=15/2+3,h=BearingH);
translate([-6,-6,-0.1]) cylinder(r=15/2,h=BearingH+1);}
}
}

if(type==1){
translate([-6,-6,2]) rotate([0,0,15]) cylinder(r=ACMENutOD/2,h=ACMENutH,$fn=6);
translate([7,7,-3*ACMENutH/4]) rotate([0,0,-45]) 3dU(ACMENutH+1);
translate([7,7,-3*ACMENutH/4]) rotate([0,0,45]) 3dU(ACMENutH+1);
translate([-6,-6,-0.1]) rotate([0,0,15]) cylinder(r=ACMEScrewOD/2+0.5,h=ACMENutH+2);
translate([25,7,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([45,7,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([7,25,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([7,45,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([-6-9,-6+9,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([-6+9,-6-9,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);}
else if(type==2){
translate([-6,-6,-0.1]) cylinder(r=15/2,h=ACMENutH+2);
translate([7,7,-3*ACMENutH/4]) rotate([0,0,-45]) 3dU(ACMENutH+1);
translate([7,7,-3*ACMENutH/4]) rotate([0,0,45]) 3dU(ACMENutH+1);
translate([25,7,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([45,7,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([7,25,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([7,45,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
}

}}

module z_hexclamp(){
difference(){
union(){
translate([28,28,2]) rotate([0,0,180]) fillet(16,4);
cross_section(4,type=1);
}

translate([-6,-6,2.01]) rotate([0,0,15]) cylinder(r1=ACMENutOD/2-0.5,r2=ACMENutOD/2,h=2,$fn=6);
translate([7,7,-3*ACMENutH/4]) rotate([0,0,-45]) 3dU(ACMENutH+1);
translate([7,7,-3*ACMENutH/4]) rotate([0,0,45]) 3dU(ACMENutH+1);
translate([-6,-6,-0.1]) rotate([0,0,15]) cylinder(r=ACMEScrewOD/2+0.5,h=ACMENutH+2);
translate([-6-9,-6+9,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([-6+9,-6-9,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([31,31,-0.1]) rotate([0,0,45]) cube([80,80,15],center=true);
rotate([0,0,15]) translate([31,31,-0.1]) rotate([0,0,45]) cube([80,80,15],center=true);
rotate([0,0,-15]) translate([31,31,-0.1]) rotate([0,0,45]) cube([80,80,15],center=true);
}}


module cross_section(height,type=2){

linear_extrude(height=height)
minkowski(){
union(){
hull(){
translate([-8,-8,0]) circle(r=15/2);
translate([8,2,0]) square([1,50]);}
hull(){
translate([-8,-8,0]) circle(r=15/2);
translate([2,8,0]) square([50,1]);}
if(type==1){
translate([-6-8,-6+8,0]) circle(r=3);
translate([-6+8,-6-8,0]) circle(r=3);}

}
circle(r=4);}

}

module 3dU(height){
difference(){
cylinder(r=5,h=height);
translate([0,0,-0.05]) cylinder(r=4,h=height+0.1);
translate([-5.5,0,-0.05]) cube([11,11,height+0.1]);
}
translate([4,-0.1,0]) cube([1,6,height]);
translate([-5,-0.1,0]) cube([1,6,height]);
}