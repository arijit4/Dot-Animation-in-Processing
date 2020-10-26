class Point {
  float x;
  float y;
  float diametre = random(2, 5);
  
  Point() {
    x = random(width);
    y = random(height);
  }
  
  Point(float x_, float y_) {
    float a[] = {0, 1};
    float b[] = {1, -1};
    
    int index = (int) random(0, 1.5);
    int guess = (int) random(0, 1.5);
    
    if (guess == 0) {
      x = random(0, width);
      y = height*a[index] + b[index]*random(-150, -100);
    } else {
      y = random(0, height);
      x = width*a[index] + b[index]*random(-15, -100);
    }
  } 
}
