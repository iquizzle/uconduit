include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

$fn=100;


rotate([180,0,0])

translate([-35.5/2,42.3/2,0]) rotate([180,0,0]) quadflatFlange1(0,0,0,35.1,35.1,16,12);
translate([-35.5/2,42.3/2,0]) rotate([0,0,0]) quadflatFlange1(0,0,0,35.1,35.1,16,12);