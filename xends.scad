include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;


width = 12;
drop = 15;
tolerance = 0.05;
bearingOD = 22;
bearingID = 8;
bearingH = 7;



//difference(){
//color("Blue",0.9) cylinder(r=tubeOD/2,h=100,center=true);
//color("Blue",0.9) cylinder(r=tubeID/2,h=101,center=true);}
//color("DarkGreen") translate([-35/2+12/2,35/2+12/2,0]) cylinder(r=4,h=100,center=true);
//color("OrangeRed") translate([-35/2+12/2,35/2+12/2,10.5]) cylinder(r=8,h=10.5,center=true);
//bearingPlate();
//translate([0,bearingH+4+35/2+drop,0]) rotate([90,0,0]) bottom_clip();

xend();

difference(){
union(){
cylinder(r=6,h=3,center=false);
cylinder(r=4,h=11,center=false);}
cylinder(r=2,h=40,center=true);}

module xend(){

difference(){
union(){
cross_section(16,10);
translate([8+12/2,0,0]) cube([12,8,10],center=true);}
translate([16,0,0]) rotate([90,0,0]) cylinder(r=2,h=100,center=true);
translate([12,0,0]) cube([24,1,20],center=true);
translate([0,15,-10/2]) rotate([0,90,0]) cylinder(r=4,h=50,center=true);
translate([0,35,-10/2]) rotate([0,90,0]) cylinder(r=4,h=50,center=true);
translate([0,25,2.5]) rotate([0,180,0]) boltHole(4,length=30);
translate([0,25,2.5]) rotate([0,180,0]) cylinder(r=2,h=100,center=true);
}

translate([0,25+2+11/2,bearingOD/4+3/2+5-0.01])
difference(){
rotate([0,0,180]) 
union(){
cube([12,4,bearingOD/2+3],center=true);
translate([0,-2,-bearingOD/2+3-0.01]) rotate([0,90,0]) fillet(6,12);}
translate([0,0,1.5]) rotate([90,0,0]) cylinder(r=2,h=10,center=true);}

translate([0,25-2-11/2,bearingOD/4+3/2+5-0.01])
difference(){
union(){
cube([12,4,bearingOD/2+3],center=true);
translate([0,-2,-bearingOD/2+3]) rotate([0,90,0]) fillet(6,12);}
translate([0,0,1.5]) rotate([90,0,0]) cylinder(r=2,h=10,center=true);}}

module cross_section(ID,thickness,minkwid=4.5)
difference(){
minkowski(){
union(){
translate([0,0,0]) cylinder(r=ID/2,h=thickness/2,center=true);
translate([0,20,0]) cube([10,40,thickness/2],center=true);}
cylinder(r=minkwid,h=thickness/2,center=true);
}
translate([0,0,0]) cylinder(r=ID/2,h=100.5,center=true);}

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