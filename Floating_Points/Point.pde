class Point {
  float speed = 0.52;

  PVector position;
  PVector velocity;

  float diametre = random(2, 5);
  float buffer = 50;
  boolean isDead = false;

  Point() {
    position = new PVector(random(width), random(height));
    velocity = PVector.fromAngle(random(TWO_PI)).mult(speed);
  }

  Point(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.fromAngle(random(TWO_PI)).mult(speed);
  }

  void update() {
    if (!isDead) {
      if (position.x < -buffer || position.x > width + buffer
        || position.y < -buffer || position.y > height + buffer) {
        this.isDead = true;
      } else {
        position.add(velocity);
      }
    }
  }

  void show() {
    ellipse(position.x, position.y, diametre, diametre);
  }
}
