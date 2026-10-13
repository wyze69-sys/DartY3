
class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  Point translate(int x, int y) {
    Point newPoint = Point(this.x + x, this.y + y);
    return newPoint;
  }

  @override
  String toString() {
    return "x:$x y:$y";
  }
}

void main() {
  Point point = Point(2, 4);
  point = point.translate(10, 20);
  print(point);
}
