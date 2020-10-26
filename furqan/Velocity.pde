class Velocity {
  double v = random(0.1, 0.4);
  double direction;

  Velocity() {
    //v = 0.08; // ms^-1 LOL :p
    direction = random(radians(360.0));  // calc the direction in redians...
  }
  
  Velocity(Point p) {
    if (p.y < 0) {
      direction = random(radians(-30), radians(30));
    } else if (p.y > height) {
      direction = random(radians(180 - 30), radians(180 + 30));
    } else if (p.x > width) {
      direction = random(radians(270 - 30), radians(270 + 30));
    } else if (p.y > height) {
      direction = random(radians(90 - 30), radians(90 + 30));
    }
  }
  
  void change(Point point) {
    double t_x = v*Math.cos(direction);
    double t_y = v*Math.sin(direction);
    
    point.x += t_x;
    point.y += t_y;
  }
}
