
class Sword extends Weapon {

  float maxAngle;
  float minAngle;
  float timePerSwing; //int sec
  float swingSpeed;
  float swingChange = 0;

  PVector hitPoint;

  Sword(Entity owner_) {
    super(owner_);
    l = 100;
    w = 100;
    timePerSwing = 0.2;
    maxAngle = radians(60);
    minAngle = -radians(60);
    println("maxA: " + maxAngle + " minA: "+minAngle);
    ownAngle = 0;
    swingSpeed = (maxAngle-minAngle)/(timePerSwing*60);

    relPosition.set(defaultCharacterSize*3/2, defaultCharacterSize/3); //TODO: looks weird
    range = l + owner.size/2;
    image = loadImage("source/graphics/weapons/sword01_withHand.png");
  }

  void update() {
    println(ownAngle);
    super.update();
    if (swingChange != 0) {
      swing();
      hitPoint = owner.position.copy().add(PVector.fromAngle(angle).setMag(range)); // URGHHHH but works (: TODO: NOT ACCURATE
      ellipse(hitPoint.x, hitPoint.y, 15, 15);
      if (testCollision(hitPoint, owner.focusedEntity)) {
        owner.focusedEntity.getHit(owner.attackDamage);
      }
    }
  }

  void swing() {
    if (ownAngle+swingChange < minAngle) {
      ownAngle = minAngle;
      swingChange = 0;
    } else if (ownAngle-swingChange > maxAngle) {
      ownAngle = maxAngle;
      swingChange = 0;
    } else {
      ownAngle += swingChange;
    }
  }

  void attack() {
    swing();

    if (swingChange == 0) {
      if (ownAngle == 0) {
        ownAngle = minAngle;
        swingChange = swingSpeed;
      } else {
        swingChange = -swingSpeed*ownAngle/abs(ownAngle);
      }
    } else {
      swingChange *= -1;
    }
  }
}
