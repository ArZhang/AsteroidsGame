class Bullet extends Floater
{
  public Bullet(SpaceShip bob)
  {
     corners=0;
      myCenterX=bob.getX();
      myCenterY=bob.getY();
      xCorners = new int[corners];
      yCorners = new int[corners];
      myColor=150;
      myDirectionX=5*bob.getDirectionX()+3*Math.cos(bob.getPointDirection()*(Math.PI/180));
      myDirectionY=5*bob.getDirectionX()+3*Math.cos(bob.getPointDirection()*(Math.PI/180));
      myPointDirection=bob.getPointDirection();
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
    public void move()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;  

  }   
  public void show()
  {
     fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    ellipse((float)myCenterX,(float)myCenterY,10,10);
  }
}
