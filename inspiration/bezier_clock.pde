/* @pjs globalKeyEvents="true"; */  

BezierDigitAnimator hoursTensDigit;
BezierDigitAnimator hoursUnitsDigit;

BezierDigitAnimator minutesTensDigit;
BezierDigitAnimator minutesUnitsDigit;

BezierDigitAnimator secondsTensDigit;
BezierDigitAnimator secondsUnitsDigit;

BezierDigit[] digits = new BezierDigit[10];

boolean drawControlLines = false;
boolean continualAnimation = false;
boolean onlyCustomAnimSecondsDigit = false;
boolean showContinualShadows = false;

int animationType = 4; // 1 for linear, 2 for quadratic, 3 for cubic, 4 for sinuisoidial
float visualScaling = 0.5;
int animTypeChangeCounter = 1000;
String input = "";
float animDurationUser = 1.0;

void mousePressed() {
  drawControlLines = !drawControlLines;
}
void keyPressed() {
  if (key == ' ') {
    continualAnimation = !continualAnimation; 
  }
  if (key == 'a') {
    animationType += 1;
    animTypeChangeCounter = 0;
    if (animationType > 4) {
      animationType = 1;
    }
  }
  if (key == 's') {
    showContinualShadows = !showContinualShadows;
  }

  if( key >= '0' && key <= '9' ){
    input+= new String(key);
  } 
  else if( key == '.' && input.length() > 0) {
    int idxOf = input.indexOf(".");
    if (idxOf == -1) {  
      input += new String(key);
    }
  }
  else if( key == BACKSPACE && input.length() > 0 ){
    input = input.substring(  0, input.length()-1 );
  } 
  else if (key == RETURN || key == ENTER){
    animDurationUser = float( input );
    input = "";
  }
}

void setup( )
{
  background(255);
  rectMode(CENTER);
  strokeWeight(2);
  textAlign(CENTER, BOTTOM);
  smooth();
  frameRate(100);
  digits[0] = new BezierDigit(0);
  digits[1] = new BezierDigit(1);
  digits[2] = new BezierDigit(2);
  digits[3] = new BezierDigit(3);
  digits[4] = new BezierDigit(4);
  digits[5] = new BezierDigit(5);
  digits[6] = new BezierDigit(6);
  digits[7] = new BezierDigit(7);
  digits[8] = new BezierDigit(8);
  digits[9] = new BezierDigit(9);
  
  int dist = 0;
  // In each the following, the ratio at which the numbers start 
  // animating is calculated as the ratio of the pause time to the animation time.
  // The fact that they add up to the correct amt of seconds is just to make it easier to tweak.
  int yOff = 50;
  hoursTensDigit =  new BezierDigitAnimator(0 * visualScaling, yOff*visualScaling, 35995.0, 5.0); 
  hoursUnitsDigit = new BezierDigitAnimator((dist+=300) * visualScaling, yOff*visualScaling,  3595.0, 5.0); 
  minutesTensDigit =  new BezierDigitAnimator((dist+=500) * visualScaling, yOff*visualScaling, 595.0, 5.0); 
  minutesUnitsDigit = new BezierDigitAnimator((dist+=300) * visualScaling, yOff*visualScaling,  55.0, 5.0); 
  secondsTensDigit =  new BezierDigitAnimator((dist+=500) * visualScaling, yOff*visualScaling, 5.0, 5.0); 
  secondsUnitsDigit = new BezierDigitAnimator((dist+=300) * visualScaling, yOff*visualScaling, 0.0, 1.0); 
  
  size(round((dist + 480) * visualScaling), round(600 * visualScaling));

}
void draw() {
  background(255);
  // if (frameCount % 100 == 0) {
  //     println(frameRate);

  // }
  if (animTypeChangeCounter < 100) {
    fill(50);
    String[] states = {"linear", "quadratic", "cubic", "sinusoidal"};
    String s = states[animationType - 1];
    text(s, width/2, height);
  }
  if (input.length() > 0) {
    fill(50);
    text("Set maximum animation duration to: " + input + "s (press enter to confirm)", width/2, height-15);
  }

  animTypeChangeCounter += 1;
  noFill();

  // Seconds
//  long millis = System.currentTimeMillis() % 1000;
  var d = new Date();
  var millis = d.getMilliseconds(); 
  int secondTotal = second();
  int secondsUnit = secondTotal % 10;
  int secondsTen = (secondTotal % 100 - secondTotal % 10) / 10;
  float secondsUnitRatio = millis / 1000.0;
  float secondsTenRatio = (secondsUnit * 1000 + millis) / 10000.0;
  secondsUnitsDigit.animationStartRatio = getAnimStartRatio(1.0);
  secondsUnitsDigit.update(secondsUnit, getNextInt(secondsUnit,9), secondsUnitRatio);

  // int savedAnimType = animationType;
  // if (onlyCustomAnimSecondsDigit) {
  //     animationType = 1;
  // }

  secondsTensDigit.animationStartRatio = getAnimStartRatio(10.0);
  secondsTensDigit.update(secondsTen, getNextInt(secondsTen,5), secondsTenRatio);
  
  // Minutes
  int minuteTotal = minute();
  int minutesUnit = minuteTotal % 10;
  int minutesTen = (minuteTotal % 100 - minuteTotal % 10) / 10;
  float minutesUnitRatio = (secondTotal * 1000 + millis) / 60000.0;
  float mintuesTenRatio = (minutesUnit * 60000 + secondTotal * 1000 + millis) / 600000.0;
  minutesTensDigit.animationStartRatio = getAnimStartRatio(600.0);
  minutesTensDigit.update(minutesTen, getNextInt(minutesTen,5), mintuesTenRatio);
  minutesUnitsDigit.animationStartRatio = getAnimStartRatio(60.0);
  minutesUnitsDigit.update(minutesUnit, getNextInt(minutesUnit,9), minutesUnitRatio);

  // Hours
  int hoursTotal = hour();
  int hoursUnit = hoursTotal % 10;
  int hoursTen = (hoursTotal % 100 - hoursTotal % 10) / 10;
  float hoursUnitRatio = ( minuteTotal * 60000 + secondTotal * 1000 + millis) / 3600000.0;
  float hoursTenRatio;
  int hoursUnitNext;
  if (hoursTen == 2 && hoursUnit == 3) {
    hoursUnitNext = 0;
    hoursTenRatio = ( hoursUnit * 3600000 + minuteTotal * 60000 + secondTotal * 1000 + millis) / ( 4 * 3600000.0); // because only 20, 21, 22, 23 and not up to 29
    hoursTensDigit.animationStartRatio = getAnimStartRatio(3600 * 4);
  } else {
    hoursUnitNext = getNextInt(hoursUnit, 9);
    hoursTenRatio = ( hoursUnit * 3600000 + minuteTotal * 60000 + secondTotal * 1000 + millis) / 36000000.0;
    hoursTensDigit.animationStartRatio = getAnimStartRatio(3600 * 10);
  }
  hoursTensDigit.update(hoursTen, getNextInt(hoursTen,2), hoursTenRatio);
  hoursUnitsDigit.animationStartRatio = getAnimStartRatio(3600);
  hoursUnitsDigit.update(hoursUnit, hoursUnitNext, hoursUnitRatio);

  // animationType = savedAnimType;
}

