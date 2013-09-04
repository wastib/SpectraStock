include <configuration.scad>

h=5.5;
$fn=10;

module bowden_mount(){
	difference(){
		union(){
			hull(){
				for(a = [0:120:240]){
					rotate([0,0,a]) translate([0,20,0]) cylinder( r=4, h=h,center=true);
				}
			}
		}

		//Bolt holes and making the thing less material intensive
		for(a = [0:120:240]){
			rotate([0,0,a]) translate([0,20,0]) cylinder( r=2.2, h=h+1,center=true);
			rotate([0,0,a]) translate([0,-23,0]) scale([1.3,1,1]) cylinder(r=15,h=h+1,center=true);
		}
		
		//Hole for bowden Cable + Nut
		translate([0,0,-1]) cylinder(r=9/2,h=4,center=true);
		translate([0,0,1]) cylinder(r=4.2/2, h=10,center=true);


	}

	
}

rotate([180,0,0]) bowden_mount();
	