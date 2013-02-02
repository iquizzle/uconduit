include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

//////// Select Vertex Style ////////

top = false;    // Set to true if printing top vertex
type =1;        // Set type to 1 or 2

//////////////////////////////////////

//translate([3,0,35]) rotate([0,180,180]) halfvertex(isX=false,top=top);
//translate([0,28,0]) rotate([0,0,180]) halfvertex(isX=true,top=top);
/*if (top == true) translate([5,-15,35/2]) rotate([-90,0,0]) motor_clamps();
else{
translate([-15,40,35/2]) rotate([0,0,0]) quadflatPlate1(0,0,0,35.01,35,15,10);
translate([30,40,35/2]) rotate([0,0,90]) rotate([0,0,0]) quadflatPlate1(0,0,0,35.01,35,15,10);

}*/

//rotate([0,0,0]) translate([0,0,0]) halfvertex(isX=false,top=top);
//translate([-35/2,0,35/2]) rotate([0,90,0]) rotate([0,0,180]) halfvertex(isX=true);
//motor_clamps();
rotate([180,0,0]) halfvertex2(top=false);
translate([52,-38,0]) rotate([0,180,0]) halfvertex2(top=true);
//rotate([0,0,90]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.01,35,10);

module motor_clamps(){
difference(){
union(){
translate([35/2+42/2,35/2-5/2,35+42/2])
rotate([90,0,0])
difference(){
cube([42,42,5],center=true);
slot_motor_mount();}

translate([35/2+15+15/2+2.75,35/2-35/2,35/2]) rotate([0,90,0]) quadflatPlate1(0,0,0,35.01,35,20,10);
translate([0,0,35/2+40+2.75]) quadflatPlate1(0,0,0,35.01,35,20,10);}
translate([35/2+15-0.25,15,35+15/2]) cube([1.01,30,15.1],center=true);
translate([35/2-30/2+42,15,35-30/2+42]) cube([30.1,30,30.1],center=true);
translate([35/2,15,35]) rotate([0,180,0]) rotate([90,0,0]) fillet(4,30);
}}

module halfvertex(isX=false,top=true){
union(){
translate([35/2+15/2,0,35/2]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35+0.01,35+0.01,15,10,nonsym=isX);


if (isX == true){
translate([0,35/4+5/2,35/2]) rotate([90,0,0]) quadflatPlate1(0,0,0,35+0.01,35+0.01,35/2+5,10,closed=top,recessed=false);
}
else{
translate([0,35/4+5/2,35/2]) rotate([90,0,0]) rotate([0,0,90]) quadflat1CapNut(0,0,0,35+0.01,35+0.01,35/2+5,10);}

linear_extrude(height=35) polygon([[17.5,35/2+5],[32.5,17.5],[17.5,17.5]]);
}}

module halfvertex2(isX=true,top=false){
union(){
difference(){
union(){
translate([35/2+15/2,0,0]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35+0.01,35+0.01,15,10);
rotate([0,0,90]) translate([35/2+15/2,0,0]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35+0.01,35+0.01,15,10);}
translate([0,0,-50]) cube([100,100,100],center=true);}
echo(top);
translate([0,0,35/4]) rotate([0,180,0]) quadflatFlange1(0,0,0,35+0.01,35+0.01,35/2,closed=top);

}}

module zmount(key=false,top=true){
translate([0,0,35/2])
union(){
translate([0,0,-35/2]) rotate([-90,90,0]) quadflatFlange1(0,0,0,35,35,35,35/2,closed=top);
translate([0,0,15/2]) rotate([0,0,0]) quadflat1CapNut(0,0,0,35,35,15+0.01,10);
if (key == false) translate([15/2+35/2,0,-35/2]) rotate([0,90,0]) quadflat1CapNut(0,0,0,35,35,15+0.01,10);}}


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
}}

module slot_head(rad,height,slot){
union(){
for (i=[-slot/2:0.5:slot/2]){
	translate([0,i,-0.1]) cylinder(h=height,r=rad,center=true);
}}}