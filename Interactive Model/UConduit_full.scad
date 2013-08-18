include <../ucon_config.scad>
use <../ucon_functions.scad>
use <MCAD/motors.scad>
use <MCAD/nuts_and_bolts.scad>

//PLEASE NOTE! This file is for demonstration purposes only. It is not dimensionally exact. Final dimensions will depend on actual designed parts.

//top square
color("green",0.9) translate([-415/2,375/2+35/2,40]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,415);
color("green",0.9) translate([-415/2,-375/2-35/2,40]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,415);
color("navy",0.9) translate([415/2+35/2,375/2,40]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,375);
color("navy",0.9) translate([-415/2-35/2,375/2,40]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,375);

//top square
color("green",0.9) translate([-415/2,375/2+35/2,375]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,415);
color("green",0.9) translate([-415/2,-375/2-35/2,375]) rotate([0,90,0]) tube(0,0,0,tubeOD,tubeID,415);
color("navy",0.9) translate([415/2+35/2,375/2,375]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,375);
color("navy",0.9) translate([-415/2-35/2,375/2,375]) rotate([90,0,0]) tube(0,0,0,tubeOD,tubeID,375);

//vertical conduit
color("navy",0.9) translate([-415/2-35/2,375/2+35/2,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,375);
color("navy",0.9) translate([-415/2-35/2,-375/2-35/2,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,375);
color("navy",0.9) translate([415/2+35/2,375/2+35/2,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,375);
color("navy",0.9) translate([415/2+35/2,-375/2-35/2,0]) rotate([0,0,0]) tube(0,0,0,tubeOD,tubeID,375);

//lower verticies
color("red",0.9) translate([-415/2-35/2,375/2+35/2,40]) import("vertex_open.stl");
color("red",0.9) translate([-415/2-35/2,-375/2-35/2,40]) rotate([0,0,90]) import("vertex_open.stl");
color("red",0.9) translate([415/2+35/2,375/2+35/2,40]) rotate([0,0,-90]) import("vertex_open.stl");
color("red",0.9) translate([415/2+35/2,-375/2-35/2,40]) rotate([0,0,180]) import("vertex_open.stl");

color("orange",0.9) translate([-415/2-35/2,375/2+35/2,40]) rotate([0,0,90]) rotate([0,180,0]) import("vertex_open.stl");
color("orange",0.9) translate([-415/2-35/2,-375/2-35/2,40]) rotate([0,0,180]) rotate([0,180,0]) import("vertex_open.stl");
color("orange",0.9) translate([415/2+35/2,375/2+35/2,40]) rotate([0,180,0]) import("vertex_open.stl");
color("orange",0.9) translate([415/2+35/2,-375/2-35/2,40]) rotate([0,0,-90]) rotate([0,180,0]) import("vertex_open.stl");

//upper verticies
color("red",0.9) translate([-415/2-35/2,375/2+35/2,375]) import("vertex_open.stl");
color("red",0.9) translate([-415/2-35/2,-375/2-35/2,375]) rotate([0,0,90]) import("vertex_open.stl");
color("red",0.9) translate([415/2+35/2,375/2+35/2,375]) rotate([0,0,-90]) import("vertex_open.stl");
color("red",0.9) translate([415/2+35/2,-375/2-35/2,375]) rotate([0,0,180]) import("vertex_open.stl");

color("orange",0.9) translate([-415/2-35/2,375/2+35/2,375]) rotate([0,0,-90]) rotate([0,180,0]) import("vertex_reduced.stl");
color("orange",0.9) translate([-415/2-35/2,-375/2-35/2,375]) rotate([0,180,0]) import("vertex_reduced.stl");
color("orange",0.9) translate([415/2+35/2,375/2+35/2,375]) rotate([0,0,180]) rotate([0,180,0]) import("vertex_reduced.stl");
color("orange",0.9) translate([415/2+35/2,-375/2-35/2,375]) rotate([0,0,90]) rotate([0,180,0]) import("vertex_reduced.stl");

//motor mounts
color("light blue",0.9) translate([-415/2-35,375/2+35/2,375]) rotate([0,0,-90]) import("motor_clamps.stl");
color("light blue",0.9) translate([415/2+35/2,375/2+35,375]) rotate([0,0,180]) import("motor_clamps.stl");
color("light blue",0.9) translate([-415/2-35/2,-375/2-35,375]) rotate([0,0,0]) import("motor_clamps.stl");
color("light blue",0.9) translate([415/2+35,-375/2-35/2,375]) rotate([0,0,90]) import("motor_clamps.stl");

//y rod mounts
color("SteelBlue",0.9) translate([-415/2+35+10,375/2+35/2,375]) rotate([0,-90,0]) rotate([0,0,-90]) import("y_rodmount_A.stl");
color("SteelBlue",0.9) translate([415/2-35-11,375/2+35/2,375]) rotate([0,90,0]) rotate([0,0,90]) import("y_rodmount_B.stl");
color("SteelBlue",0.9) translate([-415/2+35+11,-375/2-35/2,375]) rotate([0,-90,0]) rotate([0,0,-90]) import("y_rodmount_B.stl");
color("SteelBlue",0.9) translate([415/2-35-10,-375/2-35/2,375]) rotate([0,90,0]) rotate([0,0,90]) import("y_rodmount_A.stl");

//bottom compression
color("LightCyan",0.9) translate([-415/2+35/2+4,375/2+35/2,40]) rotate([0,-90,0]) rotate([0,0,-90]) import("16mm_compression(bottom).stl");
color("LightCyan",0.9) translate([415/2-35/2-4,375/2+35/2,40]) rotate([0,90,0]) rotate([0,0,-90]) import("16mm_compression(bottom).stl");
color("LightCyan",0.9) translate([-415/2+35/2+4,-375/2-35/2,40]) rotate([0,-90,0]) rotate([0,0,-90]) import("16mm_compression(bottom).stl");
color("LightCyan",0.9) translate([415/2-35/2-4,-375/2-35/2,40]) rotate([0,90,0]) rotate([0,0,-90]) import("16mm_compression(bottom).stl");

color("LightCyan",0.9) translate([-415/2-35/2,-375/2+35/2+4,40]) rotate([90,0,0]) import("16mm_compression(bottom).stl");
color("LightCyan",0.9) translate([-415/2-35/2,375/2-35/2-4,40]) rotate([-90,0,0]) import("16mm_compression(bottom).stl");
color("LightCyan",0.9) translate([415/2+35/2,-375/2+35/2+4,40]) rotate([90,0,0]) import("16mm_compression(bottom).stl");
color("LightCyan",0.9) translate([415/2+35/2,375/2-35/2-4,40]) rotate([-90,0,0]) import("16mm_compression(bottom).stl");

//top compression
color("LightCyan",0.9) translate([-415/2-35/2,-375/2+35+8,375]) rotate([90,0,0]) import("16mm_compression(top).stl");
color("LightCyan",0.9) translate([-415/2-35/2,375/2-35-8,375]) rotate([-90,0,0]) import("16mm_compression(top).stl");
color("LightCyan",0.9) translate([415/2+35/2,-375/2+35+8,375]) rotate([90,0,0]) import("16mm_compression(top).stl");
color("LightCyan",0.9) translate([415/2+35/2,375/2-35-8,375]) rotate([-90,0,0]) import("16mm_compression(top).stl");

//z compression
color("LimeGreen",0.9) translate([415/2+35/2,-375/2-35/2,375-35/2-5]) rotate([0,0,0]) import("z_rodmount_A.stl");
color("LimeGreen",0.9) translate([-415/2-35/2,375/2+35/2,375-35/2-5]) rotate([0,0,180]) import("z_rodmount_A.stl");
color("LimeGreen",0.9) translate([415/2+35/2,-375/2-35/2,40+35/2+5]) rotate([0,0,95]) rotate([180,0,0]) import("z_rodmount_B.stl");
color("LimeGreen",0.9) translate([-415/2-35/2,375/2+35/2,40+35/2+5]) rotate([0,0,-85]) rotate([180,0,0]) import("z_rodmount_B.stl");

color("LimeGreen",0.9) translate([415/2+35/2,375/2+35/2,375-35/2-5]) rotate([0,0,0]) import("10mm_compression(z).stl");
color("LimeGreen",0.9) translate([-415/2-35/2,-375/2-35/2,375-35/2-5]) rotate([0,0,180]) import("10mm_compression(z).stl");
color("LimeGreen",0.9) translate([415/2+35/2,375/2+35/2,40+35/2+5]) rotate([180,0,0]) import("10mm_compression(z).stl");
color("LimeGreen",0.9) translate([-415/2-35/2,-375/2-35/2,40+35/2+5]) rotate([180,0,0]) import("10mm_compression(z).stl");

// y rods
color("Silver",0.9) translate([-415/2+42,-375/2+31,375]) rotate([0,90,0]) cylinder(r=4,h=330);
color("Silver",0.9) translate([-415/2+42,375/2-31,375]) rotate([0,90,0]) cylinder(r=4,h=330);

// x rods
color("Silver",0.9) translate([0,375/2-20,375-16]) rotate([90,0,0]) cylinder(r=4,h=330);
color("Silver",0.9) translate([0,375/2-20,375-36]) rotate([90,0,0]) cylinder(r=4,h=330);

// z rods
color("Silver",0.9) translate([-415/2+5,375/2-5,25]) rotate([0,0,0]) cylinder(r=4,h=330);
color("Silver",0.9) translate([415/2-5,-375/2+5,20]) rotate([0,0,0]) cylinder(r=4,h=330);

// z acme
color("DimGrey",0.9) translate([-415/2+42.3/2,375/2-42.3/2,35]) rotate([0,0,0]) cylinder(r=(25.4*0.375)/2,h=298);
color("DimGrey",0.9) translate([415/2-42.3/2,-375/2+42.3/2,35]) rotate([0,0,0]) cylinder(r=(25.4*0.375)/2,h=298);

// zends
color("MidnightBlue",0.9) translate([-415/2-3,375/2+3,149]) rotate([0,0,-45]) import("z_end_bearing.stl");
color("MidnightBlue",0.9) translate([415/2+3,-375/2-3,149]) rotate([0,0,135]) import("z_end_bearing.stl");
color("MidnightBlue",0.9) translate([-415/2-3,375/2+3,157]) rotate([0,0,-45]) rotate([180,0,0]) import("z_end_bearing.stl");
color("MidnightBlue",0.9) translate([415/2+3,-375/2-3,157]) rotate([0,0,135]) rotate([180,0,0])  import("z_end_bearing.stl");
color("DarkCyan",0.9) translate([-415/2+27,375/2-27,160]) rotate([0,0,45]) rotate([180,0,0]) import("z_end_body.stl");
color("DarkCyan",0.9) translate([415/2-27,-375/2+27,160]) rotate([0,0,-135]) rotate([180,0,0])  import("z_end_body.stl");
color("Tomato",0.9) translate([-415/2+27,375/2-27,147]) rotate([0,0,-135]) rotate([0,0,0]) import("z_end_clamp.stl");
color("Tomato",0.9) translate([415/2-27,-375/2+27,147]) rotate([0,0,45]) rotate([0,0,0])  import("z_end_clamp.stl");

// zcouplers
color("DeepPink",0.9) translate([-415/2+42.3/2,375/2-42.3/2+6.5,375-54]) rotate([90,0,0]) import("zcoupling_half.stl");
color("DeepPink",0.9) translate([415/2-42.3/2,-375/2+42.3/2+6.5,375-54]) rotate([90,0,0]) import("zcoupling_half.stl");
color("MediumVioletRed",0.9) translate([-415/2+42.3/2,375/2-42.3/2-6.5,375-54]) rotate([0,0,180]) rotate([90,0,0]) import("zcoupling_half.stl");
color("MediumVioletRed",0.9) translate([415/2-42.3/2,-375/2+42.3/2-6.5,375-54]) rotate([0,0,180]) rotate([90,0,0]) import("zcoupling_half.stl");

//motors
translate([-415/2+42.3/2,375/2-42.3/2,375-13]) rotate([0,180,0]) stepper_motor_mount(17);
translate([-415/2+42.3/2,-375/2+42.3/2,375-13]) rotate([0,180,0]) stepper_motor_mount(17);
translate([415/2-42.3/2,375/2-42.3/2,375-13]) rotate([0,180,0]) stepper_motor_mount(17);
translate([415/2-42.3/2,-375/2+42.3/2,375-13]) rotate([0,180,0]) stepper_motor_mount(17);

//idlers
color("DarkSlateGray",0.9) translate([-415/2+42.3+3,375/2-42.3/2,375-33]) rotate([0,0,0]) import("idler.stl");
color("DarkSlateGray",0.9) translate([415/2-42.3-3,-375/2+42.3/2,375-33]) rotate([0,0,0]) import("idler.stl");

// xends
color("Black",0.9) translate([-22.5,-375/2+21,375]) rotate([0,90,0]) import("xend_bearing.stl");
color("Black",0.9) translate([22.5,-375/2+21,375]) rotate([0,-90,0]) import("xend_bearing.stl");
color("Indigo",0.9) translate([0,-375/2+44,375-1]) rotate([-90,0,0]) rotate([0,180,0]) import("xend_body.stl");

rotate([0,0,180]) color("Black",0.9) translate([-22.5,-375/2+21,375]) rotate([0,90,0]) import("xend_bearing.stl");
rotate([0,0,180]) color("Black",0.9) translate([22.5,-375/2+21,375]) rotate([0,-90,0]) import("xend_bearing.stl");
rotate([0,0,180]) color("Indigo",0.9) translate([0,-375/2+44,375-1]) rotate([-90,0,0]) rotate([0,180,0]) import("xend_body.stl");

//carriage & jhead mount
color("Fuchsia",0.9) translate([0,0,375-25]) rotate([-90,0,0]) rotate([0,180,0]) import("carriage.stl");
color("SlateBlue",0.9) translate([-13.5,-7.5,375-37]) rotate([0,-90,0]) rotate([0,0,90])  import("jhead_mount.stl");

