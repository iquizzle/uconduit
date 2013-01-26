include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

/////// Parametric Calculation ////////

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

echo(Aval);
echo(Bval);
echo(Cval);
echo(corr);
motor_maxdist = 34.85;  //ctc dist from motor center to hob center at zero offset
block_offset = Cval - motor_maxdist;
echo(block_offset);

/////////////////////idler params//////////////////

variant=0; //0 for metric
//variant=1; //1 for SAE
if(variant==0){
echo("variant: metric");
}else if(variant==1){
echo("variant: sae");
} else{
echo("WARNING: INVALID CONFIGURATION");
}

vars=[
//[m8_dia, m8_nut, m4_dia, m4_nut, m3_dia, m3_nut, bush_dia, mot_shaft, bush_rod, bush_outerdia, bush_length]
[9,16.4,5,9,4.4,7,11,5.3,8,16,11],//metric
[9,15.7,5.5,10.6,5.5,10.6,11.5,5.3,7.9375,16,11]//SAE
];

//DO NOT TOUCH THIS SECTION!
m8_diameter = vars[variant][0];
m8_nut_diameter = vars[variant][1];
m4_diameter = vars[variant][2];
m4_nut_diameter = vars[variant][3];
m3_diameter = vars[variant][4];
m3_nut_diameter = vars[variant][5];
bushing_diameter = vars[variant][6];
motor_shaft=vars[variant][7];
bushing_rodsize = vars[variant][8];
bushing_outerDiameter = vars[variant][9];
bushing_lenght = vars[variant][10];

base_thickness=7;
base_length=70;
base_leadout=25;

nema17_hole_spacing=1.2*25.4; 
nema17_width=1.7*25.4;
nema17_support_d=nema17_width-nema17_hole_spacing;

screw_head_recess_diameter=7.2;
screw_head_recess_depth=3;

motor_mount_rotation=25;
motor_mount_translation=[50.5,34,0];
motor_mount_thickness=12;

m8_clearance_hole=8.8;
hole_for_608=22.6;
608_diameter=22;
echo(608_diameter);

layer_thickness=0.4;
filament_feed_hole_d=4;
filament_diameter=3;
filament_feed_hole_offset=filament_diameter+0.5;
idler_nut_trap_depth=7.5;
idler_nut_thickness=3;

wade_block_height=55;
wade_block_width=24;
wade_block_depth=28;

gear_separation=7.4444+32.0111+0.25;

filament_pinch=[
	motor_mount_translation[0]-gear_separation-filament_feed_hole_offset-filament_diameter/2,
	motor_mount_translation[1],
	wade_block_depth/2];
idler_axis=filament_pinch-[608_diameter/2,0,0];
idler_fulcrum_offset=608_diameter/2+3.5+m3_diameter/2;
idler_fulcrum=idler_axis-[0,idler_fulcrum_offset,0];
idler_corners_radius=4; 
idler_height=12;
idler_608_diameter=608_diameter+2;
idler_608_height=9;
idler_mounting_hole_across=8;
idler_mounting_hole_up=15;
idler_short_side=wade_block_depth-2;
idler_hinge_r=m3_diameter/2+3.5;
idler_hinge_width=6.5;
idler_end_length=(idler_height-2)+5;
idler_mounting_hole_diameter=m3_diameter+0.25;
idler_mounting_hole_elongation=1;
idler_long_top=idler_mounting_hole_up+idler_mounting_hole_diameter/2+idler_mounting_hole_elongation+2.5;
idler_long_bottom=idler_fulcrum_offset;
idler_long_side=idler_long_top+idler_long_bottom;

////////////////////////////////////////////////////


/*translate([5,12,0]) rotate([0,90,0]) large_pulley_w_hob();
translate([1.35,12,0]) rotate([0,90,0]) 608_bearing();
translate([-17,12,0]) rotate([0,90,0]) 608_bearing();
translate([-8,12+22/2+8/2-0.5,0]) rotate([0,90,0]) 608_bearing();
translate([-8,16.5,0]) color("Blue",1) cylinder(r=3.5/2,h=100,center=true);
translate([0,-52+42.3/2,-5]) rotate([0,90,0]) stepper_w_pulley();
translate([6,22,-34]) rotate([90,0,0]) rotate([0,-90,0]) wadeidler();*/

