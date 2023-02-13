class Button {
  //Member Variables
  int x, y, w, h;
  char val;
  color c1, c2, c3;
  boolean on;

  //Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.val=val;
    c1=color(#CE686A);
    c2=color(#CE3A3D);
    c3=color(#67B77A);
    on=false;
  }

  //Member variables
  void display() {
    textSize(15);
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    if (on && val =='=') {
      fill(#10A233);
    } else if (val == '=') {
      fill(c3);
    }
    rect(x, y, w, h, 5);

    fill(0);
    if (val == '=') {
      text(val, x+70, y+30);
    } else if ( val == 'C') {
      text(val, x+70, y+30);
    } else if (val== '√') {
      text(val, x+40, y+30);
    } else if (val== 'π') {
      text(val, x+40, y+30);
    } else if (val== 'S') {
      text(val, x+40, y+30);
    } else if (val== '%') {
      text(val, x+40, y+30);
    } else {
      text(val, x+30, y+30);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x && mx < x + w && my > y && my < y + h);
  }
}
