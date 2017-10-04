//your code here
//type would be NormalParticle --> Particle
Particle[] bob; //square brackets tell the type

void setup()
{
	size(500, 500);
	bob = new Particle[300];

	for (int i = 0; i < bob.length; i++)
	{
		bob[i] = new NormalParticle();
		bob[1] = new OddballParticle();
		bob[2] = new JumboParticle();
	}
	// bob[1] = new OddballParticle();
	// bob[2] = new JumboParticle();
}
void draw()
{
	for (int i = 0; i < bob.length/2; i++)
	{
		bob[i].show();
		bob[i].move();
	}
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

	public NormalParticle() 
	{
		myX = mouseX;
		myY = mouseY;
		mySpeed = Math.random()*10;
		myDirection = Math.PI*2*Math.random();
		myColor = (int)(Math.random()*256);
	}

	public void move() 
	{
		myX = myX + Math.cos((float)(myDirection*mySpeed));
		//myX = myX + cos((float)((Math.random()*PI)*mySpeed));
		myY = myY + Math.sin((float)(myDirection*mySpeed)); 
		//myY = myY + sin((float)((Math.random()*PI)*mySpeed));
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
	int myX, myY, mySize;

	public OddballParticle()
	{
		myX = 250;
		myY = 250;
	}

	public void show() 
	{
		rect(myX, myY, 50, 50);
	}

	public void move()
	{
		myX = myX + (int)(Math.random()*20);
		myY = myY + (int)(Math.random()*20);//sin((float)(myDirection*mySpeed)); 
	}
}


class JumboParticle extends NormalParticle //inherits from normal all veriables and most of functions //uses inheritance
{ //pulls functions/variables from the Normal Particle eg void move and void show
	//same as normal but just picture
	public void show() 
	{
		fill(126,56,189);
		noStroke();
		ellipse((float)myX, (float)myY, 90, 90);
	}

}

void mousePressed() {
	for (int i = 0; i < bob.length; i++)
	{
		bob[i] = new NormalParticle();
		bob[1] = new OddballParticle();
		bob[2] = new JumboParticle();
	}
}