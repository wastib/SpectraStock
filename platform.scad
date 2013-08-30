include <configuration.scad>
use <carriage_mod.scad>

h=platform_thickness;

cutout = 12.5;
inset = 6;

$fn = 50;

module platform() {
  translate([0, 0, h/2]) 
  difference() {
    union() {
      for (a = [0:120:359]) {
        rotate([0, 0, a]) {
          translate([0, -platform_hinge_offset+1, 0]) parallel_joints();
          // Close little triangle holes.
          translate([0, 31, 0]) cylinder(r=3, h=h, center=true);
          translate([3, 32, 0]) cylinder(r=8, h=h, center=true);
          translate([-3, 32, 0]) cylinder(r=8, h=h, center=true);
          // Holder for adjustable bottom endstops.
          translate([0, 40, 0]) cylinder(r=5, h=h, center=true);
        }
      }
      cylinder(r=30, h=h, center=true, $fn = 120);
    }
    cylinder(r=20, h=h+12, center=true, $fn = 90);
    for (a = [0:2]) {
      rotate(a*120) {
        translate([0, -25, 0])
          cylinder(r=2.2, h=h+1, center=true, $fn=12);
        rotate(60)
          translate([0, -25, 0])
            cylinder(r=2.2, h=h+1, center=true, $fn=12);
        // Screw holes for adjustable bottom endstops.
        //translate([0, 45, 0])
        //  cylinder(r=1.5, h=h+1, center=true, $fn=20);
        translate([0, 50.23, 0])
          cylinder(r=10, h=h+1, center=true, $fn=60);
        translate([12, 32.9, 0])
          cylinder(r=5, h=h+1, center=true, $fn=60);
        translate([-12, 32.9, 0])
          cylinder(r=5, h=h+1, center=true, $fn=60);
      }
    }
  }
}

platform();

//parallel_joints(0);