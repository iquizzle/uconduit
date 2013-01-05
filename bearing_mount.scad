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

bearingPlate();
translate([0,bearingH+4+35/2+drop,0]) rotate([90,0,0]) bottom_clip();

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