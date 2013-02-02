include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


rod_spacing = 24;
bearing_spacing = 12;
bushingOD = 15;
bushingOD2 = 15;
bushingL = 15.5;
hotendsep = 11.65;
belt_h = 1.75;
belt_w = 6.5;
xoffset=10;

bearingOD = 13;
bearingID = 4;
bearingH = 5;

//xendA();

union(){
rotate([0,90,0])
union(){
translate([0,0,11/2-0.001]) xendB();
translate([0,0,-11/2]) rotate([0,180,0]) scale([-1,1,1]) xendB();}

translate([bushingL/2,0,rod_spacing/2+xoffset]) rotate([0,0,90]) rotate([-90,0,0]) xendA(negative=1);

}



module xendA(negative=0){

difference(){
cross_sectionA(negative=negative);
rotate([0,0,90]) rodsnbushings();
}}

module cross_sectionA(negative=0){
if (negative==1){
union(){
translate([-bushingOD/4,rod_spacing/2+bushingOD/2+4,-bushingL/2]) cylinder(r=2,h=bushingL*2,center=false);
translate([bushingOD/4,rod_spacing/2+bushingOD/2+4,-bushingL/2]) cylinder(r=2,h=bushingL*2,center=false);
translate([bushingOD/4,0,-bushingL/2]) cylinder(r=2,h=bushingL*2,center=false);
translate([0,rod_spacing/2,-bushingL/2]) cylinder(r=bushingOD/2+0.5,h=2*bushingL,center=false);
translate([0,-rod_spacing/2,-bushingL/2]) cylinder(r=bushingOD/2+0.5,h=2*bushingL,center=false);
translate([-3,3,bushingL/2+0.125]) cube([bushingOD+12,rod_spacing+bushingOD+6+6,bushingL+0.25],center=true);}}
else{
difference(){
linear_extrude(height=bushingL)
minkowski(){
translate([0,6/2,0]) square([bushingOD,rod_spacing+bushingOD+6],center=true);
circle(r=3.05);}
translate([-bushingOD/4,rod_spacing/2+bushingOD/2+4,-0.1]) cylinder(r=2+0.05,h=bushingL+1,center=false);
translate([bushingOD/4,rod_spacing/2+bushingOD/2+4,-0.1]) cylinder(r=2+0.05,h=bushingL+1,center=false);
translate([bushingOD/4,0,-0.1]) cylinder(r=2+0.05,h=bushingL+1,center=false);
}}

}

module xendB(){
difference(){
union(){
difference(){
cross_sectionB(bushingOD,11);
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

module cross_sectionB(ID,thickness,minkwid=4.5)
translate([0,0,-thickness/4])
difference(){

minkowski(){
linear_extrude(height=thickness/2)

hull(){
union(){
//translate([-xoffset,0,0]) circle(r=ID/2,center=true);
//translate([-xoffset,0,0]) circle(r=ID/2,center=true);
translate([-3.5,16,0]) square([10,46],center=true);
//translate([-16,0,0]) square([2,2],center=true);
}}
cylinder(r=minkwid,h=thickness/2,center=true);}
translate([-15,-5,0]) cube([15,25,thickness*2],center=true);
translate([-xoffset,0,0]) cylinder(r=ID/2,h=100.5,center=true);
}

module rodsnbushings(){
translate([0,0,bushingL/2])
union(){
translate([rod_spacing/2,0,0]) cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
translate([-rod_spacing/2,0,0]) cylinder(r=bushingOD/2,h=bushingL+0.05,center=true);
}}

module fillet(rad,height){
translate([-rad,-rad,0])
difference(){
translate([0,0,-height/2]) cube([rad+0.01,rad+0.01,height]);
cylinder(h=height+1,r=rad,center=true);
}}