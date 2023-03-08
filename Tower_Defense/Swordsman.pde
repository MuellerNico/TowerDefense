class Swordsman extends MeleeUnit {

  Swordsman(float x_, float y_) {
    super(x_, y_);
    
    weapon = new Sword(this);
    
    maxHealth = 150;
    health = maxHealth;
    attackDamage = 50;
    attackDelay = 1; //in sec    attackRange = weaponSize;
    focusRange = 500;
    //rotationSpeed = radians(90/30);
    maxSpeed = 3;

    standardOrientation = new PVector(1, 0);
    direction = standardOrientation.copy().normalize();
    standardPosition = new PVector(x_, y_);

    image = loadImage("source/graphics/def01.png");
  }

  void update() {
    super.update();
    Entity e = focusedEntity;
    if (isFocused == false) {
      returnToPosition();
      weapon.ownAngle = 0;
      searchFocus();
    } else if (position.dist(e.position) >= focusRange || e.health <= 0) {
      isFocused = false;
    } else if (position.dist(e.position) > weapon.range) {//locked on 
      adjustRotation(PVector.sub(e.position, position));
      speed = maxSpeed;
    } else {
      adjustRotation(PVector.sub(e.position, position));
      speed = 0;
      attack();
    }
  }


  void attack() {
    if (millis()-lastAttack > attackDelay*1000) {
      //focusedEntity.getHit(attackDamage);

      lastAttack = millis();
    }
  }

  void searchFocus() { // nearest
    float dist = focusRange;
    for (Entity e : enemies) {
      float newdist = position.dist(e.position);
      if (newdist <= dist) {
        dist = newdist;
        focusedEntity = e;
        isFocused = true;
      }
    }
  }

  void adjustRotation(PVector goal) { //TODO: actual rotation
    direction = goal.copy();
    direction.normalize();
  }

  void returnToPosition() {
    if (position.dist(standardPosition) > speed) {
      adjustRotation(PVector.sub(standardPosition, position));      
      speed = maxSpeed/2;
    } else {
      position = standardPosition.copy();
      direction = standardOrientation;
      speed = 0;
    }
  }
}
