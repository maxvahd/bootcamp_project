class Snake
{
  PVector v;
  PVector Pos;
  ArrayList<PVector> next;
  int dX;
  int dY;
  int body;
  
  Snake()
  {
    Pos = new PVector(20,20);
    v = new PVector();
    next = new ArrayList<PVector>();
    body = 0;
  }
  
  void growth()
  {
    next.add(Pos.copy());
    //Aligns snake in the grid of the sketch
    Pos.x = Pos.x + (v.x*b);
    Pos.y = Pos.y + (v.y*b);
    dX = int(v.x);
    dY = int(v.y);
    
    if(Pos.x == width || Pos.y == height)
    {
      lose = true;
    }
    if (Pos.x == 0 || Pos.y == 0)
    {
      lose = true;
    }
    
    if (next.size() > body)
    {
      next.remove(0);
    }

    for (PVector pPos : next)
    {
      //if snake hits itself the game ends
      if (pPos.x == Pos.x && pPos.y == Pos.y)
      {
        lose = true;
        if (body > highscore)
        {
          highscore = body;
        }
      }
    }
  }
  
  void check()
  {
    if (Pos.x == food.x && Pos.y == food.y)
    {
      body++;
      if (speed > 5) speed--;
      sound.play();
      changeFood();
     }
  }
  
  void show()
  {
    noStroke();
    fill(#8AC961);
    //adds random values to the corners of the quadrilateral to make the snake slither
    quad(Pos.x + random(-2,2),Pos.y + random(-2,2),
    Pos.x + b + random(-2,2), Pos.y + random(-2,2),
    Pos.x + b + random(-2,2), Pos.y + b + random(-2,2),
    Pos.x + random(-2,2), Pos.y + b + random(-2,2));
    //rect(pos.x,pos.y,b,b);
    for (PVector pPos : next)
    {
      quad(pPos.x + random(-2,2),pPos.y + random(-2,2),
      pPos.x + b + random(-2,2), pPos.y + random(-2,2),
      pPos.x + b + random(-2,2), pPos.y + b + random(-2,2),
      pPos.x + random(-2,2), pPos.y + b + random(-2,2));
    }
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    //states which key is pressed and prevents the snake from moving backwards onto itself
    if (keyCode == UP && snake.dY != 1)
    {
      snake.v.x = 0;
      snake.v.y = -1;
    }
    else if (keyCode == DOWN && snake.dY != -1)
    {
      snake.v.x = 0;
      snake.v.y = 1;
    }
    else if (keyCode == LEFT && snake.dX != 1)
    {
      snake.v.x = -1;
      snake.v.y = 0;
    }
    else if (keyCode == RIGHT && snake.dX != -1)
    {
      snake.v.x = 1;
      snake.v.y = 0;
    }
  }
}
