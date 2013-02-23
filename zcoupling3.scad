use <MCAD/nuts_and_bolts.scad>;

$fn = 100;

smallOD = 5.4;
smallH = 20-2;
largeOD = 3/8*25.4;
largeH = 15-2;
wall = 4;
translate([25,0,0]) zcoup(1);
zcoup(2);

module zcoup(half){
difference(){
linear_extrude(height=6.5)
difference(){
minkowski(){
union(){
translate([-smallOD/2,largeH-0.01,0]) square([smallOD,smallH]);
translate([-largeOD/2,0,0]) square([largeOD,largeH]);
translate([-smallOD/2-3/2-0.5,largeH+3*smallH/4,0]) circle(r=3/2+0.55);
translate([smallOD/2+3/2+0.5,largeH+3*smallH/4,0]) circle(r=3/2+0.55);
translate([-largeOD/2-3/2-0.5,largeH/4,0]) circle(r=3/2+0.55);
translate([largeOD/2+3/2+0.5,largeH/4,0]) circle(r=3/2+0.55);
}
circle(r=2);}
translate([-smallOD/2-3/2-0.5,largeH+3*smallH/4,0]) circle(r=3/2+0.05);
translate([smallOD/2+3/2+0.5,largeH+3*smallH/4,0]) circle(r=3/2+0.05);
translate([-largeOD/2-3/2-0.5,largeH/4,0]) circle(r=3/2+0.05);
translate([largeOD/2+3/2+0.5,largeH/4,0]) circle(r=3/2+0.05);}
translate([0,largeH+smallH/2+2,6.5+0.5]) rotate([-90,0,0]) cylinder(r=smallOD/2,h=smallH,center=true);
translate([0,largeH/2-2,6.5+0.5]) rotate([-90,0,0]) cylinder(r=largeOD/2,h=smallH,center=true);
}}
