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
	}
	bob[1] = new OddballParticle();
	bob[2] = new JumboParticle();
}
void draw()
{
	background(0);
	for (int i = 0; i < bob.length; i++)
	{
		bob[i].show();
		bob[i].move();
		((JumboParticle)bob[2]).myX = mouseX-10;
		((JumboParticle)bob[2]).myY = mouseY-10;
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
		mySpeed = Math.random()*7;
		myDirection = Math.PI*2*Math.random();
	}

	public void move() 
	{
		myDirection += 0.02;
		myX += Math.cos(myDirection) * mySpeed; 
		//myX = myX + Math.cos((float)(myDirection*mySpeed));
		//myX = myX + cos((float)((Math.random()*PI)*mySpeed));
		myY += Math.sin(myDirection) * mySpeed;
		//myY = myY + Math.sin((float)(myDirection*mySpeed)); 
		//myY = myY + sin((float)((Math.random()*PI)*mySpeed)); 
	}

	public void show()
	{
		myColor = color ((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
		//myColor = color ((int)(Math.random()*255)+20, (int)(Math.random()*255)+30, (int)(Math.random()*255)+70);
		fill(myColor);
		noStroke();
		ellipse((float)myX, (float)myY, 5 , 5);
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
		myX = mouseX;
		myY = mouseY;
	}

	public void show() 
	{
		rect(myX, myY, 20, 20);
	}

	public void move()
	{
		myX = myX + (int)(Math.random()*2);
		myY = myY + (int)(Math.random()*2);//sin((float)(myDirection*mySpeed)); 
	}
}


class JumboParticle extends NormalParticle //inherits from normal all veriables and most of functions //uses inheritance
{ //pulls functions/variables from the Normal Particle eg void move and void show
	//same as normal but just picture
	public void show() 
	{
		fill(#bdbbba);
		noStroke();
		ellipse((float)myX, (float)myY, 40, 40);
		//happy face
		fill(0);
		ellipse((float)myX-15, (float)myY-5, 7, 7);
		ellipse((float)myX+15, (float)myY-5, 7, 7);
		arc((float)myX, (float)myY+5, 25, 25, 0, PI);
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