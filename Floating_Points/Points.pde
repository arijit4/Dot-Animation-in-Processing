class Points {
  ArrayList<Point> points = new ArrayList<Point>();
  Points(int n) {
    for (int i = 1; i <= n; i++) {
      points.add(new Point());
    }
  }

  void update() {
    for (int i = 0; i < points.size(); i++) {
      points.get(i).update();
      if (points.get(i).isDead) {
        points.remove(i);
        points.add(recover());
      }
    }
  }

  void show() {
    for (Point x : points) {
      x.show();
    }
    connectNearby();
  }

  void connectNearby() {
    float maxDist = 100;
    for (int i = 0; i < points.size(); i++) {
      for (int j = 0; j < points.size(); j++) {
        if (j != i) {
          PVector x = points.get(i).position;
          PVector y = points.get(j).position;

          float dist = PVector.dist(x, y);

          if (dist <= maxDist) {
            stroke(255, map(dist, 0, maxDist, 100, 0));
            line(x.x, x.y, y.x, y.y);
          }
        }
      }
    }
  }

  Point recover() {
    float x, y;

    float a[] = {0, 1};
    float b[] = {1, -1};

    int index = (int) random(a.length);
    int guess = (int) random(2);

    if (guess == 0) {
      x = random(0, width);
      y = height*a[index] + b[index]*random(-150, -100);
    } else {
      y = random(0, height);
      x = width*a[index] + b[index]*random(-15, -100);
    }

    return new Point(x, y);
  }
}
