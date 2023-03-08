ArrayList<Weapon> weapons = new ArrayList<Weapon>();

abstract class Weapon {  //damage always calculated from holder: weapon drop does not work with this system

  PVector position; //not used
  PVector relPosition = new PVector(0, 0);
  float angle;
  float ownAngle;
  float maxAngle;
  float minAngle;
  PImage image;
  float l, w;
  float range;
  Entity owner;  

  ArrayList<Entity> targetGroup;

  Weapon(Entity owner_) {
    owner = owner_;
    weapons.add(this);
    
    if (friendlyFire == true) {
      targetGroup = entities;
    } else if (owner instanceof Unit) {
      targetGroup = enemies;
    } else if (owner instanceof Enemy) {
      targetGroup = units;
    }    
  }

  void update() {
    angle = owner.angle + ownAngle;
    //position = owner.position.copy().add(relPosition);
    pushMatrix();
    translate(owner.position.x, owner.position.y);  // owner.position as ankerpoint
    rotate(angle);                                  // not pretty but works
    translate(relPosition.x, relPosition.y);        //
    image(image, 0, 0, l, w);
    popMatrix();
  }
  
  void attack() {
  }

}