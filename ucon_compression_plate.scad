include <ucon_config.scad>
use <ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

difference(){
quadflatPlate1(0,0,0,35,35,6);
oring(0,0,6*0.78);
}