class planeta{
  Body body;
  float r;
    planeta(float r_, float x, float y){
    r = r_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 100;
    fd.friction = 0.03;
    fd.restitution = 0.1;
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-5,5),random(-10,-5)));
    body.setAngularVelocity(random(-2,2));
  }
  
  void applyForce(Vec2 vec) {
    body.applyForce(vec, body.getWorldCenter());
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float ang = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(ang);
    fill(255,0,0,75);
    noStroke();
    ellipse(0,0,r*2,r*2);
    popMatrix();
  }
}