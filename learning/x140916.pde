// declare variables for size
float rect_size = 40;

// coordination
float x = 1.5 * rect_size;
float y = 1.5 * rect_size;

// and rotiation
float rot = 0.0;

// set up canvas
void setup() {
  size(512, 512);
  background(255);
  rectMode(CENTER);
  smooth();
}

void draw_rectangle() {
  resetMatrix();                      // reset previous modifications
  translate(x, y);                    // set origin at values
  rotate(rot);                        // rotate canvas
  rect(0, 0, rect_size, rect_size);   // draw rectangle from new origin
}

void offset_origin_x() {
  if (x > (width - 2 * rect_size)) {  // if x offset would run out of canvas
    x =  1.5 * rect_size;             // reset offset
  } else {                            // else
    x = x + 2 * rect_size;            // increase offset
  }
}

void  offset_origin_y() {
if (y > (width - 2 * rect_size)) {    // if x offset would run out of canvas
    y =  1.5 * rect_size;             // reset offset
  } else {                            // else
    y = y + 2 * rect_size;            // increase offset
  }
}

void draw() {

  // with each frame draw an opaque background for trailing effect
  fill(255, 20);
  noStroke();
  rect(width/2, height/2, width, height);

  // draw a rectangle and offset the x axis
  stroke(0);
  draw_rectangle();
  offset_origin_x();
  
  // draw a rectangle and offset the y axis 
  float i = 0.0;
  while (i < (height / rect_size)) {
      draw_rectangle();
      offset_origin_y();
      i++;
    }
  
  // increase rotation
  rot = rot - 0.02;
}