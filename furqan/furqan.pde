int numberOfPoints = 20;

ArrayList<Point> points = new ArrayList<Point>();
ArrayList<Velocity> v = new ArrayList<Velocity>();

void setup() {
  size(600, 600);

  for (int i = 0; i < numberOfPoints; i++) {
    points.add(new Point());
    v.add(new Velocity());
  }
  for (int i = 0; i < numberOfPoints; i++) {
    Point xyz = new Point(width, height);
    points.add(xyz);
    v.add(new Velocity(xyz));
  }
}

void draw() {
  background(#0099e5);
  fill(255, 90);

  for (int i = 0; i < points.size(); i++) {
    Point temp = (Point) points.get(i);
    Velocity t_v = (Velocity) v.get(i);

    for (int j = 0; j < points.size(); j++) {

      Point hh = (Point) points.get(j);
      float dist = sqrt(pow(temp.x - hh.x, 2) + pow(temp.y - hh.y, 2));

      if (dist <= 100) {
        stroke(255, 100 - dist);
        line(temp.x, temp.y, hh.x, hh.y);
      }
      //mousePoint(hh.x, hh.y);
    }
    
    ellipse(temp.x, temp.y, temp.diametre, temp.diametre);
    t_v.change(temp);
    need();
  }
}

void mousePoint(float x, float y) {
  float dist2 = sqrt(pow(mouseX - x, 2) + pow(mouseY - y, 2));

  if (dist2 <= 100) {
    stroke(255, 100 - dist2);
    line(mouseX, mouseY, x, y);
  }
}

void need() {
  for (int i =0; i < points.size(); i++) {
    Point t = (Point) points.get(i);

    if (t.x > width + 150 || t.x < 0 - 150 || t.y > height + 150 || t.y < 0 - 150) {
      points.remove(i);
      Point xyz = new Point(width, height);
      points.add(xyz);
      v.add(new Velocity(xyz));
    }
  }
}
