include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

difference(){
union(){
linear_extrude(height=12)
difference(){
minkowski(){
union(){
translate([0,-2,0]) square([1.41*(35/2)+1.41*(42.3/2),4]);
circle(r=23.6/2);
translate([1.41*(35/2)+1.41*(42.3/2),0,0]) circle(r=(3/8*25.4)/2+0.2);
square([3,45],center=true);
}
circle(r=4);}

/*rotate(0)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) circle(r=7/2,center=true);

rotate(90)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) circle(r=7/2,center=true);

rotate(180)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) circle(r=7/2,center=true);

rotate(270)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) circle(r=7/2,center=true);*/

circle(r=23.6/2);
translate([1.41*(35/2)+1.41*(42.3/2),0,0]) circle(r=(3/8*25.4)/2+0.1);
}
translate([(tubeOD+screwOD+wallthick)/2,0,14]) cylinder(r=11/2,h=5,center=true);}
translate([(tubeOD+screwOD+wallthick)/2,0,14]) cylinder(r=7/2,h=5.01,center=true);
translate([-0.5,0,12/2]) cube([1,60,13],center=true);
translate([0,20,6]) rotate([0,90,0]) cylinder(r=2.05,h=20,center=true);
translate([0,-20,6]) rotate([0,90,0]) cylinder(r=2.05,h=20,center=true);
}
