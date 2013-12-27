// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();

plate1();

module plate1() {
	translate([60, 35, 0]) rotate([0, 0, 0]) import("../STLs/zcoupling.stl");
	translate([110, 35, 0]) rotate([0, 0, 0]) import("../STLs/zcoupling.stl");
	translate([125, 100, 0]) rotate([0, 0, 0]) import("../STLs/zrod_mounts.stl");
}