float getAnimStartRatio(float totalDuration) {
  if (animDurationUser > totalDuration) {
    return 0;
  } else {
    return 1.0 - (animDurationUser / totalDuration)
  }
}

int getNextInt(int current, int max) {
  if (current >= max) {
   return 0;
  } else {
    return current + 1;
  }
}

void bezierVertexFromArrayListsRatios(float[] from, float[] to, float ratio, float offsetX, float offsetY) {
  bezierVertex(lerp(from[0], to[0], ratio) + offsetX,
             lerp(from[1], to[1], ratio) + offsetY, 
             lerp(from[2], to[2], ratio) + offsetX, 
             lerp(from[3], to[3], ratio) + offsetY, 
             lerp(from[4], to[4], ratio) + offsetX, 
             lerp(from[5], to[5], ratio) + offsetY);
}

class BezierDigitAnimator {
  float animationStartRatio; // ratio after which we start the animation
  
  float origX;
  float origY;
 
  BezierDigitAnimator (float origX, float origY, float pauseDuration, float animDuration) {
    this.origX = origX;
    this.origY = origY;
    animationStartRatio = pauseDuration / (pauseDuration + animDuration);
  }
  
  void update(int currentDigit, int nextDigit, float ratio) {
    BezierDigit current = digits[currentDigit];
    BezierDigit next = digits[nextDigit];
    float animationRatio = 0.0;
    if (ratio > animationStartRatio) { animationRatio = (ratio - animationStartRatio) / (1 - animationStartRatio); }
    if (continualAnimation) {animationRatio = ratio;}
    if (ratio < 0.0) {animationRatio = 0.0;}
    if (ratio > 1.0) {animationRatio = 1;}
    if (animationType == 2) { // quad
      animationRatio = sq(animationRatio);
      ratio = sq(ratio); // we don't need ratio any more
    } 
    else if (animationType == 3) { // cub
      animationRatio = animationRatio * sq(animationRatio);
      ratio = ratio * sq(ratio);
    } 
    else if (animationType == 4) { // sin
      animationRatio = 0.5 * (-cos(animationRatio * PI) + 1);
      ratio = 0.5 * (-cos(ratio * PI) + 1);
    }

    noFill();

    if (showContinualShadows && !continualAnimation) {
      strokeWeight(3);
      stroke(0,40);
      beginShape();
      // First point
      vertex(lerp(current.getVertexX(), next.getVertexX(), animationRatio) + origX, lerp(current.getVertexY(), next.getVertexY(), ratio) + origY);
      for (int i = 0; i < 4; i++) {
        // actual curve
        bezierVertexFromArrayListsRatios(current.getControl(i), next.getControl(i), ratio, origX, origY);
      }
      endShape();
    }

    float rad = 5; // rectangle width & circle diameter, confusingly..
    strokeWeight(3);
    stroke(0);
    beginShape();
    // First point
    vertex(lerp(current.getVertexX(), next.getVertexX(), animationRatio) + origX, lerp(current.getVertexY(), next.getVertexY(), animationRatio) + origY);
    for (int i = 0; i < 4; i++) {
      // actual curve
      bezierVertexFromArrayListsRatios(current.getControl(i), next.getControl(i), animationRatio, origX, origY);
    }
    endShape();
    fill(255);
    strokeWeight(1);
    for (int i = 0; i < 4; i++) {
      if (drawControlLines) {
        // spline lines & circles
        stroke(230, 21, 21);
        line( lerp(current.getControl(i)[2], next.getControl(i)[2], animationRatio) + origX, lerp(current.getControl(i)[3], next.getControl(i)[3], animationRatio) + origY,
              lerp(current.getControl(i)[4], next.getControl(i)[4], animationRatio) + origX, lerp(current.getControl(i)[5], next.getControl(i)[5], animationRatio) + origY);
        ellipse(lerp(current.getControl(i)[2], next.getControl(i)[2], animationRatio)  + origX, lerp(current.getControl(i)[3], next.getControl(i)[3], animationRatio) + origY,rad,rad);
        if (i < 3) {
          line(lerp(current.getControl(i+1)[0], next.getControl(i+1)[0], animationRatio) + origX, lerp(current.getControl(i+1)[1], next.getControl(i+1)[1], animationRatio) + origY,
               lerp(current.getControl(i)[4], next.getControl(i)[4], animationRatio) + origX, lerp(current.getControl(i)[5], next.getControl(i)[5], animationRatio) + origY);
          ellipse(lerp(current.getControl(i+1)[0], next.getControl(i+1)[0], animationRatio) + origX, lerp(current.getControl(i+1)[1], next.getControl(i+1)[1], animationRatio) + origY,rad,rad);
        }
        // control point rectangles
        stroke(78,28,214);
        rect(lerp(current.getControl(i)[4], next.getControl(i)[4], animationRatio) + origX, lerp(current.getControl(i)[5], next.getControl(i)[5], animationRatio) + origY, rad,rad);

        if (i == 0) {
          // All the edge cases that can't go in the for loop - end points etc.
          stroke(255, 0, 0);
          line( lerp(current.getVertexX(), next.getVertexX(), animationRatio) + origX, lerp(current.getVertexY(), next.getVertexY(), animationRatio) + origY, 
                lerp(current.getControl(0)[0], next.getControl(0)[0], animationRatio) + origX , lerp(current.getControl(0)[1], next.getControl(0)[1], animationRatio) + origY);
          ellipse(lerp(current.getControl(0)[0], next.getControl(0)[0], animationRatio)  + origX, lerp(current.getControl(0)[1], next.getControl(0)[1], animationRatio) + origY,rad,rad);
          stroke(0,0,255);
          rect(lerp(current.getVertexX(), next.getVertexX(), animationRatio) + origX, lerp(current.getVertexY(), next.getVertexY(), animationRatio) + origY, rad,rad);
        }
      }
    }    
  }
}

