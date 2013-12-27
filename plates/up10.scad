// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();

plate1();

module plate1() {
	translate([70, 85, 0]) rotate([0, 0, 235]) import("../STLs/z_ends.stl");
	translate([125, 118, 0]) rotate([0, 0, 45]) import("../STLs/z_ends.stl");
}
