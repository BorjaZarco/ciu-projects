PShape obj;

class ShapeBuffer {
    ArrayList<Point> points;
    ArrayList<Point> points3D;
    float angle;

    public ShapeBuffer () {
      this.angle = QUARTER_PI;
      this.points = new ArrayList<Point>();
      this.points3D = new ArrayList<Point>();
    }

    void addPoint(int x, int y) {
      points.add(new Point(x, y, 0));
    }
    
    void create3DFigure() {
      if (points.size() == 0) { return; }
      this.points3D = new ArrayList<Point>();
      float minHeight = this.getMinHeight();
      float maxHeight = this.getMaxHeight();
      float figHeight = maxHeight - minHeight;
      for (int i = 0; i < points.size() - 1; i++) {
        for (int step = 0; step <= 8 ; step++ ) {
          Point p = points.get(i);
          Point nextP = points.get(i+1);
          points3D.add(new Point(
            (p.x - width/2) * cos(angle * step) - p.z * sin(angle * step) + width/2,
            p.y - minHeight + height/2 - figHeight / 2,
            (p.x - width/2) * sin(angle * step) + p.z * cos(angle * step)
          ));
          points3D.add(new Point(
            (nextP.x - width/2) * cos(angle * step) - nextP.z * sin(angle * step) + width/2,
            nextP.y - minHeight + height/2 - figHeight / 2,
            (nextP.x - width/2) * sin(angle * step) + nextP.z * cos(angle * step)
          ));
        }
      }
      points3D.add(new Point(
        (points.get(points.size() -1).x - width/2) * cos(angle * 8) - points.get(points.size() -1).z * sin(angle * 8) + width/2,
        points.get(points.size() -1).y  - minHeight + height/2 - figHeight / 2,
        (points.get(points.size() -1).x - width/2) * sin(angle * 8) + points.get(points.size() -1).z * cos(angle * 8)
      ));     
      
    }
    
    float getMinHeight() {
      float res = this.points.get(0).y;
      for(Point p: this.points) {
        if (p.y < res) { res = p.y; }
      }
      return res;
    }
    
    float getMaxHeight() {
      float res = this.points.get(0).y;
      for(Point p: this.points) {
        if (p.y > res) { res = p.y; }
      }
      return res;
    }
    
    void removePoint() {
      if (this.points.size() > 0) {
        this.points.remove(this.points.size() - 1);
      }
    }
}
