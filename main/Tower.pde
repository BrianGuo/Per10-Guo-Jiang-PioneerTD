class Tower{
  PImage gun;
  float Xcor;
  float Ycor;
  PImage buoy;
  boolean fire = true;
  PImage projectile;
  float angle = 0;
  float firingspeed;
  float cost;
  Ship target;
  float radius = 100;
  float damage;
  
  public Tower() {
  }
  
  public Tower(PImage b, PImage g,PImage p,float n, float c,float d) {
    gun = g;
    buoy = b;
    projectile=p;
    firingspeed = n;
    cost = c;
    damage = d;
  }
  
  void setXcor(float a) {
    Xcor = a;
  }
  
  void setYcor(float a) {
    Ycor = a;
  }
  
  void setGun(PImage p) {
    gun = p;
  }
  
  void setBuoy(PImage p) {
    buoy = p;
  }
  void setProjectile(PImage p) {
    projectile=p;
  }
  float distanceToShip(Ship s){
    return sqrt(sq(Xcor+20-s.x)+sq(Ycor+20-s.y));
  }
  
  
  float getYcor() {
    return Ycor;
  }
  float getXcor() {
    return Xcor;
  }
  PImage getBuoy() {
    return buoy;
  }
  PImage getGun() {
    return gun;
  }
  
  PImage getProjectile() {
    return projectile;
  }
  float getFiringspeed() {
    return firingspeed;
  }
  void setFiringspeed(float n) {
    firingspeed = n;
  }
  float getAngle() {
    return angle;
  }
  void setAngle(float f ) {
    angle = f;
  }
  void setCost(float f) {
    cost = f;
  }
  float getCost() {
    return cost;
  }
  float getDamage() {
    return damage;
  }
  void setDamage(float f) {
    damage = f;
  }
  
  void fire(Ship s) {
    if (tick% firingspeed == 0) {
      System.out.println("reached this step");
      addProjectile(projectile,0,0,Xcor,Ycor,find(s), damage, s);
    }
  }
      
  float find(Ship s) {
    float result;
    if(s.getY() < (Ycor+20)) {
      result = atan((s.getX() - Xcor - 20)/(Ycor+20 - s.getY()));
    }
    else {
      result = (-1*atan((s.getX()-Xcor - 20)/(s.getY() - Ycor - 20))) + PI;
    }
    angle = result;
    return result;
  }


  boolean attack() {
      for (int i = 0; i < bcount; i++) {
         Ship s = ships.get(i);
         //print(radius);
         //println(dist(Xcor,Ycor,s.getX(),s.getY()));
          if(dist(Xcor,Ycor,s.getX(),s.getY())<radius) {
            //println("reached this step");
            fire(s);
            return true;
          }
      }
      return false;
      }    
}
