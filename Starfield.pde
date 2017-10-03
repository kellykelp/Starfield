//your code here
//type would be NormalParticle --> Particle
Particle[] bob;

void setup()
{
	size(500, 500);
	bob = new NormalParticle[300];
	for (int i = 0; i < bob.length; i++)
	{
		bob[i] = new NormalParticle();
	}
	bob[1] = new OddballParticle();
	//bob[2] = new JumboParticle();
}
void draw()
{
	background(0);
	for (int i = 0; i < bob.length; i++)
	{
		bob[i].show();
		bob[i].move();
	}

}
class NormalParticle implements Particle
{
	double myX, myY, mySpeed, myDirection;
	int myColor;

	NormalParticle() 
	{
		
		myX = 250;
		myY = 250;
		mySpeed = Math.random()*10;
		myDirection = Math.PI*2*Math.random();
		myColor = (int)(Math.random()*256);
	}

	public void move() 
	{
		myX = myX + cos((float)(myDirection)*(float)mySpeed);
		//myX = myX + cos((float)((Math.random()*PI)*mySpeed));
		myY = myY + sin((float)(myDirection)*(float)mySpeed); 
		//myY  =  myY + sin((float)((Math.random()*PI)*mySpeed));
	}

	public void show()
	{
		fill(myColor);
		noStroke();
		ellipse((float)myX, (float)myY, 10 , 10);
	}
}


interface Particle //helps group two different types into same group
{
	public void show();
	public void move();
}
class OddballParticle implements Particle //uses an interface
{
	int myX, myY;
	OddballParticle()
	{
		myX = 250;
		myY = 50;
	}

	public void show() 
	{
		rect(myX, myY, 50, 50);
	}

	public void move()
	{
		myX = myX + (int)(Math.random()*1);
		myY = myY + (int)(Math.random()*1);//sin((float)(myDirection*mySpeed)); 
	}
}
class JumboParticle extends NormalParticle //inherits from normal all veriables and most of functions //uses inheritance
{
	//same as normal but just picture
	public void show() 
	{
		fill(myColor);
		noStroke();
		ellipse((float)myX, (float)myY, 10 , 10);
	}

}