//translate([30,-8,0]) cube([1,90,1],center=true);

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
for (i = [0:0.25:1.25]){
translate([-8,block_offset+6.75-i,0]) color("Blue",1) cylinder(r=3.5/2,h=100,center=true);}

// Make a hole for the hotend (j-head style)
translate([-8,block_offset+6.75,-20.5]) hotend_w_screws();

// Make a hole for the hinge mount
translate([0,block_offset+17,-16.5]) rotate([0,90,0]) cylinder(r=3/2+0.2,h=100,center=true);
}

//Add a solid layer for better prints -- will have to cut hole after
translate([-8,block_offset+6.75,-20.75]) cylinder(r=(5/16*25.4)+0.25,h=0.25);}

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


module wadeidler() 
{
	difference()
	{
		union()
		{
			//The idler block.
			translate(idler_axis+[-idler_height/2+2,+idler_long_side/2-idler_long_bottom,0])
			cube([idler_height,idler_long_side,idler_short_side],center=true);

			// The fulcrum Hinge
			translate(idler_fulcrum)
			rotate([0,0,-30])
			{
				cylinder(h=idler_short_side,r=idler_hinge_r,center=true,$fn=60);
				translate([-idler_end_length/2,0,0])
				cube([idler_end_length,idler_hinge_r*2,idler_short_side],center=true);
			}		
		}
	
		//Back of idler.
		translate(idler_axis+[-idler_height/2+2-idler_height,
			idler_long_side/2-idler_long_bottom-10,0])
		cube([idler_height,idler_long_side,idler_short_side],center=true);

		//Slot for idler fulcrum mount.
		translate(idler_fulcrum)
		{
			cylinder(h=idler_short_side-2*idler_hinge_width,
				r=idler_hinge_r+0.5,center=true,$fn=60);
			rotate(-30)
			translate([0,-idler_hinge_r-0.5,0])
			cube([idler_hinge_r*2+1,idler_hinge_r*2+1,
				idler_short_side-2*idler_hinge_width],center=true);
		}

		//Bearing cutout.
		translate(idler_axis)
		{
			difference()
			{
				cylinder(h=idler_608_height,r=idler_608_diameter/2,
					center=true,$fn=60);
				for (i=[0,1])
				rotate([180*i,0,0])
				translate([0,0,6.9/2])
				cylinder(r1=12/2,r2=16/2,h=2);
			}
			cylinder(h=idler_short_side-6,r=m8_diameter/2-0.25/*Tight*/,
				center=true,$fn=20);
		}

		//Fulcrum hole.
		translate(idler_fulcrum)
		rotate(360/12)
		cylinder(h=idler_short_side+2,r=m3_diameter/2-0.1,center=true,$fn=8);

		//Nut trap for fulcrum screw.
		translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1])
		rotate(360/16)
		cylinder(h=3,r=m3_nut_diameter/2,$fn=6);

		for(idler_screw_hole=[-1,1])
		translate(idler_axis+[2-idler_height,0,0])
		{
			//Screw Holes.
			translate([-1,idler_mounting_hole_up,
				idler_screw_hole*idler_mounting_hole_across])
			rotate([0,90,0])
			{
				cylinder(r=idler_mounting_hole_diameter/2,h=idler_height+2,$fn=16);
				translate([0,idler_mounting_hole_elongation,0])
				cylinder(r=idler_mounting_hole_diameter/2,h=idler_height+2,$fn=16);
				translate([-idler_mounting_hole_diameter/2,0,0])
				cube([idler_mounting_hole_diameter,idler_mounting_hole_elongation,
					idler_height+2]);
			}

			// Rounded corners.
			render()
			translate([idler_height/2,idler_long_top,
				idler_screw_hole*(idler_short_side/2)])
			difference()
			{
				translate([0,-idler_corners_radius/2+0.5,-idler_screw_hole*(idler_corners_radius/2-0.5)])
				cube([idler_height+2,idler_corners_radius+1,idler_corners_radius+1],
					center=true);
				rotate([0,90,0])
				translate([idler_screw_hole*idler_corners_radius,-idler_corners_radius,0])
				cylinder(h=idler_height+4,r=idler_corners_radius,center=true,$fn=40);
			}
		}
	}
}