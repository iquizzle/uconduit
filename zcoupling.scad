use <MCAD/nuts_and_bolts.scad>;

$fn = 100;

smallOD = 5.4;
smallH = 20;
largeOD = 3/8*25.4;
largeH = 15;
wall = 4;
translate([25,0,0]) zcoup(1);
zcoup(2);

module zcoup(half){
rotate([-90,0,0])
difference(){
hull(){
translate([0,0,35/2]) cube([14,14,largeH+smallH],center=true);
translate([0,0,largeH/2]) cube([19,14,largeH-5],center=true);}
translate([0,0,largeH]) cylinder(r=smallOD/2,h=smallH+0.01);
translate([0,0,-0.01]) cylinder(r=largeOD/2,h=largeH+0.02);
translate([largeOD/2+1.75,0,largeH/3]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=100,center=true);
translate([-(largeOD/2+1.75),0,largeH/3]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=100,center=true);
translate([smallOD/2+1.75,0,largeH+smallH/2]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=100,center=true);
translate([-(smallOD/2+1.75),0,largeH+smallH/2]) rotate([90,0,0]) cylinder(r=3/2+0.05,h=100,center=true);

/*if(half==1)
{
translate([largeOD/2+1.75,16/2+0.1,largeH/3]) rotate([0,30,0]) rotate([90,0,0]) nutHole(3,0.1);
translate([-(largeOD/2+1.75),16/2+0.1,largeH/3]) rotate([0,30,0]) rotate([90,0,0]) nutHole(3,0.1);
translate([smallOD/2+1.75,16/2+0.1,largeH+smallH/2]) rotate([0,30,0]) rotate([90,0,0]) nutHole(3,0.1);
translate([-(smallOD/2+1.75),16/2+0.1,largeH+smallH/2]) rotate([0,30,0]) rotate([90,0,0]) nutHole(3,0.1);
}
else
{
translate([largeOD/2+1.75,16/2-1.5,largeH/3]) rotate([90,0,0]) boltHole(3,0.1);
translate([-(largeOD/2+1.75),16/2-1.5,largeH/3]) rotate([90,0,0]) boltHole(3,0.1);
translate([smallOD/2+1.75,16/2-1.5,largeH+smallH/2]) rotate([90,0,0]) boltHole(3,0.1);
translate([-(smallOD/2+1.75),16/2-1.5,largeH+smallH/2]) rotate([90,0,0]) boltHole(3,0.1);
}*/
translate([0,-25+0.5,25-0.1]) cube(50,center=true);
}}
