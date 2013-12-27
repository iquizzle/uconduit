// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3 - 16]) heatbed();

plate1();

module plate1() {
	for (x = [30, 120]) {
		for (y = [85, 160]) {
		translate([x, y, 0]) rotate([0, 0, 0]) import("../STLs/bottom_vertex.stl");
		}
	}
}
