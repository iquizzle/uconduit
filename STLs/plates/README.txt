UConduit 3D Printer
Plates Readme
----------------------------------------
This list is the plastic parts bill of materials for the UConduit 3D Printer.  Print all of these STL files to build a complete machine.

Bill of Materials (BOM)
-----------------------
plate #		| contents
1 (pla)		| 1x belt_clip; 4x bottom_plugs; 1x idlers
2 (pla)		| 4x bottom_vertex
3 (pla)		| 1x compression_flanges_bottom
4 (pla)		| 1x compression_flanges_top
5 (pla)		| 1x compression_flanges_z
6 (pla)		| 1x motor_clamps
7 (pla)		| 1x spool_holder; 2x xend
8 (pla)		| 4x top_vertex (see notes)
9 (pla)		| 1x yrod_mounts
10 (pla)	| 2x z_ends
11 (pla)	| 2x zcoupling; 1x zrod_mounts
12 (abs/pla)	| 1x carriage; 2x carriage_endstop; 2x clipon_endstop; 2x jhead_mount (1 extra jhead_mount)

--------------------------------
total		| ~90(?) parts

Notes:
- heatbed.stl should not be compiled and should not be printed
- Recommended slicing settings:  50% honeycomb infill, 5 perimeters, 200 micron layer height, 10 solid layers top/bottom (= 2mm solid top/bottom).  If using thinner layer heights then increase # of solid layers to achieve 2mm thickness.
- p#6 cooling fan recommended
- p#8 - print 2x of this plate!  Error in toolchain won't allow full plate.
- p#12 abs strongly recommended for j-head mount; cooling fan recommended

Additional Parts
--------------
You'll need an 00str00der for a Bowden configuration, which is an option provided in the 00str00der SCAD source code.  There are also pre-compiled Bowden 00str00der STL files available at https://github.com/iquizzle/00str00der (also https://github.com/Terawatt-Industries/00str00der).

Optional Parts
--------------
TBD