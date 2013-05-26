/*
*   CAD file for the UConduit crowned idler pulley. Derived from
*    http://www.thingiverse.com/thing:14117 by DaleDunn
*    and http://www.thingiverse.com/thing:34968 by johnr
*
*  Creative Commons Share Alike 3.0
*  Copyright (c) 2013 David Lee Miller
* 
*/

$fn = 200;

crownRadius = 14;
pulleyHeight = 7;
bearingSize = 22;
innerHole = 9;

//crowned_pulley();
spacer(18);
//translate([0,30,0]) crowned_pulley();
//translate([0,30,0]) spacer(5);

module crowned_pulley(){
 difference() {
   intersection() {
     cylinder(r = crownRadius, h = pulleyHeight);
     sphere(r=crownRadius);
   }
   translate([0, 0, 1]) cylinder(r = bearingSize/2, h = pulleyHeight);
   translate([0, 0, -1]) cylinder(r = innerHole, h = pulleyHeight + 2);
 }
}

module spacer(height){
 difference(){
  union(){
   cylinder(r=6,h=2);
   cylinder(r=4,h=height);
  }
  translate([0,0,-0.1]) cylinder(r=2.2,h=height+1);
 }
}