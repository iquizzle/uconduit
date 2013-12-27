// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;

$fn=50;

% translate([0, 0, -3 - 18]) heatbed();

plate1();

module plate1() {
	translate([90, 75, 0]) rotate([0, 0, 0]) import("../STLs/motor_clamps.stl");
}
