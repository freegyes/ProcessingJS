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
smooth();                       // smooths the lines with slope

textSize(n);                    // sets the font size
text("string", x, y);           // displays a string

colorMode(HSB);                 // sets the color mode from RGB to HSB

random(high);                   // picks a random number
random(low,high);               // high not included

void setup() {
    size(512, 512);             // sets the canvas size
    frameRate(n);               // sets the fps
    background(n, alpha);       // 0 .. 255 black to white
}

rotate(rad);                    // rotates the coordinates
translate(x,y);                 // sets (0,0) coordinates in a new position
resetMatrix();                  // resets rotation and translation

void draw() {
  // draw stuff
}

void keyPressed() {
  // happens when a key is pressed
}

println("Hello ErrorLog!");
frameCount();                   // displays the number of frames since beginning
width, height                   // globally reachable variables for canvas size
mouseX, mouseY                  // the position of the mouse
mousePressed                    // the variable stores if the mouse button is pressed
key                             // stores the latest pressed key

if (conditional) {
  // runs if condition is true
}

while (conditional) {
  // runs while the condition is true
}

void function_name(float x, float y) {
  // here comes the function
}

save("filename.png");           // saves the canvas