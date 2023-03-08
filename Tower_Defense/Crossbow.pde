class Crossbow extends Weapon {
  //TODO: different types of ammo

  Crossbow(Entity owner_) {
    super(owner_);
    l = 100;
    w = 100; //TODO: not square
    range = 600;
    relPosition.set(defaultCharacterSize*3/4, defaultCharacterSize/3);
    image = loadImage("source/graphics/weapons/crossbow_simple_loaded.png");
  }

  void attack() {
    Arrow a = new Arrow(owner);
  }
}