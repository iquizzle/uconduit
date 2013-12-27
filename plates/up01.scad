// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();

plate1();

module plate1() {
	translate([65, 95, 8 / 2]) rotate([0, 0, 0]) import("../STLs/belt_clip.stl");
	for (x = [90, 130]) {
		for (y = [75, 110]) {
			translate([x, y, 0]) rotate([0, 0, 0]) import("../STLs/bottom_plugs.stl");
		}
	}
	translate([50, 145, 0]) rotate([0, 0, 0]) import("../STLs/idlers.stl");
	translate([120, 145, 0]) rotate([0, 0, 0]) import("../STLs/idlers.stl");
}
