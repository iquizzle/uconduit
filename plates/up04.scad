// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3 - 8]) heatbed();

plate1();

module plate1() {
	translate([100, 100, 0]) rotate([0, 0, 0]) import("../STLs/compression_flanges_top.stl");
}
