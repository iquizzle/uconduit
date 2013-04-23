include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


ACMENutOD = 20+0.1;
ACMENutH = 9.4;
ACMEScrewOD = (3./8)*25.4;
BearingH = 15.0;
BearingOD = 15;
rod_spacing = 24;

//translate([35,0,0]) z_end(type=2,bearing=1);
//z_end(type=1,bearing=0);
//z_hexclamp();
rotate([0,180,0]) bearingHolder();


module z_end(type=1,bearing=0){
difference(){
union(){
if(type==1){
translate([28,28,(ACMENutH)/2]) rotate([0,0,180]) fillet(16,ACMENutH);}
cross_section(ACMENutH,type=type,bearing=bearing);
if(type==2){
difference(){
translate([-6,-6,0]) cylinder(r1=BearingOD/2+4.5,r2=BearingOD/2+3,h=BearingH);
translate([-6,-6,-0.1]) cylinder(r=BearingOD/2,h=BearingH+1);}
}
}

if(type==1){
translate([-6,-6,2]) rotate([0,0,15]) cylinder(r=ACMENutOD/2,h=ACMENutH,$fn=6);
//imprint logo
translate([7.75,7.75,3*ACMENutH/4+1.5]) rotate([0,0,-45]) 3dU(ACMENutH);
translate([7.75,7.75,3*ACMENutH/4+1.5]) rotate([0,0,-135]) 3dU(ACMENutH);
translate([7.75,7.75,3*ACMENutH/4+1.5]) difference(){
cylinder(r=8,h=ACMENutH+1);
cylinder(r=7,h=ACMENutH+1);
}

translate([-6,-6,-0.1]) rotate([0,0,15]) cylinder(r=ACMEScrewOD/2+0.5,h=ACMENutH+2);
translate([25,7,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([45,7,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([7,25,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([7,45,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([-6-9,-6+9,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([-6+9,-6-9,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([-19,-8.5,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([-8.5,-19,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
//translate([-15,-15,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
//Bearing Hole
translate([-6-(((35/sqrt(2)+42.3/sqrt(2))-(35/sqrt(2)+6.5))/sqrt(2)),-6-(((35/sqrt(2)+42.3/sqrt(2))-(35/sqrt(2)+6.5))/sqrt(2)),ACMENutH/2-0.1]) cylinder(r=15/2+2.5,h=ACMENutH+1,center=true);
}
else if(type==2){
translate([-6,-6,-0.1]) cylinder(r=BearingOD/2,h=ACMENutH+2);
//imprint logo
translate([7.75,7.75,3*ACMENutH/4+1.5]) rotate([0,0,-45]) 3dU(ACMENutH);
translate([7.75,7.75,3*ACMENutH/4+1.5]) rotate([0,0,-135]) 3dU(ACMENutH);
translate([7.75,7.75,3*ACMENutH/4+1.5]) difference(){
cylinder(r=8,h=ACMENutH+1);
cylinder(r=7,h=ACMENutH+1);
}
translate([20,20,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);
translate([40,40,-0.1]) cylinder(r=2+0.05,h=ACMENutH+2);

translate([-6,-6,0]) rotate(10)
translate([0,1.41*(BearingOD/2)+1,0]) cylinder(r=2.05,h=100,center=true);
translate([-6,-6,0]) rotate(-100)
translate([0,1.41*(BearingOD/2)+1,0]) cylinder(r=2.05,h=100,center=true);
translate([-6,-6,0]) rotate(135)
translate([0,1.41*(BearingOD/2)+1,0]) cylinder(r=2.05,h=100,center=true);
}

}}

module z_hexclamp(noholes=0){
height = 15.0-ACMENutH;
difference(){
union(){
translate([28,28,2]) rotate([0,0,180]) fillet(16,4);
translate([0,0,-height+4]) cross_section(15.0-ACMENutH,type=1);
}

if (noholes==0){
translate([-6,-6,2.01]) rotate([0,0,15]) cylinder(r1=ACMENutOD/2-0.5,r2=ACMENutOD/2,h=2,$fn=6);
translate([-6,-6,-0.1-height+4]) rotate([0,0,15]) cylinder(r=ACMEScrewOD/2+0.5,h=height+2);
translate([-6-9,-6+9,-0.1-height+4]) cylinder(r=2+0.05,h=height+2);
translate([-6+9,-6-9,-0.1-height+4]) cylinder(r=2+0.05,h=height+2);
translate([-19,-8.5,-0.1-height+4]) cylinder(r=2+0.05,h=height+2);
translate([-8.5,-19,-0.1-height+4]) cylinder(r=2+0.05,h=height+2);}
translate([31,31,-0.1-height+4]) rotate([0,0,45]) cube([80,80,15],center=true);
rotate([0,0,15]) translate([31,31,-0.1]) rotate([0,0,45]) cube([80,80,15],center=true);
rotate([0,0,-15]) translate([31,31,-0.1]) rotate([0,0,45]) cube([80,80,15],center=true);
translate([-6-(((35/sqrt(2)+42.3/sqrt(2))-(35/sqrt(2)+6.5))/sqrt(2)),-6-(((35/sqrt(2)+42.3/sqrt(2))-(35/sqrt(2)+6.5))/sqrt(2)),-0.1-height+4]) cylinder(r=15/2+2.5,h=height+2);
}}


module cross_section(height,type=1,bearing=0){
if(type==1){
linear_extrude(height=height)
minkowski(){
union(){
hull(){
translate([-8,-8,0]) circle(r=BearingOD/2);
translate([8,2,0]) square([1,50]);}
hull(){
translate([-8,-8,0]) circle(r=BearingOD/2);
translate([2,8,0]) square([50,1]);}
if(type==1){
translate([-6,-6,0]) rotate([0,0,-15]) circle(r=16,$fn=6);
}
}
circle(r=4);}}
else{
linear_extrude(height=height)
minkowski(){
union(){
hull(){
translate([-6,-6,0]) circle(r=BearingOD/2-0.5);
if (bearing==0){
translate([25,25,0]) rotate([0,0,-45]) square([1,50],center=true);}

}

translate([-6,-6,0]) rotate(10)
union(){
translate([0,1.41*(BearingOD/2),0]) circle(r=2.0);
translate([0,8,0]) square([0.1,8],center=true);}

translate([-6,-6,0]) rotate(135)
union(){
translate([0,1.41*(BearingOD/2),0]) circle(r=2.0);
translate([0,8,0]) square([0.1,8],center=true);}

translate([-6,-6,0]) rotate(-100)
union(){
translate([0,1.41*(BearingOD/2),0]) circle(r=2.0);
translate([0,8,0]) square([0.1,8],center=true);}
}
circle(r=4);}}
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

module bearingHolder(mode=1){

difference(){
cross_sectionA();
rotate([0,0,90]) rodsnbushings(mode=mode);
translate([0,42.15,-1]) rotate([0,0,45]) z_hexclamp(noholes=1);}

}

module cross_sectionA(){
difference(){
linear_extrude(height=BearingH)
minkowski(){
translate([0,14,0]) square([17,23],center=true);
circle(r=3.05);}
translate([-26/4-1,rod_spacing/2+14/2+4,-0.1]) cylinder(r=2+0.05,h=BearingH+1,center=false);
translate([26/4+1,rod_spacing/2+14/2+4,-0.1]) cylinder(r=2+0.05,h=BearingH+1,center=false);
//translate([0,3.5,-0.1]) cylinder(r=2+0.05,h=BearingH+1,center=false);
//translate([-10,20,BearingH/2+1]) cube([20,20,BearingH]);
}}

module rodsnbushings(mode=1){
translate([0,0,BearingH/2])
translate([rod_spacing/2-1.5,0,0]) cylinder(r=BearingOD/2,h=BearingH+0.05,center=true);
}