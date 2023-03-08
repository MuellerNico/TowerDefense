ArrayList<MeleeUnit> meleeUnits = new ArrayList<MeleeUnit>();  

class MeleeUnit extends Unit {    //handles moving, hitting  
  MeleeUnit(float x_, float y_) {
    super(x_, y_);
    meleeUnits.add(this);
  }
  void update() {
    super.update();
  }
}