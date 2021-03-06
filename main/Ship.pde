class Ship{
  float health, attack;
  float basespeed, speed, x, y, direction;
  int reward;
  Sector target;
  PImage avatar;
  boolean inplay = true;
  public Ship(){}
  public Ship(int hp, int atk, float spd, int rwd){
    health = hp;
    attack = atk;
    speed = spd;
    basespeed = spd;
    reward = rwd;
    x = 20;
    y = 0;
    direction = PI/2;
    target = grid.world[0][0];
  }
  
  void move(){
    x += speed*(float)2/6*cos(direction);
    y += speed*(float)2/6*sin(direction);
    if(sqrt(sq(x-target.cp.x)+sq(y-target.cp.y))<1)target=target.next;
  }

  void turn(){
    float angle = (atan2(target.cp.y-y,target.cp.x-x)-direction);
    //float angle = (atan2(50-x,50-y)-direction);
    //println("First angle calculation: " + angle);
    if(angle>90)direction -= -180;
    if(angle<-90)direction += 180;
    float max = (10*(speed*(float)2/6))/(10*PI);
    //println("Max is: "+max);
    if(angle>max)angle = max;
    if(angle<-1*max)angle = -1*max;
    //println("Second angle calculation: " + angle);
    direction+=angle;
  }
  void act(){
    turn();
    move();
    //println(target.y);
    if(target.y==560){
      wallhp -= attack;
      attack = 0;
      ships.remove(this);
      bcount --;
    }
    pushMatrix();
    translate(x,y);
    //println(x+" "+y);
    rotate(direction+PI/2);
    image(avatar,0,0);
    popMatrix();
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  void setX(float n) {
    x = n;
  }
  void setY(float n) {
    y = n;
  }
  void setHealth(float n) {
    health = n;
  }
  float getHealth() {
    return health;
  }
  void setDamage(float n) {
    attack = n;
  }
  float getDamage() {
    return attack;
  }
  boolean getInplay() {
    return inplay;
  }
  
  void takeDamage(float n) {
    System.out.println(health);
    health = health - n;
    if (health <=0) {
      ships.remove(this);
      bcount --;
      this.inplay = false;
      resources += reward;
    }
  }
}
