include <ucon_config.scad>
use <MCAD/nuts_and_bolts.scad>
$fn=100;

module fillet(rad,height){

difference(){
translate([0,0,-height/2]) cube([rad-0.05,rad-0.05,height]);
cylinder(h=height+1,r=rad,center=true);
}}

module nutSlot(slot,tolerance,size=4){
union(){
for (i=[0:0.5:slot]){
translate([i,0,0]) nutHole(size,tolerance=tolerance);}}}

module tube(xpos,ypos,zpos,OD,ID,length){
translate([xpos,ypos,zpos])
linear_extrude(height=length)
difference(){
circle(OD/2,center=true);
circle(ID/2,center=true);
}}

module oring(xpos,ypos,zpos){
translate([xpos,ypos,zpos])
rotate_extrude(convexity = 10, $fn = 100) 
translate([oringOD/2-oringthick, 0, 0]) 
// make oring twice as thick as normal, then add half thickness on implementation
// for smooth compression cutouts
circle(r = oringthick, angle=60, $fn = 100);
}

module flangePlate(xpos,ypos,zpos,length,flat=0){
translate([xpos,ypos,zpos])
difference(){

translate([0,0,-length/2])
linear_extrude(height = length)
minkowski(){

union(){
circle(tubeOD/2,center=true);

union(){
translate([(tubeOD+screwOD+wallthick)/2,0,0]) circle(screwOD/2,center=true);
translate([(tubeOD+wallthick/2)/2,0,0]) square([wallthick,screwOD],center=true);}

rotate(120)
union(){
translate([(tubeOD+screwOD+wallthick)/2,0,0]) circle(screwOD/2,center=true);
translate([(tubeOD+wallthick/2)/2,0,0]) square([wallthick,screwOD],center=true);}

rotate(240)
union(){
translate([(tubeOD+screwOD+wallthick)/2,0,0]) circle(screwOD/2,center=true);
translate([(tubeOD+wallthick/2)/2,0,0]) square([wallthick,screwOD],center=true);}

if (flat>0){
translate([-(tubeOD)/2+0.5,0,0]) square([1,2*(tubeOD+3*wallthick+2*screwOD)/(2*sqrt(3))],center=true);}}

circle(wallthick/2);}

cylinder(h=length+clearance,r1=tubeOD/2,r2=tubeOD/2,center=true);

translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=length+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(120)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=length+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(240)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=length+clearance,r1=screwOD/2,r2=screwOD/2,center=true);
}}

module flatFlange1(xpos,ypos,zpos,xdim,ydim,thickness){
translate([xpos,ypos,zpos])
difference(){
cube([xdim,ydim,thickness],center=true);
cylinder(h=thickness+clearance,r=tubeOD/2,center=true);
oring(0,0,thickness/2+oringthick/2);

translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(120)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(240)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);
}}

module quadflatPlate1(xpos,ypos,zpos,xdim,ydim,thickness,closed=false,recessed=false){
translate([xpos,ypos,zpos])
union(){
difference(){
cube([xdim,ydim,thickness],center=true);
cylinder(h=thickness+clearance,r=tubeOD/2,center=true);

rotate(45)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(135)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(225)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(315)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

if (recessed == true){
translate([0,0,-thickness/2+3])
rotate(45)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) boltHole(4,length=30,center=true,tolerance=tolerance);

translate([0,0,-thickness/2+3])
rotate(135)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) boltHole(4,length=30,center=true,tolerance=tolerance);

translate([0,0,-thickness/2+3])
rotate(225)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) boltHole(4,length=30,center=true,tolerance=tolerance);

translate([0,0,-thickness/2+3])
rotate(315)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) boltHole(4,length=30,center=true,tolerance=tolerance);}

}

if (closed == true){
translate([0,0,-thickness/2+2.5]) 
difference(){
cylinder(r=tubeOD/2+0.5,h=5,center=true);
cylinder(r=5,h=5.1,center=true);}}
}}

module quadflatFlange1(xpos,ypos,zpos,xdim,ydim,thickness,closed=false){
translate([xpos,ypos,zpos])
union(){
difference(){
cube([xdim,ydim,thickness],center=true);
cylinder(h=thickness+clearance,r=tubeOD/2,center=true);
oring(0,0,thickness/2+oringthick/2);

rotate(45)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(135)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(225)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);

rotate(315)
translate([(tubeOD+screwOD+wallthick)/2,0,0]) cylinder(h=thickness+clearance,r1=screwOD/2,r2=screwOD/2,center=true);}

if (closed==true){
translate([0,0,-thickness/2+2.5]) 
difference(){
cylinder(r=tubeOD/2+0.5,h=5,center=true);
cylinder(r=6,h=5.1,center=true);}}
}}

module quadflat1CapNut(xpos,ypos,zpos,xdim,ydim,thickness,dist,closed=false,nonsym=false){
translate([xpos,ypos,zpos])
difference(){
if (closed == false) {quadflatFlange1(0,0,0,xdim,ydim,thickness);}
else {quadflatFlange1Closed(0,0,0,xdim,ydim,thickness);}

rotate(45)
translate([(tubeOD+screwOD+wallthick)/2,0,thickness/2-dist]) rotate([0,0,-45]) nutSlot(6,tolerance);

rotate(135)
translate([(tubeOD+screwOD+wallthick)/2,0,thickness/2-dist]) rotate([0,0,45]) nutSlot(6,tolerance);


if (nonsym == true){
rotate(315)
translate([(tubeOD+screwOD+wallthick)/2,0,thickness/2-dist]) rotate([0,0,-45]) nutSlot(6,tolerance);

rotate(225)
translate([(tubeOD+screwOD+wallthick)/2,0,thickness/2-dist]) rotate([0,0,45]) nutSlot(6,tolerance);}


else{
rotate(225)
translate([(tubeOD+screwOD+wallthick)/2,0,thickness/2-dist]) rotate([0,0,-45]) nutSlot(6,tolerance);

rotate(315)
translate([(tubeOD+screwOD+wallthick)/2,0,thickness/2-dist]) rotate([0,0,45]) nutSlot(6,tolerance);}}
}

