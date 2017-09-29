//your code here
NormalParticle bob = new NormalParticle();

void setup()
{
	size(500, 500);
}
void draw()
{
	bob.move();
	bob.show();
	//your code here
}
class NormalParticle
{
	double myX, myY, speed, angle;
	int Color;

	NormalParticle() 
	{
		myX = (int)(Math.random()*300);
		myY = (int)(Math.random()*300);
		speed = Math.random()*10;
		angle = MATH.PI*2*Math.random();
		// x = y = 250;
		// speed = 20; 
		Color = (int)(Math.random()*256);
		// angle = Math.random()*361;
	}

	void move() 
	{
		x = x + cos(angle*speed);
		y = y + sin(angle*speed); 
	}

	void show()
	{
		fill(Color);
		ellipse(x, y, 10 , 10);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

