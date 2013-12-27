// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

$fn=50;
height = 200;
width = 200;
depth = 3;

heatbed(height, width, depth);

module heatbed(h = height, w = width, t = depth) {
	color([255, 0, 0]) cube([h, w, t]);
}
