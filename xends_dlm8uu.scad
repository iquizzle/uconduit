include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


rod_spacing = 24;
bearing_spacing = 12;
ballbearingOD = 5/32*25.4;
ballbearingTol = 0.1;
bushingOD = 16;

bushingL = 4*ballbearingOD+1.5;
echo(bushingL);
hotendsep = 11.65;
belt_h = 1.75;
belt_w = 6.5;
xoffset=10;

bearingOD = 13;
bearingID = 4;
bearingH = 5;

//xendA();

difference(){
rotate([0,90,0])
union(){
translate([0,0,11/2-0.001]) xendB();
translate([0,0,-11/2]) rotate([0,180,0]) scale([-1,1,1]) xendB();}
mockbearing();

//subtract the rod clamping pieces
translate([0,20,0]) cube([1,100,30],center=true);
translate([-8,25,6]) rotate([0,90,0]) boltHole(4,length=30,tolerance=0.1);
translate([-7,25,6]) rotate([0,90,0]) boltHole(4,length=30,tolerance=0.1);
translate([-8,25,6]) rotate([0,90,0]) cylinder(r=2+0.05,h=30);
translate([-7,42,4.5]) rotate([0,90,0]) boltHole(4,length=30,tolerance=0.1);
translate([-8,42,4.5]) rotate([0,90,0]) boltHole(4,length=30,tolerance=0.1);
translate([-8,42,4.5]) rotate([0,90,0]) cylinder(r=2+0.05,h=30);
translate([7,25,6]) rotate([0,-90,0]) nutSlot(10,0.1);
}


module mockbearing(){
union(){
union(){
translate([-5.5,-2,13.05]) cube([11.01,bushingOD+5.1,bushingOD+4.1],center=true);
translate([-bushingL+3.2,-2,8.55]) cube([bushingL+0.01-11,bushingOD+5.1,bushingOD+13.1],center=true);
}
translate([0,-2,0]) rotate([0,0,180])
union(){
translate([-5.5,0,13.05]) cube([11,bushingOD+5.1,bushingOD+4.1],center=true);
translate([-bushingL+3.2,0,8.55]) cube([bushingL-11,bushingOD+5.1,bushingOD+13.1],center=true);
}
translate([0,4,-1]) rotate([0,90,0]) cylinder(r=2.05,h=100,center=true);
translate([0,-6,-1]) rotate([0,90,0]) cylinder(r=2.05,h=100,center=true);}}

module xendA(mode=1){

difference(){
cross_sectionA();
rotate([0,0,90]) rodsnbushings(mode=mode);}

}

module cross_sectionA(){
difference(){
linear_extrude(height=bushingL)
minkowski(){
translate([0,bushingOD-1.5,0]) square([bushingOD-3,bushingOD+7],center=true);
circle(r=3.05);}
translate([-bushingOD/4-1,rod_spacing/2+bushingOD/2+4,-0.1]) cylinder(r=2+0.05,h=bushingL+1,center=false);
translate([bushingOD/4+1,rod_spacing/2+bushingOD/2+4,-0.1]) cylinder(r=2+0.05,h=bushingL+1,center=false);
translate([0,3.5,-0.1]) cylinder(r=2+0.05,h=bushingL+1,center=false);
translate([-10,20,bushingL-11]) cube([20,20,20]);
translate([0,11.375,-0.5]) cube([bushingL+1,1.25,100]);
}}


module xendB(){
difference(){
union(){
difference(){
cross_sectionB(11);
rotate([0,0,180]) translate([-6.5,-25,5.6]) rotate([90,0,0]) rotate([0,0,90]) fillet(4,12);
translate([-xoffset-8-12/2-2,0,0]) rotate([90,0,0]) cylinder(r=2,h=20,center=true);
translate([0,15,-11/2]) rotate([0,90,0]) cylinder(r=4+0.05,h=50,center=true);
translate([0,35,-11/2]) rotate([0,90,0]) cylinder(r=4+0.05,h=50,center=true);
}

translate([0,25+2+12/2,11/2+bearingOD/2-0.01])
difference(){
rotate([0,0,180]) 
union(){
cube([12,4,bearingOD],center=true);
translate([0,-2,-6.5-0.1]) rotate([0,90,0]) fillet(5,12);}
translate([0,0,bearingOD/2-4]) rotate([90,0,0]) cylinder(r=2,h=10,center=true);}

translate([0,25-2-12/2,11/2+bearingOD/2-0.01])
difference(){
union(){
cube([12,4,bearingOD],center=true);
translate([0,-2,-6.5-0.1]) rotate([0,90,0]) fillet(5,12);}
translate([0,0,bearingOD/2-4]) rotate([90,0,0]) cylinder(r=2,h=10,center=true);}}

}}

module cross_sectionB(thickness,minkwid=4.5){
translate([0,0,-thickness/4])
minkowski(){
linear_extrude(height=thickness/2)
translate([-3.5,18,0]) square([10,50],center=true);
cylinder(r=minkwid,h=thickness/2,center=true);
}}

module rodsnbushings(mode=1){
if(mode==0){
translate([0,0,bushingL/2])
union(){
translate([rod_spacing/2,0,0]) cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
translate([-rod_spacing/2,0,0]) cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
}}
else{
translate([0,0,bushingL/2])
translate([rod_spacing/2,0,0]) cylinder(r=8.5/2,h=bushingL+0.05,center=true);

translate([rod_spacing/2,0,bushingL/2+2.5])
linear_extrude(height=bushingL, center=true, twist = 0)
for (i=[0:4]){
rotate([0,0,i*360/4+45]) translate([(ballbearingOD+8-ballbearingTol)/2,0,0]) circle(r=(ballbearingOD+ballbearingTol)/2);}

}
}

module fillet(rad,height){
translate([-rad,-rad,0])
difference(){
translate([0,0,-height/2]) cube([rad+0.01,rad+0.01,height]);
cylinder(h=height+1,r=rad,center=true);
}}