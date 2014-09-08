point(x,y);                     // draws a point
line(x1,y1,x2,y2);              // draws a line
ellipse(x, y, width, height);   // draws an ellipse
rect(x, y, width, height);      // draws a rectangle
  rectMode(CENTER);             // draws from the center

stroke(x);                      // sets the stroke 
  noStroke();                   // disables the stroke
  strokeWeight(x);              // sets the weoght of the stroke
fill(x);                        // sets the fill
  noFill();                     // disables the fill

colorMode(HSB);                 // sets the color mode from RGB to HSB

random(high);                   // picks a random number
random(low,high);               // high not included

void setup() {
    size(512, 512);             // sets the canvas size
    frameRate(n);               // sets the fps
    background(n, alpha);       // 0 .. 255 black to white
}

void draw() {
  // draw stuff
}

println("Hello ErrorLog!");
frameCount();                   // displays the number of frames since beginning
width, height                   // globally reachable variables for canvas size

if (conditional) {
  // runs if condition is true
}