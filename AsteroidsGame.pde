SpaceShip bob;
ArrayList <Asteroid> asteroids;
Bullet bill;
ArrayList <Bullet> bullets;
int c = 1;
public void setup() 
{
  size(800,800);
  bob=new SpaceShip();
  bob.setX(250);
  bob.setY(250);
  bob.setPointDirection(0);
  bob.setDirectionX(0.5);
  bob.setDirectionY(0.5);
  bill=new Bullet(bob);
  bill.setDirectionX(bob.getDirectionX());
  bill.setDirectionY(bob.getDirectionY());
  //a=new Asteroid();

  asteroids = new ArrayList ();
  for(int i=0;i<30;i++)
  {
    asteroids.add(new Asteroid());
  }

  bullets = new ArrayList ();
  bullets.add(new Bullet(bob));
}
public void draw() 
{
  background(0);
  bob.show();
  bob.move();
  bill.show();
  bill.move();
  for(int i=0;i<asteroids.size();i++)
  {
    asteroids.get(i).move();
    asteroids.get(i).show();
     if(dist(bob.getX(),bob.getY(),asteroids.get(i).getX(),asteroids.get(i).getY())<10||dist(bill.getX(),bill.getY(),asteroids.get(i).getX(),asteroids.get(i).getY())<10)
    {
      asteroids.remove(i);
    }
  }

    if(bill.getX()>width)
    {     
      bill.setX(bob.getX());
      bill.setY(bob.getY());      
      bill.setDirectionX(bob.getDirectionX());
      bill.setDirectionY(bob.getDirectionY());

    }    
    else if (bill.getX()<0)
    {     
      bill.setX(bob.getX()); 
      bill.setY(bob.getY());
      bill.setDirectionX(bob.getDirectionX());
      bill.setDirectionY(bob.getDirectionY());
    }    
    if(bill.getX() >height)
    {    
      bill.setX(bob.getX());  
      bill.setY(bob.getY());
      bill.setDirectionX(bob.getDirectionX());
      bill.setDirectionY(bob.getDirectionY());
    }   
    else if (bill.getX() < 0)
    {     
      bill.setX(bob.getX()); 
      bill.setY(bob.getY());
      bill.setDirectionX(bob.getDirectionX());
      bill.setDirectionY(bob.getDirectionY());
    } 
}


public void keyPressed()
{
  //press a to accel
  if(key == 97)
  {
    bob.accelerate(3);
  }
  //press b to decel
  if(key == 98)
  {
    bob.setDirectionX(0.5);
    bob.setDirectionY(0.5);
  }
  //rotate press c
  if(key == 99)
  {
    bob.rotate(2);
  }
  //hyperspace press d
  if(key == 100)
  {
    bob.setX((int)(Math.random()*800));
    bob.setY((int)(Math.random()*800));
  }
  //right  press e
  if(key == 101)
  {
    bob.setX(bob.getX()+5);
  }
  //down press f
  if(key==102)
  {
    bob.setY(bob.getY()+5);
  }
  //press g up 
  if(key==103)
  {
    bob.setY(bob.getY()-5);
  }
  //press h left
  if(key==104)
  {
    bob.setX(bob.getX()-5);
  }
//press i to shoot
if(key==105)
{

bill.setDirectionX(5*bob.getDirectionX()+3*Math.cos(bob.getPointDirection()*(Math.PI/180)));
bill.setDirectionY(5*bob.getDirectionY()+3*Math.sin(bob.getPointDirection()*(Math.PI/180)));
  //bullets.add(new Bullet(bob));
  //bill.setDirectionX(5*bob.getDirectionX()+3*Math.cos(bob.getPointDirection()*(Math.PI/180)));
  //bill.setDirectionY(5*bob.getDirectionY()+3*Math.sin(bob.getPointDirection()*(Math.PI/180)));
}

}



class SpaceShip extends Floater  
{   

    public SpaceShip()
    {
      corners=3;
      myCenterX=0;
      myCenterY=0;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0]=-8;
      xCorners[1]=-8;
      xCorners[2]=16;
      yCorners[0]=-8;
      yCorners[1]=+8;
      yCorners[2]=0;
      myColor=150;
      myDirectionX=0;
      myDirectionY=0;
      myPointDirection=0;
    }   
    public int getX()
    {
      return (int)myCenterX;
    }
    public void setX(int x)
    {
      myCenterX = x;
    }
    public int getY()
    {
      return (int)myCenterY;
    }
    public void setY(int y)
    {
      myCenterY=y;
    }
    public double getDirectionX()
    {
      return myDirectionX;
    }
    public void setDirectionX(double x)
    {
      myDirectionX=x;
    }
    public double getDirectionY()
    {
      return myDirectionY;
    }
    public void setDirectionY(double y)
    {
      myDirectionY=y;
    }
    public double getPointDirection()
    {
      return (double)myPointDirection;
    }
    public void setPointDirection(int degrees)
    {
      myPointDirection=degrees;
    }
}
class Asteroid extends Floater
{
  private int myRot;
  public Asteroid()
    {
      corners=4;
      myCenterX=(int)(Math.random()*800);
      myCenterY=(int)(Math.random()*800);
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0]=10;
      xCorners[1]=-10;
      xCorners[2]=-10;
      xCorners[3]=10;
      yCorners[0]=10;
      yCorners[1]=10;
      yCorners[2]=-10;
      yCorners[3]=-10;
      myColor=100;
      myDirectionX=Math.random()*4;
      myDirectionY=Math.random()*4;
      myPointDirection=0.5;
      myRot=1;
    }   
     public int getX()
    {
      return (int)myCenterX;
    }
    public void setX(int x)
    {
      myCenterX = x;
    }
    public int getY()
    {
      return (int)myCenterY;
    }
    public void setY(int y)
    {
      myCenterY=y;
    }
    public double getDirectionX()
    {
      return myDirectionX;
    }
    public void setDirectionX(double x)
    {
      myDirectionX=x;
    }
    public double getDirectionY()
    {
      return myDirectionY;
    }
    public void setDirectionY(double y)
    {
      myDirectionY=y;
    }
    public double getPointDirection()
    {
      return (double)myPointDirection;
    }
    public void setPointDirection(int degrees)
    {
      myPointDirection=degrees;
    }
    public void move()
    {
      rotate(myRot);
      super.move();
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 