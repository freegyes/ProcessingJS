void setup() {
  size(512, 512);   // sets the canvas size
  smooth();         // smooths the drawn lines
}

float pos = 0;      // sets position variable
float s = 20;       // declares size constant

float c = 0;        // initiates the counter

float rot = random(-TWO_PI, TWO_PI);    // defines the initial random rotation in radians

void draw() {
  fill(#c4ccff, 85);                    // sets an opaque fill
  rect(0, 0, width, height);            // draws a canvas size background to make the fade out effect
    
  
  // draw and modify position
  while (pos < 600) {
   
    // draw and modify fill then rotate object 
    while (c < 100) {
        fill(random(256), 30);
        rect(width - pos, height / 4 - pos, width / s, height / s);
        rotate(rot);
        c++;
      }  

    pos += 1.25 * s;                // modify position
    c = 0;                          // reset counter
  }
  pos = 0;                          // reset position
  rot = random(-TWO_PI, TWO_PI);    // randomize rotation angle
}
