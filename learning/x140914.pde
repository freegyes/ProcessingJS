// declare variables for colour
float h = 0.0;
float s = 0.0;
float b = 0.0;

// rotation
float r = 0.0;

// and sizes
float prop_rect = 40;
float prop_line = prop_rect * 1.5;

void setup() {
  size(512, 512);
  
  // set random values for color
  h = random(256);
  s = random(128);
  b = random(128, 256);

  // change colormode to hsb and fill background
  colorMode(HSB);
  background(h, s, b);
  smooth();
  // draw rectangle from center
  rectMode(CENTER);
}

void draw() {
  // for fadeout effect
  fill(h, s, b, 40);
  rect(width/2, height/2, width, height);

  // make rectangle white
  fill(255);
  
  // set the origo related to mouse position
  translate(mouseX, mouseY + prop_line);

  // rotate canvas
  rotate(r);
  
  // draw the rectangle
  rect(0, 0, prop_rect, prop_rect);

  // draw the antennae
  line(0, 0, prop_line, prop_line);
  line(0, 0, -prop_line, prop_line);
  line(0, 0, prop_line, -prop_line);
  line(0, 0, -prop_line, -prop_line);
  line(0, 0, 0, prop_line);
  line(0, 0, 0, -prop_line);
  line(0, 0, -prop_line, 0);
  line(0, 0, prop_line, 0); 

  // increase rotation
  r = r - 0.06;
}