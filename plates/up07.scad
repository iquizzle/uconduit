// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3 - 6]) heatbed();

plate1();

module plate1() {
	translate([90, 75, 0]) rotate([0, 0, 0]) import("../STLs/xend.stl");
	translate([135, 135, 0]) rotate([0, 0, 180]) import("../STLs/xend.stl");
	translate([50, 125, -6]) rotate([0, 0, 180]) import("../STLs/spool_holder.stl");
}
