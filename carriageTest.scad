include <configuration.scad>

width = 67;
height = carriage_height;

offset = 20;
cutout = 15;
middle = 2*offset - width/2;

module parallel_joints(reinforced) {
  difference() {
    union() {
      intersection() {
        cube([width, 20, 8], center=true);
        rotate([0, 90, 0]) cylinder(r=5, h=width, center=true);
      }
      intersection() {
        translate([0, 18, 4]) rotate([45, 0, 0])
          cube([width, reinforced, reinforced], center=true);
        translate([0, 0, 20]) cube([width, 35, 40], center=true);
      }
      translate([0, 8, 0]) cube([width, 16, 8], center=true);
    }
    rotate([0, 90, 0]) cylinder(r=1.55, h=80, center=true, $fn=12);

    for (x = [-offset, offset]) {
      translate([x, 6.6, 0])
        cylinder(r=cutout/2, h=100, center=true, $fn=36);
      translate([x, -3.8, 0])
        cube([cutout, 20, 100], center=true);
      translate([x, 0, 0]) rotate([0, 90, 0]) rotate([0, 0, 30])
        cylinder(r=3.3, h=20, center=true, $fn=6);
    }
    translate([0, 4, 0])
      cube([2*offset+7, 20, 100], center=true);
    //translate([0, 2, 0]) cylinder(r=middle, h=100, center=true);
    //translate([0, -8, 0]) cube([2*middle, 20, 100], center=true);
  }
}

module lm8uu_mount(d, h) {
  union() {
    difference() {
      intersection() {
        cylinder(r=11, h=h, center=true);
        translate([0, -8, 0]) cube([19, 13, h+1], center=true);
      }
      cylinder(r=d/2, h=h+1, center=true);
    }
  }
}

module Spectra_Line_Mount() {
  difference() {
    union() {
      difference() {
       	translate([9, 3, 0]) cube([6, 14, height], center=true); //The main support

        translate([8,3,0]) rotate([0,90,0]) cylinder(r=1.7, h=10,center=true, $fn = 10); //3mm screw hole
	translate([3.5,3,0]) rotate([0,90,0]) cylinder(r=3.7,h=10,center=true, $fn = 10);  //3mm washer tensioner space
	translate([11.5,3,0]) rotate([0,90,0]) cylinder(r=3.3,h=2,center=true, $fn=6);

	translate([7.75,3,8]) cube([1.5,1.25,15],center=true); //Spectra line hole space
	translate([9,3,-8]) cube([7,1.25,1.25],center=true);
      }
    }
  }
}

module carriage() {
  translate([0, 0, height/2]) 
  union() {
    for (x = [-30, 30]) {
      translate([x, 0, 0]) lm8uu_mount(d=15, h=24);
    }
    Spectra_Line_Mount();
    difference() {
      union() {
        translate([0, -5.6, 0])
          cube([50, 5, height], center=true);
        translate([0, -carriage_hinge_offset, -height/2+4])
          parallel_joints(16);
        // endstop column
        translate([15, -10, -height/2+4])
          cube([6, 10, 8], center=true);
        translate([15, -15.5, -height/2+4])
          intersection() {
            cube([6, 20, 8], center=true);
            rotate([0, 90, 0]) cylinder(r=5, h=6, center=true);
          }
      }
      // Screw hole for adjustable top endstop.
      translate([15, -16, -height/2+4])
        cylinder(r=1.5, h=20, center=true, $fn=12);
      for (x = [-30, 30]) {
        translate([x, 0, 0])
          cylinder(r=8, h=height+1, center=true);
        // Zip tie tunnels.
        for (z = [-height/2+4, height/2-4])
          translate([x, 0, z])
            cylinder(r=13, h=3, center=true);
      }
    }
  }
}

carriage();
//parallel_joints(0);

// Uncomment the following lines to check endstop alignment.
// use <idler_end.scad>;
// translate([0, 0, -20]) rotate([180, 0, 0]) idler_end();
