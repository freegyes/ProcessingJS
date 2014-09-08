// declare variables
float x = 256;
float y = 256;
float move_x = 1;
float move_y = 1;
float ellipse_width = 100;
float ellipse_height = 100;

void setup() {
  size(512, 512); // sets the canvas size
}

void draw() {
  ellipse(x, y, ellipse_width, ellipse_height); // draws a circle

  if (random(10) > 4) {   // sometimes
    x += move_x;          // move the circle by the X axis
  }

  if (random(10) > 6) {   // sometimes
    y += move_y;          // move the circle by the Y axis
  }

  if ((x + ellipse_width / 2) > width) {    // if object would cross the right border
    x = width - (ellipse_width / 2);        // don't let it cross
    move_x = -move_x;                       // reverse it's path
  }

  if ((x - ellipse_width / 2) < 0) {        // if object would cross the left border
    x = ellipse_width / 2;                  // don't let it cross
    move_x = -move_x;                       // reverse it's path
  }  

  if ((y + ellipse_height / 2) > height) {  // if object would cross the bottom border
    y = height - (ellipse_height / 2);      // don't let it cross
    move_y = -move_y;                       // reverse it's path
  }

  if ((y - ellipse_height / 2) < 0) {       // if object would cross the top border
    y = ellipse_height / 2;                 // don't let it cross
    move_y = -move_y;                       // reverse it's path
  }
}