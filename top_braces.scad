include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>


$fn=100;

plugOD = tubeOD;
plugID = 10;
height = 6;
clipheight = 12;

mount1();
translate([3,3,0]) mount2();
translate([8,0,35/2]) rotate([-90,0,0]) motor_clamps();

module motor_clamps(){
union(){
translate([35/2+40/2,35/2-5/2,35+40/2])
rotate([90,0,0])
difference(){
cube([40,40,5],center=true);
slot_motor_mount();}}

translate([35/2+15+15/2+2.75,35/2-35/2,35/2]) rotate([0,90,0]) quadflatPlate1(0,0,0,35.01,35,20,10);
translate([0,0,35/2+40+2.75]) quadflatPlate1(0,0,0,35.01,35,20,10);
}

module mount2(){
union(){
translate([35/2+15/2,0,35/2]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35,35,15,10);
translate([0,35/2+15/2,35/2]) rotate([90,0,0]) quadflatPlate1(0,0,0,35,35,15,10);
translate([35/2,35/2,35/2]) rotate([0,0,180]) fillet(15,35);}
}

module mount1(){
translate([0,0,35])
union(){
annulus();
translate([0,0,clipheight/2+2]) clips();
translate([0,0,-35/2]) rotate([-90,90,0]) quadflatFlange1Closed(0,0,0,35,35,35,12);
translate([0,0,15/2]) rotate([0,0,0]) quadflat1CapNut(0,0,0,35,35,15+0.01,10);}
}


module annulus(){
difference(){
cylinder(r=plugOD/2,h=height,center=true);

difference(){
translate([0,0,4]) cylinder(r=25/2,h=height,center=true);
translate([0,0,4]) cylinder(r=21/2,h=height,center=true);
}
cylinder(r=plugID/2,h=height+0.1,center=true);
}}


module clips(){
difference(){
union(){
cylinder(r=21/2,h=clipheight,center=true);
translate([0,0,clipheight/2-2]) cylinder(r1=22/2,r2=21/2,h=2);
translate([0,0,clipheight/2-4]) cylinder(r1=21/2,r2=22/2,h=2);
}
cylinder(r=18/2,h=clipheight+1, center=true);
cube([4,30,30],center=true);
cube([30,4,30],center=true);
}}

module fillet(rad,height){
translate([-rad,-rad,0])
difference(){
translate([0,0,-height/2]) cube([rad+0.01,rad+0.01,height]);
cylinder(h=height+1,r=rad,center=true);
}}

module slot_motor_mount(){
translate([15.5,15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
translate([-15.5,-15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
translate([15.5,-15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
translate([-15.5,15.5,0]) rotate([0,0,-45]) slot_head(1.75,10,1);
for (i=[-1:0.5:1]){
	translate([i,i,-0.1]) cylinder(h=25,r=14,center=true);
}

}

module slot_head(rad,height,slot){
union(){
for (i=[-slot/2:0.5:slot/2]){
	translate([0,i,-0.1]) cylinder(h=height,r=rad,center=true);
}}}