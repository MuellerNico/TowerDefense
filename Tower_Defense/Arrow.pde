class Arrow extends Projectile { 
 
  Arrow(Entity shooter) {
    super(shooter);
    
    w = 30;
    l = 4;
    speed = 15;
    image = loadImage("source/graphics/weapons/arrow01.png");
    
    position = shooter.position.copy();    
    velocity = shooter.direction.copy().setMag(speed);
    angle = velocity.heading();
  }
}