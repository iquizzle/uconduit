include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

/////// Parametric Settings ////////

bowden = 1;
pushfit_dia = 0.339*25.4;
pushfit_h = 0.25*25.4;

filament_hole = 2.25;
filament_slot = 1;

/// Enter pulley diameters HERE
bigP = 37.69;    // large pulley diameter
smallP = 22.4;  // small pulley diameter
belt_len = 94*2;  // for gt2 pulleys #of teeth x 2mm pitch


// Calculate parameters for pulley separation
Aval = (belt_len/2)-0.7855*(bigP+smallP);
Bval = Aval/(bigP-smallP);

///// Calculate the correction factor
///// fit from tabulated data @ http://www.york-ind.com/print_cat/engineering.pdf
corr = 0.001937038323*pow(Bval,10) - 0.05808154202*pow(Bval,9) + 0.761293059*pow(Bval,8) - 5.736122913*pow(Bval,7) + 27.47727309*pow(Bval,6) - 87.33413058*pow(Bval,5) + 186.371874*pow(Bval,4) - 263.6175218*pow(Bval,3) + 236.7515116*pow(Bval,2) - 122.301777*pow(Bval,1) + 28.86267614;

// Calculate the pulley separation distance
Cval = Aval/corr;
motor_maxdist = 34.85;  //ctc dist from motor center to hob center at zero offset
block_offset = Cval - motor_maxdist;
echo(block_offset);

//uncomment this section to see pulleys and bearings
/*translate([5,12,0]) rotate([0,90,0]) large_pulley_w_hob();
translate([1.35,12,0]) rotate([0,90,0]) 608_bearing();
translate([-17,12,0]) rotate([0,90,0]) 608_bearing();
translate([-8,12+22/2+8/2-0.5,0]) rotate([0,90,0]) 608_bearing();
translate([-8,16.5,0]) color("Blue",1) cylinder(r=3.5/2,h=100,center=true);
translate([0,-52+42.3/2,-5]) rotate([0,90,0]) stepper_w_pulley();*/
//translate([6,22,-34]) rotate([90,0,0]) rotate([0,-90,0]) wadeidler();

union(){
difference(){
union(){
extruder_base();

// Position the extruder block
translate([-9,block_offset,0]) rotate([0,0,180]) extruder_block();

// Add mounts for hinge
translate([-8,9+block_offset,11/2-42.3/2-5.5]) cube([12.5,26,8],center=true);
translate([-8,17+block_offset,-17]) rotate([0,90,0]) cylinder(r=10/2,h=12.5,center=true);
translate([-14.20,11+block_offset,11/2-42.3/2-5.5]) rotate([0,0,-90]) fillet(2,8);
translate([-1.825,11+block_offset,11/2-42.3/2-5.5]) rotate([0,0,180]) fillet(2,8);
}

/// Make a hole for the filament 3.5mm wide w/ a little slot room
for (i = [0:0.25:filament_slot]){
translate([-8,block_offset+6.75-i-filament_slot/2,0]) color("Blue",1) cylinder(r=filament_hole/2,h=100,center=true);}

if (bowden == 0){
// Make a hole for the hotend (j-head style)
translate([-8,block_offset+6.75-filament_slot,-20.5]) hotend_w_screws();
}
else{
translate([-8,block_offset+6.75-filament_slot,-32.2+pushfit_h/2]) cylinder(r=pushfit_dia/2,h=pushfit_h,center=true);
//mounting holes
translate([0,-3,-26]) rotate([0,90,0]) cylinder(r=2.05,h=100,center=true);
translate([0,7,-26]) rotate([0,90,0]) cylinder(r=2.05,h=100,center=true);
translate([-15,7,-26]) rotate([0,90,0]) nutSlot(10,0.1);
translate([-15,-3,-26]) rotate([0,90,0]) nutSlot(10,0.1);
}

// Make a hole for the hinge mount
translate([0,block_offset+17,-16.5]) rotate([0,90,0]) cylinder(r=3/2+0.2,h=100,center=true);
}

//Add a solid layer for better prints -- will have to cut hole after
if (bowden == 0){
translate([-8,block_offset+6.75-filament_slot,-20.75]) cylinder(r=(5/16*25.4)+0.25,h=0.25);}
else{
translate([-8,block_offset+6.75-filament_slot,-32.2+pushfit_h-0.05]) cylinder(r=(5/16*25.4)+0.25,h=0.25);
}
}

