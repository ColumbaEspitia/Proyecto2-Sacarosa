import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

int pant=0;
PImage inicio;
PImage instruccion;
PImage taza;
PImage copo;
PImage ladrillo;

Box2DProcessing box2d;

ArrayList<Boundary> boundaries;
ArrayList<ParticleSystem> systems;

void setup (){
  size(500,500);
  inicio = loadImage("p1.jpg");
  instruccion = loadImage("p2.jpg");
  taza = loadImage("taza.png");
  copo = loadImage("copito.png");
  ladrillo = loadImage("Ladrillo.jpg");
  smooth();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  boundaries = new ArrayList<Boundary>();
  systems = new ArrayList<ParticleSystem>();
  //Barreras
  boundaries.add(new Boundary(50,300,100,10));
  boundaries.add(new Boundary(150,250,100,10));
  boundaries.add(new Boundary(200,250,10,100));
  boundaries.add(new Boundary(200,350,100,10));
  boundaries.add(new Boundary(100,200,100,10));
  boundaries.add(new Boundary(55,150,10,100));
  boundaries.add(new Boundary(150,150,100,10));
  boundaries.add(new Boundary(300,250,100,10));
  boundaries.add(new Boundary(345,275,10,50));
  boundaries.add(new Boundary(350,300,100,10));
  boundaries.add(new Boundary(350,350,100,10));
  boundaries.add(new Boundary(395,375,10,50));
  boundaries.add(new Boundary(275,175,100,10));
  boundaries.add(new Boundary(275,150,10,50));
  boundaries.add(new Boundary(300,250,100,10));
  boundaries.add(new Boundary(400,200,100,10));
  boundaries.add(new Boundary(400,225,10,50));
  boundaries.add(new Boundary(445,150,10,100));
  boundaries.add(new Boundary(375,125,100,10));
  boundaries.add(new Boundary(280,215,10,30));
  boundaries.add(new Boundary(255,215,50,10));
  boundaries.add(new Boundary(230,215,10,30));
  boundaries.add(new Boundary(450,325,75,10));
  boundaries.add(new Boundary(485,325,10,100));
  boundaries.add(new Boundary(475,250,50,10));
  boundaries.add(new Boundary(25,250,50,10));
  boundaries.add(new Boundary(175,100,50,10));
  boundaries.add(new Boundary(155,125,10,50));
  //Taza
  boundaries.add(new Boundary(230,425,5,50));
  boundaries.add(new Boundary(290,425,5,50));
  boundaries.add(new Boundary(260,450,65,5));
}

void draw(){
  
  switch(pant){
    case 0:
    image(inicio,0,0,500,500);
    if(key == ENTER){
      pant = 1;
    }
    break;
    
    case 1:
    image(instruccion,0,0,500,500);
    if(key == 'A' || key == 'a'){
      pant = 2;
    }
    break;
    
    case 2:
    background(#F1CB48);
    box2d.step();
    for (ParticleSystem system: systems) {
      system.run();
      int n = (int) random(0,2);
      system.addParticles(n);
    }  

    for (Boundary wall: boundaries) {
      wall.display();
    }
    pushMatrix();
    rectMode(CENTER);
    fill(#FF0505,25);
    noStroke();
    rect(width/2,25,width,50);
    popMatrix();
    image(taza,275,450,120,115);
    break;
    
  }
}

void mousePressed() {
  if(mouseY < 50){
    systems.add(new ParticleSystem(0, new PVector(mouseX,mouseY)));
  }
}
