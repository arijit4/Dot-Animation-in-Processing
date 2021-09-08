Points points;
int n = 30;

void setup() {
  size(600, 600);
  points = new Points(n);

  fill(255, 95);
  noStroke();
}

void draw() {
  background(#0099e5);
  points.show();
  points.update();
}