module extruder_block(){
difference(){
minkowski(){

// Main block
translate([0,0,-4]) cube([20,18,44.3],center=true);

// Contour edges with minkowski
translate([-1,0,0]) rotate([0,90,0]) cylinder(r=2,h=4,center=true);}


// Make slots for the bolts
/*for (i = [-1.5:0.5:4]){
translate([7,8,16+i]) rotate([90,0,0]) cylinder(r=3/2+0.2,h=50,center=true);
}

for (i = [-1.5:0.5:4]){
translate([-9,8,16+i]) rotate([90,0,0]) cylinder(r=3/2+0.2,h=50,center=true);
}*/
translate([-9,8,16]) rotate([90,0,0]) cylinder(r=3/2+0.2,h=50,center=true);
translate([7,8,16]) rotate([90,0,0]) cylinder(r=3/2+0.2,h=50,center=true);
translate([-9,5.5,10+16]) rotate([0,0,90]) rotate([0,90,0]) nutSlot(10,0.1,size=3);
translate([7,5.5,10+16]) rotate([0,0,90]) rotate([0,90,0]) nutSlot(10,0.1,size=3);

// Clear the hobbed bolt
translate([12,-2,0]) rotate([0,90,0]) large_pulley_w_hob();

// Make spots for the 608 bearings that retain hob
translate([11.35,-2,0]) rotate([0,90,0]) 608_bearing();
translate([-13,-2,0]) rotate([0,90,0]) 608_bearing();

// Cut a slot for the 608 bearing that presses on the filament
translate([-1-0.5,-17.75,0]) rotate([0,90,0]) 608_bearing();
translate([-1+0.5,-17.75,0]) rotate([0,90,0]) 608_bearing();

/// Make a hole for the filament
//for (i = [0:0.25:0.75]){
//translate([-1,-6-i,0]) color("Blue",1) cylinder(r=3.5/2,h=100,center=true);}

// Cut some room for the bearing to press against hob
translate([-1,-6,0]) color("Blue",1) cube([8,6,12.5],center=true);

// Clear some unnecessary overhang that won't print well
translate([11.35,-8,12]) cube([7,20,20],center=true);
translate([-13,-8,12]) cube([7,20,20],center=true);
}}

module extruder_base(){
difference(){
minkowski(){
difference(){

translate([-11+6,-15.5+block_offset/2,11/2-42.3/2-7]) cube([24,71+block_offset,15],center=true);
translate([-8,21+block_offset,-19.5]) cube([100,24,10],center=true);}
translate([-5+4,0,0]) rotate([0,90,0]) cylinder(r=2,h=4,center=true);}

// Add a slotted motor mount
for (i = [-2:0.5:1.5]){
translate([0,-52+42.3/2+i,-5]) rotate([0,90,0]) stepper_w_pulley2();
}

}}


module large_pulley_w_hob(){
difference(){
union(){
color("DarkGreen",1) translate([0,0,6]) cylinder(r=37.7/2,h=11.2);
color("DarkGreen",1) translate([0,0,6]) cylinder(r=43.25/2,h=1);
color("DarkGreen",1) translate([0,0,17.2]) cylinder(r=43.25/2,h=1);
color("DarkGreen",1) translate([0,0,0]) cylinder(r=17.5/2,h=6.5);}
cylinder(r=4,h=50,center=true);}
color("Gray",1) translate([0,0,18]) rotate([0,180,0]) boltHole(8,length=60,tolerance=0.5);
}

module hotend_w_screws(){
union(){
translate([0,0,-35]) cylinder(r=5/16*25.4+0.25,h=35);
translate([0,6+3/2-0.25,-4.76-3/2-0.75]) rotate([0,-90,0]) cylinder(r=3/2+0.05,h=50,center=true);
translate([0,-6-3/2+0.25,-4.76-3/2-0.75]) rotate([0,-90,0]) cylinder(r=3/2+0.05,h=50,center=true);
}
}

module fillet(rad,height){
translate([-rad,-rad,0])
difference(){
translate([0,0,-height/2]) cube([rad+0.01,rad+0.01,height]);
cylinder(h=height+1,r=rad,center=true);
}}

module stepper_w_pulley(){
stepper_motor_mount(17);
translate([0,0,5])
union(){
color("DarkGreen",1) translate([0,0,6]) cylinder(r=22.5/2,h=11.2);
color("DarkGreen",1) translate([0,0,6]) cylinder(r=27.5/2,h=1);
color("DarkGreen",1) translate([0,0,17.2]) cylinder(r=27.5/2,h=1);
color("DarkGreen",1) translate([0,0,0]) cylinder(r=17.5/2,h=6.5);}}

module stepper_w_pulley2(){
translate([0,0,-13-6]) cube(42.3,center=true);
translate([0,0,5])
union(){
color("DarkGreen",1) translate([0,0,6]) cylinder(r=28.5/2,h=50,center=true);
color("DarkGreen",1) translate([31/2,31/2,0]) cylinder(r=3/2+0.05,h=50,center=true);
color("DarkGreen",1) translate([-31/2,31/2,0]) cylinder(r=3/2+0.05,h=50,center=true);
color("DarkGreen",1) translate([31/2,-31/2,0]) cylinder(r=3/2+0.05,h=50,center=true);
color("DarkGreen",1) translate([-31/2,-31/2,0]) cylinder(r=3/2+0.05,h=50,center=true);
}}

module 608_bearing(tolerance=0.1){
difference(){
union(){
color("FireBrick",1) cylinder(r=22/2+tolerance,h=7,center=true);
color("FireBrick",1) cylinder(r=13.5/2,h=9,center=true);}

cylinder(r=8/2,h=9+0.1,center=true);}
}
