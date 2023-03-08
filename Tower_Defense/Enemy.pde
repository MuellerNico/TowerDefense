
ArrayList<Entity> enemies = new ArrayList<Entity>();
class Enemy extends Entity {

  Enemy(float x_, float y_) {
    super(x_, y_);
    enemies.add(this);
  }
  void update() {
    super.update();
  }
  void die() {
    enemies.remove(this);
  }
}