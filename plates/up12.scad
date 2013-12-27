// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();

plate1();

module plate1() {
	translate([50, 100, 0]) rotate([0, 0, 0]) import("../STLs/carriage.stl");
	for (y = [65, 100]) {
		translate([80, y, 2]) rotate([0, 0, 0]) import("../STLs/carriage_endstop.stl");
		translate([100, y, 4]) rotate([0, 0, 0]) import("../STLs/clipon_endstop.stl");
	}
	translate([130, 120, 0]) rotate([0, 0, 90]) import("../STLs/jhead_mount.stl");
	translate([130, 90, 0]) rotate([0, 0, 0]) import("../STLs/jhead_mount.stl");
}
