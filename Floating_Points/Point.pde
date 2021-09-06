class Point {
  float speed = 0.52;

  PVector position;
  PVector velocity;

  float diametre = random(2, 5);
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
      if (position.x < -50 || position.x > width + 50
        || position.y < -50 || position.y > height + 50) {
        this.isDead = true;
      }
      position.add(velocity);
    }
  }

  void show() {
    ellipse(position.x, position.y, diametre, diametre);
  }
}
