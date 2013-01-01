$fn=100;

plugOD = 24;
plugID = 10;
height = 6;
clipheight = 12;


annulus();
translate([0,0,clipheight/2+2]) clips();


module annulus(){

difference(){
cylinder(r=plugOD/2,h=height,center=true);

difference(){
translate([0,0,4]) cylinder(r=25/2,h=height,center=true);
translate([0,0,4]) cylinder(r=21/2,h=height,center=true);
}
cylinder(r=plugID/2,h=height+0.1,center=true);
}}


module clips(){
difference(){
union(){
cylinder(r=21/2,h=clipheight,center=true);
translate([0,0,clipheight/2-2]) cylinder(r1=23/2,r2=21/2,h=2);
translate([0,0,clipheight/2-4]) cylinder(r1=21/2,r2=23/2,h=2);
}
cylinder(r=18/2,h=clipheight+1, center=true);
cube([4,30,30],center=true);
cube([30,4,30],center=true);
}}


