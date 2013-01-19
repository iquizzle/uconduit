include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


width = 12;
drop = 15;
tolerance = 0.05;
bearingOD = 13;
bearingID = 4;
bearingH = 5;
xoffset=10;


translate([-10,0,0]) xend1();
translate([10,0,0]) xend2();
//cross_section(16,10);


module xend1(){
difference(){
union(){
difference(){
union(){
cross_section(16,11);
translate([-xoffset,-8-9/2+2,0]) cylinder(r=9/2,h=11,center=true);
translate([-xoffset-8-12/2,0,0]) cube([12,8,11],center=true);}
translate([-xoffset,0,4]) cylinder(r=18/2,h=30);
translate([-xoffset,0,0]) cylinder(r=16/2,h=30,center=true);
translate([-xoffset,-8-9/2+1.75,0]) cylinder(r=2+tolerance,h=30,center=true);
translate([-xoffset,0,0]) rotate([0,0,130]) translate([0,-8-9/2+1.75,0]) cylinder(r=2+tolerance,h=30,center=true);
rotate([0,0,180]) translate([-9.5,-25,5.1]) rotate([90,0,0]) rotate([0,0,90]) fillet(4,12);
//translate([4,0,0]) rotate([90,0,0]) cylinder(r=2,h=24,center=true);
translate([-xoffset-8-12/2-2,0,0]) rotate([90,0,0]) cylinder(r=2,h=20,center=true);
//translate([4,-9,0]) rotate([0,180,0]) rotate([90,0,0]) boltHole(4,length=10,tolerance=tolerance);
//translate([4,-7,0]) rotate([0,180,0]) rotate([90,0,0]) boltHole(4,length=10,tolerance=tolerance);
//translate([4,8.5,0]) rotate([90,0,0]) nutSlot(10,tolerance);
translate([-30,0,0]) cube([50,1.5,20],center=true);
translate([0,15,-10/2]) rotate([0,90,0]) cylinder(r=4+0.1,h=50,center=true);
translate([0,15,-10/2]) scale([1,1,1.18]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=4+0.1,h=50,center=true,$fn=6);
translate([0,35,-10/2]) rotate([0,90,0]) cylinder(r=4+0.1,h=50,center=true);
translate([0,35,-10/2]) scale([1,1,1.18]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=4+0.1,h=50,center=true,$fn=6);
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

translate([-8,25,1.85+0.5]) rotate([0,180,0]) boltHole(4,tolerance=tolerance);
translate([-8,25,1.35+0.5]) rotate([0,180,0]) boltHole(4,tolerance=tolerance);
translate([-8,25,2.5]) rotate([0,180,0]) cylinder(r=2+tolerance/2,h=100,center=true);

translate([2,25,1.85+0.5]) rotate([0,180,0]) boltHole(4,tolerance=tolerance);
translate([2,25,1.35+0.5]) rotate([0,180,0]) boltHole(4,tolerance=tolerance);
translate([2,25,2.5]) rotate([0,180,0]) cylinder(r=2+tolerance/2,h=100,center=true);
}}

module xend2(){

difference(){
union(){
difference(){
union(){
rotate([0,180,0]) cross_section(16,11);
translate([xoffset,-8-9/2+2,0]) cylinder(r=9/2,h=11,center=true);
translate([xoffset+8+12/2,0,0]) cube([12,8,11],center=true);}
translate([xoffset,0,4]) cylinder(r=18/2,h=30);
translate([xoffset,0,0]) cylinder(r=16/2,h=30,center=true);
translate([xoffset,-8-9/2+1.75,0]) cylinder(r=2+tolerance,h=30,center=true);
translate([xoffset,0,0]) rotate([0,0,-130]) translate([0,-8-9/2+1.75,0]) cylinder(r=2+tolerance,h=30,center=true);
rotate([0,0,180]) translate([9.5,-25,5.1]) rotate([90,0,0]) fillet(4,12);
//translate([-4,0,0]) rotate([90,0,0]) cylinder(r=2,h=24,center=true);
translate([xoffset+8+12/2+2,0,0]) rotate([90,0,0]) cylinder(r=2,h=20,center=true);
//translate([-4,-9,0]) rotate([0,180,0]) rotate([90,0,0]) boltHole(4,length=10,tolerance=tolerance);
//translate([-4,-7,0]) rotate([0,180,0]) rotate([90,0,0]) boltHole(4,length=10,tolerance=tolerance);
//translate([-4,5.5,0]) rotate([0,0,180]) rotate([90,0,0]) nutSlot(10,tolerance);
translate([30,0,0]) cube([50,1.5,20],center=true);
translate([0,15,-10/2]) rotate([0,90,0]) cylinder(r=4+0.1,h=50,center=true);
translate([0,15,-10/2]) scale([1,1,1.18]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=4.1,h=50,center=true,$fn=6);
translate([0,35,-10/2]) rotate([0,90,0]) cylinder(r=4+0.1,h=50,center=true);
translate([0,35,-10/2]) scale([1,1,1.18]) rotate([30,0,0]) rotate([0,90,0]) cylinder(r=4.1,h=50,center=true,$fn=6);
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

translate([-2,25,1.25]) rotate([0,180,0]) nutSlot(12,tolerance);
translate([-2,25,0.75]) rotate([0,180,0]) nutSlot(12,tolerance);
translate([-2,25,2.5]) rotate([0,180,0]) cylinder(r=2,h=100,center=true);

translate([8,25,1.25]) rotate([0,0,180]) rotate([0,180,0]) nutSlot(12,tolerance);
translate([8,25,0.75]) rotate([0,0,180]) rotate([0,180,0]) nutSlot(12,tolerance);
translate([8,25,2.5]) rotate([0,180,0]) cylinder(r=2,h=100,center=true);
}}

module cross_section(ID,thickness,minkwid=4.5)
translate([0,0,-thickness/4])
difference(){

minkowski(){
linear_extrude(height=thickness/2)

hull(){
union(){
translate([-xoffset,0,0]) circle(r=ID/2,center=true);
translate([0,20,0]) square([10,40],center=true);}}
cylinder(r=minkwid,h=thickness/2,center=true);}

translate([-xoffset,0,0]) cylinder(r=ID/2,h=100.5,center=true);
}

module fillet(rad,height){
translate([-rad,-rad,0])
difference(){
translate([0,0,-height/2]) cube([rad+0.01,rad+0.01,height]);
cylinder(h=height+1,r=rad,center=true);
}}

module bearingPlate(){
union(){
quadflatPlate1(0,0,0,35.01,35,bearingID+4,10);

difference(){
translate([-35/2+12/2-4,35/2+12/2,0]) cube([20.01,12.01,12.01],center=true);
translate([-35/2+12/2,35/2+12/2,0]) cylinder(r=4,h=20,center=true);
translate([-35/2+12/2-6,35/2+12/2,0]) cube([25,1.01,13.01],center=true);
//translate([-35/2+12/2-10,35/2+12/2+4,0]) rotate([90,0,0]) boltHole(4,length=20,tolerance=tolerance);
translate([-35/2+12/2-10,35/2+12/2+4,0]) rotate([90,0,0]) cylinder(r=2+tolerance,h=50,center=true);
//translate([-35/2+12/2-10,35/2+12/2-4,0]) rotate([90,0,0]) rotate([0,0,30]) nutHole(4,length=20,tolerance=tolerance);
}

translate([0,35/2+drop/2,0]) rotate([90,0,0]) 
difference(){
union(){
cylinder(r=bearingID/2+2,h=drop,center=true);
translate([0,0,1.5]) cube([12,12,12],center=true);}
cylinder(r=2+tolerance,h=drop+1,center=true);
translate([-10,0,-drop/2+5]) nutSlot(20,tolerance);}}}


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