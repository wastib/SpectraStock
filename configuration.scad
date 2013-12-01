motor_end_height=44;
idler_end_height=28;
carriage_height=24;
platform_thickness=8;
bed_thickness=12;
pcb_thickness=2;
rod_length=120;
smooth_rod_length=300;
tower_radius = 120;
platform_hinge_offset=33;
carriage_hinge_offset=22;



//from kossel legacy
// Increase this if your slicer or printer make holes too tight.
extra_radius = .6;

// OD = outside diameter, corner to corner.
m3_nut_od = 6.1;
m3_nut_radius = m3_nut_od/2 + 0.2 + extra_radius;

// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major/2 + extra_radius;
m3_wide_radius = m3_major/2 + 0.2 + extra_radius;

// NEMA17 stepper motors.
motor_shaft_diameter = 5;
motor_shaft_radius = motor_shaft_diameter/2 + extra_radius;

// Frame brackets.
thickness = 3.6;