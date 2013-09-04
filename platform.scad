include <configuration.scad>
use <carriage.scad>
use <jhead_mount.scad>
use<bowden_mount.scad>



h=platform_thickness;

cutout = 12.5;
inset = 6;

$fn = 50;

module platform() {
	translate([0, 0, h/2]) 
	difference() {
		union() {
			for (a = [0:120:240]) {
				rotate([0, 0, a]) {
					translate([0, -platform_hinge_offset+1, 0]) parallel_joints();
				}
			}
			hull(){
				for(a = [0:120:240]){
					rotate([0,0,a]) translate([0,31,0]) cylinder(r=3,h=h,center=true);
				}
			}
		}
		cylinder(r=8.3,h=h+1,center=true);
		for(a = [0:120:240]){
			rotate([0,0,a]) translate([0,20,0]) cylinder( r=2.2, h=h+1,center=true);
		}
		
		//Fan Mount	
		for( b = [-31.5/2:31.5:31.5/2]){
			translate([b,-16,0]) rotate([90,0,0])cylinder(r=3.2/2,h=6,center=true);
			translate([b,-15,0]) cube([5.5,2,h+1],center=true);
		}
		
	}
}

platform();

%translate([0,0,-h*2]) J_Head_Mount();
%translate([0,0,h*2]) bowden_mount();
