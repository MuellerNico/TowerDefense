ArrayList<RangedUnit> rangedUnits = new ArrayList<RangedUnit>();  

class RangedUnit extends Unit {
  RangedUnit(float x_, float y_) {
    super(x_, y_);
    rangedUnits.add(this);
  }
  void update() {
    super.update();
  }  
}