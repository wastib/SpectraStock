include <configuration.scad>;

radius = 9;
width = 16;
top = 5;
smoothness = 20;

//for the center part

end_thick = 0;
middle_thick = 2;




module spool() {
	difference() {
		union() {
     		cylinder(r=radius, h=width, center=true, $fn=smoothness);
			//seperator();
			
			
			translate([0, 0, width/2]) cylinder(r1=radius, r2=radius+2, h=2, center=true, $fn=smoothness);
			translate([0, 0, -width/2]) cylinder(r2=radius, r1=radius+2, h=2, center=true, $fn=smoothness);
			translate([0, 0, width/2+top/2+1]) cylinder(r=radius+2, h=top, center=true, $fn=smoothness);
		}

    // Motor shaft.
		cylinder(r=motor_shaft_radius, h=50, center=true, $fn=20);

    // Filament tunnels.
		translate([0, radius, width/2-1.5]) rotate([-30, 0, 0])
			#cube([2, 2*radius, 1.5], center=true);
		translate([0, radius, -width/2+1.5]) rotate([30, 0, 0])
			#cube([2, 2*radius, 1.5], center=true);
		translate([0, 5, 0])
			#cylinder(r=1.5, h=40, center=true, $fn=6);

    // M3 screws and nuts on three sides.
		for (a = [0:120:359]) {
			rotate([0, 0, a]) translate([0, 4.5, width/2+3]) rotate([90, 0, 0]) {
				cylinder(r=m3_wide_radius, h=radius+5, center=true, $fn=12);
				translate([0, 0, 1-radius]) cylinder(r=7, h=6, center=true);
				for (z = [0:10]) {
					translate([0, z, 1.5]) rotate([0, 0, 30])
						cylinder(r=m3_nut_radius, h=5, center=true, $fn=6);
				}
			}
		}
	}
}

module seperator(){
	union(){
		translate([0,0,-5])cylinder(r1=radius+end_thick,r2=radius, h=5, center=true);
		translate([0,0,5])cylinder(r2=radius+end_thick,r1=radius, h=5, center=true);
		
		translate([0,0,-3.5/2])cylinder(r2=radius+middle_thick,r1=radius, h=3.5, center=true);
		translate([0,0,3.5/2])cylinder(r1=radius+middle_thick,r2=radius, h=3.5, center=true);

	
	}

}



translate([0, 0, 0]) spool();