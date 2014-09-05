point(x,y);
line(x1,y1,x2,y2);

stroke(x, x, x);

random(high);
random(low,high); // high not included

void setup() {
    size(512, 512);
    frameRate(n); // sets the fps
    background(#ff8000, 60); // 0 .. 255 black to white
}

void draw() {
  // draw stuff
}

println("Hello ErrorLog!");
frameCount(); // displays the number of frames since beginning
