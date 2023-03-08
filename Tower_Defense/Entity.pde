ArrayList<Entity> entities = new ArrayList<Entity>();

abstract class Entity { //only Characters. No projectiles/weapons

  PVector position;
  PVector velocity; // depending on dir
  PVector direction;
  PVector standardOrientation;
  PVector standardPosition;
  float angle;
  float speed;
  float maxSpeed;

  PImage image;
  float size = defaultCharacterSize; //TODO: change to accurate value when picture
  //int weaponSize;
  //PImage weaponImage;
  Weapon weapon;

  float attackDamage;
  float maxHealth;
  float health;
  //float attackSpeed; //not used
  float attackDelay; //in sec TODO: calculated from attackSpeed
  int lastAttack;
  //float attackRange;
  float focusRange;
  //float rotationSpeed; //not used
  boolean isFocused = false;
  boolean ready; //does not effect attack delay
  Entity focusedEntity;
  
  Entity(float x_, float y_) {
    position = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    direction = new PVector(0, 0);
    entities.add(this);
  }

  void update() {
    //direction.normalize();
    velocity = direction.copy().setMag(speed);
    position.add(velocity);
    angle = direction.heading(); 

    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);   
    image(image, 0, 0, size, size);
    //displayWeapon();
    popMatrix();
  }

  void attack() {
  }
  void displayWeapon() {
  }
  void die() { //TODO Units can't die!
  }

  void getHit(float dmg) {
    blood(position, dmg/maxHealth);
    health -= dmg;
    if (health <= 0) {
      die();
    }
  }
}