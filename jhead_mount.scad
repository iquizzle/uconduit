include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

rod_spacing = 20;
bushingOD = 15;
bushingL = 15.3;
screw_sep = bushingOD/2+rod_spacing/2+3;
base_h = 7;
pushfit_dia = 0.35*25.4;

hotendsep = 11.65;
belt_h = 1.75;
belt_w = 6.5;

difference(){

union(){
translate([-bushingL/2,-32/2-2,0]) cube([bushingL,32,3]);  //base
translate([-bushingL/2-3,-3-16.5,0]) cube([bushingL+6,23,(5/8)*25.4+base_h]);  //groove mount
translate([0,-4.5/2+1.5,base_h+(5/16)*25.4+6+3/2+0.25]) rotate([0,-90,0]) cylinder(r=8/2+0.05,h=bushingL+6,center=true);
//translate([0,-2.5,0]) belt_clip();
translate([0,-22.5,4]) cube([bushingL+6,8,8],center=true);
}

translate([0,-2.5,4]) rotate([0,90,0]) cylinder(r=2+0.05,h=100,center=true);
translate([0,-22.5,4]) rotate([0,90,0]) cylinder(r=2+0.05,h=100,center=true);

//middle M4 screw holes
translate([-bushingL/2+3.5,8,0]) rotate([0,0,0]) cylinder(r=2+0.05,h=30,center=true);
translate([bushingL/2-3.5,8,0]) rotate([0,0,0]) cylinder(r=2+0.05,h=30,center=true);

//bottom M4 screw holes
translate([-bushingL/2+3.5,8-screw_sep,14]) rotate([0,0,0]) cylinder(r=3.75/2+0.05,h=30,center=true);
for ( pp = [0 : 0.25 : 8] ){
translate([-bushingL/2+3.5-pp,8-screw_sep,5.5]) rotate([0,180,0]) boltHole(4,length=10,tolerance=0.1);
translate([-bushingL/2+3.5-pp,8-screw_sep,4]) rotate([0,180,0]) boltHole(4,length=10,tolerance=0.1);}

translate([bushingL/2-3.5,8-screw_sep,14]) rotate([0,0,0]) cylinder(r=3.75/2+0.05,h=30,center=true);
for ( pp = [0 : 0.25 : 8] ){
translate([bushingL/2-3.5+pp,8-screw_sep,5.5]) rotate([0,180,0]) boltHole(4,length=10,tolerance=0.1);
translate([bushingL/2-3.5+pp,8-screw_sep,4]) rotate([0,180,0]) boltHole(4,length=10,tolerance=0.1);}

//jhead mounting groove
for ( i = [0 : 0.4 : 10] ){
if (i==0){
translate([0,1.5,base_h+(5/16)*25.4+0.5+i]) rotate([90,0,0]) hotend_w_fil(1.75,tol=0.1,fil=1);}
else{
translate([0,1.5,base_h+(5/16)*25.4+0.5+i]) rotate([90,0,0]) hotend_w_fil(1.75,tol=0.1,fil=0);}
}

translate([0,-4.5/2+1.5,base_h+(5/16)*25.4+6+3/2+0.25]) rotate([0,-90,0]) cylinder(r=3/2+0.05,h=50,center=true);

}

//translate([0,0,base_h+(5/16)*25.4+0.5]) rotate([90,0,0]) hotend_w_fil();



module hotend_w_fil(filamentD,tol=0.1,fil=0){
union(){
translate([0,0,4.5-0.01]) cylinder(r=5/16*25.4+0.05,h=5.5);
translate([0,5/16*25.4/2,7.75-0.01]) cube([3,5/16*25.4,6.5],center=true);
translate([0,0,0]) cylinder(r=12/2+0.025,h=4.64);
translate([0,0,-10+0.01]) cylinder(r=5/16*25.4+0.05,h=10);
if (fil == 1){
cylinder(r=pushfit_dia/2+tol,h=100);}
}
}

module belt_clip(){
translate([0,0,3])
difference(){cube([36,12,6],center=true);
//cube([24,12,8],center=true);
//translate([bushingL/2-3.5,0,0]) rotate([0,0,0]) cylinder(r=2+0.05,h=30,center=true);
//translate([-bushingL/2+3.5,0,0]) rotate([0,0,0]) cylinder(r=2+0.05,h=30,center=true);
translate([2+hotendsep/2+7,0,0]) rotate([0,0,0]) cube([belt_h,belt_w,30],center=true);
translate([-(2+hotendsep/2+7),0,0]) rotate([0,0,0]) cube([belt_h,belt_w,30],center=true);}
}