module flatFlange2(xpos,ypos,zpos,xdim,ydim,thickness){
translate([xpos,ypos,zpos])
difference(){
flatFlange1(0,0,0,xdim,ydim,thickness);
oring(0,0,-thickness/2-oringthick/2);}}

module quadflatFlange2(xpos,ypos,zpos,xdim,ydim,thickness){
translate([xpos,ypos,zpos])
difference(){
quadflatFlange1(0,0,0,xdim,ydim,thickness);
oring(0,0,-thickness/2-oringthick/2);}}

module singleFlange(xpos,ypos,zpos,length,flat=0){
translate([xpos,ypos,zpos])
difference(){
flangePlate(0,0,0,length,flat=flat);
oring(0,0,length/2);
}}

module doubleFlange(xpos,ypos,zpos,length){
translate([xpos,ypos,zpos])
difference(){
singleFlange(0,0,0,length);
translate([0,0,-length/2]) cylinder(h=oringthick, r1=oringOD/2, r2=tubeOD/2,center=true);

}}

module blindFlange(xpos,ypos,zpos,length,backwall){
translate([xpos,ypos,zpos])
union(){
singleFlange(0,0,0,length);
translate([0,0,-length/2+backwall/2]) cylinder(h=backwall,r1=tubeOD/2,r2=tubeOD/2,center=true);
}}

module singleFlangeCap(xpos,ypos,zpos,length){
translate([xpos,ypos,zpos])
difference(){
singleFlange(0,0,0,length);
translate([(tubeOD+screwOD+wallthick)/2,0,-length/2-0.1]) rotate(30) nutHole(4,tolerance=tolerance);
rotate(120)
translate([(tubeOD+screwOD+wallthick)/2,0,-length/2-0.1]) rotate(30) nutHole(4,tolerance=tolerance);
rotate(240)
translate([(tubeOD+screwOD+wallthick)/2,0,-length/2-0.1]) rotate(30) nutHole(4,tolerance=tolerance);
}}

module singleFlangeCapClear(xpos,ypos,zpos,len1,flat=0){
length = len1-5;
translate([xpos,ypos,zpos])
translate([0,0,2.5])
difference(){
union(){
singleFlange(0,0,0,length,flat=flat);
tube(0,0,-length/2-5,tubeOD+wallthick,tubeOD,clearlen+overlap);
}

for (z = [-length/2-5-0.1:0.5:-length/2-0.1]){
translate([(tubeOD+screwOD+wallthick)/2,0,z]) rotate(30) nutHole(4,tolerance=tolerance);}

for (z = [-length/2-5-0.1:0.5:-length/2-0.1]){
rotate(120)
translate([(tubeOD+screwOD+wallthick)/2,0,z]) rotate(30) nutHole(4,tolerance=tolerance);}

for (z = [-length/2-5-0.1:0.5:-length/2-0.1]){
rotate(240)
translate([(tubeOD+screwOD+wallthick)/2,0,z]) rotate(30) nutHole(4,tolerance=tolerance);}
}}

module blindFlangeCap(xpos,ypos,zpos,length,backwall){
translate([xpos,ypos,zpos])
difference(){
blindFlange(0,0,0,length,backwall);

translate([(tubeOD+screwOD+wallthick)/2,0,-length/2-0.1]) rotate(30) nutHole(4,tolerance=tolerance);
rotate(120)
translate([(tubeOD+screwOD+wallthick)/2,0,-length/2-0.1]) rotate(30) nutHole(4,tolerance=tolerance);
rotate(240)
translate([(tubeOD+screwOD+wallthick)/2,0,-length/2-0.1]) rotate(30) nutHole(4,tolerance=tolerance);
}}

module shell90(xpos,ypos,zpos){
translate([xpos,ypos,zpos])
translate([0,0,-overlap/2])
difference(){
rotate([0,90,0]) tube(0,0,0,tubeOD+wallthick,tubeOD,tubeOD/2+wallthick/2);
translate([0,0,-tubeOD/2-wallthick]) tube(0,0,0,tubeOD+wallthick,0,tubeOD+2*wallthick+overlap);
}}

module teeFlange(xpos,ypos,zpos,len1,len2){
translate([xpos,ypos,zpos])
union(){
translate([0,0,(tubeOD+2*wallthick+2*screwOD)/2+len1/2]) rotate([0,0,30]) singleFlangeCapClear(0,0,0,len1);
translate([0,0,-(tubeOD+2*wallthick+2*screwOD)/2-len1/2]) rotate([180,0,0]) rotate([0,0,-30]) singleFlangeCapClear(0,0,0,len1);
tube(0,0,-(tubeOD+2*wallthick+2*screwOD)/2,tubeOD+wallthick,tubeOD,tubeOD+2*wallthick+2*screwOD+10*overlap);
translate([-len2/2-tubeOD/2-wallthick/2,0,0]) rotate([0,-90,0]) rotate([0,0,30]) singleFlangeCapClear(0,0,0,len2);
rotate([0,180,0]) shell90(0,0,0);
}}


//shell90(0,0,0);
//rotate([-90,0,0]) teeFlange(0,0,0,15,15);
//singleFlangeCapClear(0,0,0,10,flat=1);
//singleFlange(0,0,0,5,flat=0);
//lowVertex(0,0,0,15);
//singleFlangeCapClear(0,0,0,15,flat=1);