class BezierDigit {
  float vertexX, vertexY; // first point
  float[][] controls = new float[4][6];
  BezierDigit (int digit) {
    // set up the control points etc based on which number
    // where the numbers are actually stored. Makes it a bit messy due to the assymetry of how
    // Processing stores beziers - need a 'vertex' and subsequent control points. 
    switch(digit) {
      case 0: 
        vertexX = 254.0;
        vertexY = 47.0;
        controls[0] = new float[] {159.0, 84.0, 123.0, 158.0, 131.0, 258.0};
        controls[1] = new float[] {139.0, 358.0, 167.0, 445.0, 256.0, 446.0};
        controls[2] = new float[] {345.0, 447.0, 369.0, 349.0, 369.0, 275.0};
        controls[3] = new float[] {369.0, 201.0, 365.0, 81.0, 231.0, 75.0};
        break;
      case 1: {
        vertexX = 138.0;
        vertexY = 180.0;
        controls[0] = new float[] {226.0, 99.0, 230.0, 58.0, 243.0, 43.0};
        controls[1] = new float[] {256.0, 28.0, 252.0, 100.0, 253.0, 167.0};
        controls[2] = new float[] {254.0, 234.0, 254.0, 194.0, 255.0, 303.0};
        controls[3] = new float[] {256.0, 412.0, 254.0, 361.0, 255.0, 424.0};
        break;
      }
      case 2: {
        vertexX = 104.0;
        vertexY = 111.0;
        controls[0] = new float[] {152.0, 55.0, 208.0, 26.0, 271.0, 50.0};
        controls[1] = new float[] {334.0, 74.0, 360.0, 159.0, 336.0, 241.0};
        controls[2] = new float[] {312.0, 323.0, 136.0, 454.0, 120.0, 405.0};
        controls[3] = new float[] {104.0, 356.0, 327.0, 393.0, 373.0, 414.0};
        break;
      }
      case 3: {
        vertexX = 96.0;
        vertexY = 132.0;
        controls[0] = new float[] {113.0, 14.0, 267.0, 17.0, 311.0, 107.0};
        controls[1] = new float[] {355.0, 197.0, 190.0, 285.0, 182.0, 250.0};
        controls[2] = new float[] {174.0, 215.0, 396.0, 273.0, 338.0, 388.0};
        controls[3] = new float[] {280.0, 503.0, 110.0, 445.0, 93.0, 391.0};
        break;
      }
      case 4: {
        vertexX = 374.0;
        vertexY = 244.0;
        controls[0] = new float[] {249.0, 230.0, 192.0, 234.0, 131.0, 239.0};
        controls[1] = new float[] {70.0, 244.0, 142.0, 138.0, 192.0, 84.0};
        controls[2] = new float[] {242.0, 30.0, 283.0, -30.0, 260.0, 108.0};
        controls[3] = new float[] {237.0, 246.0, 246.0, 435.0, 247.0, 438.0};
        break;
      }
      case 5: {
        vertexX = 340.0;
        vertexY = 52.0;
        controls[0] = new float[] {226.0, 42.0, 153.0, 44.0, 144.0, 61.0};
        controls[1] = new float[] {135.0, 78.0, 145.0, 203.0, 152.0, 223.0};
        controls[2] = new float[] {159.0, 243.0, 351.0, 165.0, 361.0, 302.0};
        controls[3] = new float[] {371.0, 439.0, 262.0, 452.0, 147.0, 409.0};
        break;      
      }
      case 6: {
        vertexX = 301.0;
        vertexY = 26.0;
        controls[0] = new float[] {191.0, 104.0, 160.0, 224.0, 149.0, 296.0};
        controls[1] = new float[] {138.0, 368.0, 163.0, 451.0, 242.0, 458.0};
        controls[2] = new float[] {321.0, 465.0, 367.0, 402.0, 348.0, 321.0};
        controls[3] = new float[] {329.0, 240.0, 220.0, 243.0, 168.0, 285.0};
        break;      
      }
      case 7: {
        vertexX = 108.0;
        vertexY = 52.0;
        controls[0] = new float[] {168.0, 34.0, 245.0, 42.0, 312.0, 38.0};
        controls[1] = new float[] {379.0, 34.0, 305.0, 145.0, 294.0, 166.0};
        controls[2] = new float[] {283.0, 187.0, 243.0, 267.0, 231.0, 295.0};
        controls[3] = new float[] {219.0, 323.0, 200.0, 388.0, 198.0, 452.0};
        break;      
      }
      case 8: {
        vertexX = 243.0;
        vertexY = 242.0;
        controls[0] = new float[] {336.0, 184.0, 353.0, 52.0, 240.0, 43.0};
        controls[1] = new float[] {127.0, 34.0, 143.0, 215.0, 225.0, 247.0};
        controls[2] = new float[] {307.0, 279.0, 403.0, 427.0, 248.0, 432.0};
        controls[3] = new float[] {93.0, 437.0, 124.0, 304.0, 217.0, 255.0};
        break;      
      }
      case 9: {
        vertexX = 322.0;
        vertexY = 105.0;
        controls[0] = new float[] {323.0, 6.0, 171.0, 33.0, 151.0, 85.0};
        controls[1] = new float[] {131.0, 137.0, 161.0, 184.0, 219.0, 190.0};
        controls[2] = new float[] {277.0, 196.0, 346.0, 149.0, 322.0, 122.0};
        controls[3] = new float[] {298.0, 95.0, 297.0, 365.0, 297.0, 448.0};
        break;
      }
    }  
  }  
  
  // Returns a scaled version of the control points
  float[] getControl(int index) {
    float[] scaledControl = new float[6];
    for (int i = 0; i < 6; i++) {
      scaledControl[i] = controls[index][i] * visualScaling;
    }
    return scaledControl;
  }
  // return scaled vertex
  float getVertexX() {
    return vertexX * visualScaling;
  }
  
  float getVertexY() {
    return vertexY * visualScaling;
  }
}