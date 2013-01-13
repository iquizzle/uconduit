include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


bearing1OD = 13+4;  //xend bearingOD w/ fender
bearing2OD = 22+4;  //idler bearingOD w/ fender
pulleyOD = 25.5; // motor pulleyOD
nema17 = 42.3; // motor size
xoff = 10; // offset of the xend toward the conduit
bearing1H = 5;
bearing2H = 7;


translate([0,0,0]) bearingPlate(bearing=false);
//translate([-35-2,0,0]) scale([-1,1,1]) bearingPlate();
//translate([-35-2,35+2,0]) scale([-1,-1,1]) bearingPlate();
//translate([0,35+2,0]) scale([1,-1,1]) bearingPlate();

//translate([0,0,0]) rotate([0,0,0]) bearingFender();

module bearingFender(){
difference(){
union(){
cylinder(r=bearingOD/2+2,h=bearingH+9);
cylinder(r1=bearingOD/2+4,r2=bearingOD/2+2,h=4);
translate([0,0,bearingH+9-4]) cylinder(r2=bearingOD/2+4,r1=bearingOD/2+2,h=4);}
cylinder(r=bearingOD/2-1,h=100,center=true);
translate([0,0,2.01]) cylinder(r=bearingOD/2,h=bearingH+10);
}}

module bearingPlate(bearing=true){

difference(){
union(){
translate([0,0,3]) quadflatFlange1(0,0,0,35.01,35,16,10);

translate([0,0,-10/2]) linear_extrude(height=10)
difference(){
hull(){
square(35,center=true);
// align the motor pulley and xend bearing to rod center
translate([35/2+pulleyOD/2+bearing1OD/2+nema17/2-xoff,0,0])
square(12,center=true);

}

hull(){
square(25,center=true);
// align the motor pulley and xend to rod center
translate([35/2+pulleyOD/2+bearing1OD/2+nema17/2-xoff-12,0,0])
square(8,center=true);
}
// make hole for linear rod
translate([35/2+pulleyOD/2+bearing1OD/2+nema17/2-xoff,0,0])
circle(4,center=true);

// make slot for flex
translate([35/2+pulleyOD/2+bearing1OD/2+nema17/2-xoff+1,0,0])
square([12,1],center=true);

// remove excess
square(35.01,center=true);
}

if (bearing==true){
// align the idler mount
translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2,-35/2+3,0])
cube([10,14,10],center=true);

// warning -- manually aligned
translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2-10/2,-12.5,0]) rotate([0,0,17]) 
fillet(6,10);

translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2+10/2-0.5,-8.5,0]) rotate([0,0,180-85]) 
fillet(6,10);}
}


if (bearing==true){
translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2,-35/2,0])
rotate([90,0,0]) cylinder(r=2+tolerance,h=30,center=true);

translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2,-35/2+8,0])
rotate([90,0,0]) rotate([0,0,90]) nutSlot(12,tolerance);}

//translate([-35/2+6,0,0]) cube([35.2,35.2,30],center=true);
}

}

module bearingPlate1(){
difference(){
union(){
quadflatPlate1(0,0,0,35.01,35,12,10);

// align
translate([35/2+pulleyOD/2+bearing2OD/2,0,0])
cube([12.01,12.01,12.01],center=true);

translate([0,35/2+6,0]) cube([12.01,12.01,12.01],center=true);
}
translate([-35/2+12/2,35/2+12/2,0]) cylinder(r=4,h=20,center=true);
translate([-35/2+12/2-6,35/2+12/2,0]) cube([25,1.01,13.01],center=true);
//translate([-35/2+12/2-10,35/2+12/2+4,0]) rotate([90,0,0]) cylinder(r=2+tolerance,h=50,center=true);
translate([0,35/2+7,0]) rotate([90,0,0]) nutSlot(20,tolerance);
translate([0,20,0]) rotate([90,0,0]) cylinder(r=2+tolerance,h=40,center=true);
}}

module fillet(rad,height){
translate([-rad,-rad,0])
difference(){
translate([0,0,-height/2]) cube([rad+0.01,rad+0.01,height]);
cylinder(h=height+1,r=rad,center=true);
}}

module bottom_clip(){
difference(){
union(){
cylinder(r=bearingOD/2+3,h=4,center=true);
translate([0,0,3]) cylinder(r=bearingID/2+2,h=2+0.01,center=true);
translate([0,0,bearingH/2+4]) cylinder(r=bearingID/2,h=bearingH+0.01,center=true);

}
translate([0,0,1]) boltHole(4,length=30,tolerance=tolerance);
cylinder(r=4/2+tolerance,h=60, center=true);
}}