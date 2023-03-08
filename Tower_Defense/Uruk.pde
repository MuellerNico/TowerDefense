class Uruk extends Enemy {

  Uruk(float x_, float y_) {
    super(x_, y_);

    //balancing
    maxHealth = 200;
    health = maxHealth;
    attackDamage = 100;
    maxSpeed = 2;
    image = loadImage("source/graphics/att01.png");
  }

  void update() {
    super.update();
    speed = maxSpeed;
  }
  
  /*@Override
  void getHit(float dmg){
    blood(position, dmg/100);
    
    health -= dmg;
    if (health <= 0) {
      die();
    }
  }*/
}