// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3 - 16]) heatbed();

plate1();

module plate1() {
	translate([120, 80, 0]) rotate([0, 0, 0]) import("../STLs/yrod_mounts.stl");
}
