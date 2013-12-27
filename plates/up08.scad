// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();

translate([0, 0, 16]) plate1();

module plate1() {
		translate([40, 75, 0]) rotate([0, 0, 0]) import("../STLs/top_vertex.stl");
		translate([95, 105, 0]) rotate([0, 0, 0]) import("../STLs/top_vertex.stl");
		translate([110, 160, 0]) rotate([0, 0, 0]) import("../STLs/top_vertex.stl");
		translate([35, 115, 0]) rotate([0, 0, 90]) import("../STLs/top_vertex.stl");
}
