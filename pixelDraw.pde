square[][] sqs;
int a=8;
int rownum;
int colnum;

void setup() {
  size(1034, 150,OPENGL);
  rownum = 1034/(a+1)+1;
  colnum = 150/(a+1)+1;
  sqs = new square[rownum][colnum];
  for (int i=0;i<rownum;i++) {
    for ( int j=0;j<colnum;j++) {
      sqs[i][j] = new square(i*9, j*9, a);
    }
  }
}

void draw() {
  background(255);
  noStroke();
  for (int i=0;i<rownum;i++) {
    for ( int j=0;j<colnum;j++) {
     sqs[i][j].display();
     sqs[i][j].hovertest();
    }
  }
}

void mouseClicked() {
  for (int i=0;i<rownum;i++) {
    for ( int j=0;j<colnum;j++) {
      if(sqs[i][j].hover){
        sqs[i][j].visible = !sqs[i][j].visible;
      }
    }
  }
}

class square {
  boolean visible;
  int x;
  int y;
  int a;
  int alpha;
  int alpha2;
  boolean hover;

  square(int x, int y, int a) {
    this.x = x;
    this.y = y;
    this.a = a;
    visible = true;
  }

  void display() {
    if (visible) {
      alpha = 255;
    } 
    else {
      alpha = 0;
    }
    fill(#27a9e1, alpha);
    rect(x, y, a, a);
    //textSize(8);
  }

  void hovertest() {
    if (mouseX>=x && mouseX<=x+a && mouseY>=y && mouseY<=y+a) {
      hover = true;
    } 
    else {
      hover = false;
    }
  }
}

