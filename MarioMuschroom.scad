/*
Pablojose Conde 
pjconde@gatech.edu
*/ 

/*What is it?
This is a variation of the Mario muschroom. I took the design from another modle i found online at 
https://s-media-cache-ak0.pinimg.com/236x/d1/2a/bc/d12abc62ca9b8c9a52812fde7e4d312e.jpg 
I changed the colors since the dark red colors seemed a little too dark and I wanted to liven it up a bit. I decided on the white and blue to follow the KC Royals colors for no real reason other than that is the baseball team my girlfriend likes. I also decided to make a Mario item since she made a blue shell for her Lab 4 and I wanted to follow that and do something mario related too. 
*/

// TAKES ABOUT 1min 30sec TO COMPILE & RENDER
   



module shroomBody (){ // module draws the mushroom body (has to be flipped)
 rotate([0, -180, 0]){
	hull(){
 	 rotate_extrude(){
		square([50,10]);
			translate([45,55,0])
				circle(5);
 	 } // end rotate_extrude
	} // end hull on square and circle
 } // end rotate on entire hull
} // end shroomBody module


module shroomHead(){   // module draws the mushroom head
 translate([15,0,65])
  scale([1.9,2.05,1.4])
   color("lightcyan") sphere(r = 50);
} // end shroomHead module


module shroomSpike(){ // module draws the top spike
 translate([15,0,125])
  color("gold") cylinder(h = 80, r1 = 20, r2 = 0);
} // end shroomSpike module


module headBrim(){ // module draws the little overhang/visor
 rotate_extrude(){
  rotate([0,0,0])
   translate([45,25,0])
    circle(15);
 } // end rotate_extrude
} // end headBrim module


module eye(){ // draws the left eye
 translate([38,-20,1])
   scale([1.3,.7,1.8])
    color("black") sphere(r = 10);
} // end eye module 


module makeSideSpots (){ // draws the right most spot
  translate([10,85,65])
    scale([2.4,1,1.7])
	  color("dodgerblue") sphere(r= 20);
} // end makeSideSpots module


module makeSpot (){ // draws the front spot
  translate([95,0,65])
    scale([1,2.4,1.7])
	  color("dodgerblue") sphere(r= 20);
} // end makeSpot module


module makeHalo(){ // makes the bottom halo around the spike
 difference(){
   scale([1,1,.3]){
    sphere(r= 60);
   } // end sphere scale
   translate([0,0,-50]){
    cylinder(h = 500, r=48);
   } // end cylinder translate
 } // end difference
} // end makeHalo module

extraHalos = 1; // value of how many extra halos I wanted

module stackHalos(i){ // uses a loop to make extra halos around the spike 
  for (n = [0:i]){
    translate([0, 0, n*50])
      color("dodgerblue") makeHalo();
  } // end for loop
} // end stackHalos module


// drawing everything to compile window
module shroomScaled(){
	scale([.75,.75,.75])
		union(){ 
			translate([0,0,35])
				color("moccasin") shroomBody();
		
			rotate([0,-25,0])
				shroomHead(); 
		
			rotate([0,-25,0])
				shroomSpike(); 
		
			color("lightcyan") headBrim();
		
			eye();
		
			mirror([0, 1, 0]) // mirrors first eye over y axis
				eye();
		
			rotate([0,-25,0]) 
				makeSideSpots(); 
		
			mirror([0,1,0])
		  		rotate([0,-25,0])
					makeSideSpots();
		
			rotate([0,-25,0])
				makeSpot();
		
			mirror([1,0,0])
		  		rotate([0,25,0])
		   			translate([-28,0,0])
		    				makeSpot();
		
			rotate([0,-25,0])
		 		translate([15,0,160])
		  			stackHalos(extraHalos);
		}
}

module shroom(){
		union(){ 
			translate([0,0,35])
				color("moccasin") shroomBody();
		
			rotate([0,-25,0])
				shroomHead(); 
		
			rotate([0,-25,0])
				shroomSpike(); 
		
			color("lightcyan") headBrim();
		
			eye();
		
			mirror([0, 1, 0]) // mirrors first eye over y axis
				eye();
		
			rotate([0,-25,0]) 
				makeSideSpots(); 
		
			mirror([0,1,0])
		  		rotate([0,-25,0])
					makeSideSpots();
		
			rotate([0,-25,0])
				makeSpot();
		
			mirror([1,0,0])
		  		rotate([0,25,0])
		   			translate([-28,0,0])
		    				makeSpot();
		
			rotate([0,-25,0])
		 		translate([15,0,160])
		  			stackHalos(extraHalos);
		}
}

print = 1;
if (print == 1){
	shroomScaled();
}else{
	shroom();
}
