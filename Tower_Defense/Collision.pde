boolean testCollision(Projectile p, Entity e) {
  return testCollision(p.position, e);
}

/*boolean testCollision(Entity e, Weapon w){
 float ex = e.position.x-e.size/2;  //getting upper left corner due to imagemode(CENTER); projectile 0 dimensions
 float ey = e.position.y-e.size/2;
 float wx = w.position.x-;
 float wy = w.position.y;
 
 if (px > ex && px < ex+e.size) {   
 if (py > ey && py < ey+e.size) {
 return true;
 } else {
 return false;
 }
 } else {
 return false;
 }
 }*/

boolean testCollision(PVector v, Entity e) {
  if (v.dist(e.position) < e.size) {
    return true;
  } else {
    return false;
  }
}