import processing.sound.*;
int b = 20;
Snake snake;
PVector food;
boolean lose = true;
int speed = 10;
int highscore = 0;
PImage apple;
SoundFile sound;

void setup()
{
  size(600,600);
  snake = new Snake();
  food = new PVector();
  changeFood();
  sound = new SoundFile(this, "\\coin.wav");
}

void draw()
{
  background(50);
  if(!lose)
  {
    if (frameCount % speed == 0)
    {
      snake.growth();
    }
    snake.check();
    snake.show();
    fill(255,0,0);
    apple = loadImage("apple2.png");
    image(apple,food.x,food.y,b,b);
    //rect(food.x,food.y,b,b);
  }
  else
  {
    fill(255);
    textSize(48);
    textAlign(CENTER);
    text("Highscore:" + highscore,width/2,width/2);
  }
}

void changeFood()
{
  //Changes the position of the food in the sketch
  food.x = round(random(width));
  food.y = round(random(height));
  //Aligns food box with snake box
  food.x = round(food.x/b) * b;
  food.y = round(food.y/b) * b;
}

void mousePressed()
{
  if(lose)
  {
    snake = new Snake();
    changeFood();
    speed = 10;
    lose = false;
  }
}
