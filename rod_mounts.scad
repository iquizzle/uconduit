/*
*   CAD file for the UConduit linear rod mounts. Y and Z included as options.
*
*  Creative Commons Share Alike 3.0
*  Copyright (c) 2013 David Lee Miller
* 
*/

include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

///// Parameters to calculate rod locations

bearing1OD = 13+4;  // xend 624 bearingOD w/ fender
bearing2OD = 22+4;  // idler 608 bearingOD w/ fender
pulleyOD = 25.5; // motor pulleyOD (40 tooth)
nema17 = 42.3; // motor size
xoff = 10+1.5; // offset of the xend toward the conduit (add 1mm?)
zoff = 6.5; // offset parameter of the z rods away from conduit
bearing1H = 5; // xend 624 bearingH w/ fender
bearing2H = 7; // idler 608 bearingH w/ fender

//// Choose rod mounts (0=Y, 1=Z, 2=idler) ////
type = 0;

//////////////////////////////////////////////////

if (type == 0){
 translate([0,0,0]) yRodMount(bearing=1);
 translate([-35-2,0,0]) scale([-1,1,1]) yRodMount();
 translate([-35-2,35+2,0]) scale([-1,-1,1]) yRodMount();
 translate([0,35+2,0]) yRodMount(bearing=1);
}
else if (type == 1){
 rotate([0,0,-45+180]) zRodMount();
 translate([-5,35+16,0]) rotate([0,0,-40]) zRodMount(top=2);
 translate([-50,0,0]) rotate([0,0,-45]) zRodMount();
 translate([-45,55,0]) rotate([0,0,230]) zRodMount(top=2);
}
else{
 translate([0,0,0]) rotate([0,0,0]) bearingFender();
 translate([35,0,0]) rotate([0,0,0]) bearingFender();
}

module bearingFender(){
 difference(){
  union(){
   cylinder(r=bearing2OD/2,h=bearing2H+9);
   cylinder(r1=bearing2OD/2+2,r2=bearing2OD/2,h=4);
   translate([0,0,bearing2H+9-4]) cylinder(r2=bearing2OD/2+2,r1=bearing2OD/2,h=4);}
  cylinder(r=(bearing2OD-8)/2,h=100,center=true);
  translate([0,0,2.01]) cylinder(r=(bearing2OD-4)/2,h=bearing2H+10);
 }

 difference(){
  union(){
   cylinder(r=6,h=2);
   cylinder(r=8/2,h=16);
   }
   cylinder(r=2+0.2,h=36,center=true);
 }
}

module yRodMount(bearing=0){ // bearing option creates a mount point for the idler
 difference(){
  union(){
   translate([0,0,3]) quadflatFlange1(0,0,0,35.01,35,16,10); // basis flange
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

   if (bearing==1){
    // align the idler mount
    translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2,-35/2+3,0])
    cube([10,14,10],center=true);

    // warning -- manually aligned, adds extra support via fillet radius
    translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2-10/2-4,-12.25-7.45,0]) rotate([0,0,17]) 
    fillet(6,10);
    translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2+10/2+5.5,-8-5.8,0]) rotate([0,0,180-85]) 
    fillet(6,10);
   }
 }


 if (bearing==1){
  translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2,-35/2,0])
  rotate([90,0,0]) cylinder(r=2+tolerance,h=30,center=true);
  translate([35/2-pulleyOD/2+bearing2OD/2+nema17/2,-35/2+8,0])
  rotate([90,0,0]) rotate([0,0,90]) nutSlot(12,tolerance);
}}}

module zRodMount(top=1){
 difference(){
  union(){
   translate([0.005,-0.005,0]) rotate([0,0,45]) quadflatFlange1(0,0,0,35.01,35,10,10);
   translate([0,0,-10/2]) linear_extrude(height=10)
   difference(){
    hull(){
     rotate([0,0,45]) square(35,center=true);
     // align the motor pulley and xend bearing to rod center
     translate([1.41*35/2+zoff,0,0])
     if(top==1){
      square(12,center=true);
     }
     else{
      square([12,12+8],center=true);
     }
    }

    // make hole for linear rod
    translate([1.41*35/2+zoff,0,0])
    circle(4,center=true);

    if(top==1){
     // make slot for flex
     translate([1.41*35/2+zoff+1,0,0])
     square([12,1],center=true);
    }
    else{
     translate([1.41*35/2+zoff,0,0])
     square([1,32],center=true);
    }

    // remove excess
    rotate([0,0,45]) square(35.01,center=true);
   }
  }
  if(top==2){
  translate([35/2+12,-7,0]) rotate([0,90,0]) cylinder(r=2+0.1,h=35,center=true);
  translate([35/2+12,7,0]) rotate([0,90,0]) cylinder(r=2+0.1,h=35,center=true);
  translate([35/2+6.5,7,0]) rotate([0,-90,0]) nutSlot(12,0.1);
  translate([35/2+6.5,-7,0]) rotate([0,-90,0]) nutSlot(12,0.1);}
}}

