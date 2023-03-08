/* Doesn't do anything atm. later used to handle general commands regardless of troop type*/

ArrayList<Entity> units = new ArrayList<Entity>();  
class Unit extends Entity {

  Unit(float x_, float y_) {
    super(x_, y_);
    units.add(this);
  }
  void update() {
    super.update();
  }
  void die() {
    units.remove(this);
  }
}