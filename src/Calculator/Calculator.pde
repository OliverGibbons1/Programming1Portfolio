//Oliver Gibbons | Nov 2022 | Calculator
Button[] numButton = new Button[10];
Button[] opButton = new Button[12];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left =true;

void setup() {
  size(420, 540);
  background(150);
  //First row
  opButton[0] = new Button(20, 460, 60, 60, '.');
  numButton[0] = new Button(100, 460, 60, 60, '0');
  opButton[1] = new Button(180, 460, 60, 60, '±');
  //Second row
  numButton[1] = new Button(20, 380, 60, 60, '1');
  numButton[2] = new Button(100, 380, 60, 60, '2');
  numButton[3] = new Button(180, 380, 60, 60, '3');
  //Third row
  numButton[4] = new Button(20, 300, 60, 60, '4');
  numButton[5] = new Button(100, 300, 60, 60, '5');
  numButton[6] = new Button(180, 300, 60, 60, '6');
  //Forth row
  numButton[7] = new Button(20, 220, 60, 60, '7');
  numButton[8] = new Button(100, 220, 60, 60, '8');
  numButton[9] = new Button(180, 220, 60, 60, '9');
  //Other butons
  opButton[2] = new Button(260, 460, 140, 60, '=');
  opButton[3] = new Button(260, 380, 60, 60, '+');
  opButton[4] = new Button(340, 380, 60, 60, '-');
  opButton[5] = new Button(260, 300, 60, 60, '*');
  opButton[6] = new Button(340, 300, 60, 60, '/');
  opButton[7] = new Button(260, 220, 140, 60, 'C');
  //top row
  opButton[8] = new Button(20, 140, 80, 60, '√');
  opButton[9] = new Button(120, 140, 80, 60, 'π');
  opButton[10] = new Button(220, 140, 80, 60, 'S');
  opButton[11] = new Button(320, 140, 80, 60, '%');
}

void draw() {
  background(#7b7060);
  for (int i=0; i<numButton.length; i++) {
    numButton[i].display();
    numButton[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButton.length; i++) {
    opButton[i].display();
    opButton[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("Keycode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 67) {
    handleEvent("c", false);
  } else if (keyCode == 46) {
    handleEvent(".", false);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 111) {
    handleEvent("/", false);
  } else if (keyCode == 106) {
    handleEvent("*", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 10 || keyCode == 61) {
    preformCalculation();
  }
}

void handleEvent (String val, boolean num) {
  if (num) {
    if (dVal .equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l= float(dVal);
    } else {
      r= float(dVal);
    } //all opButtons here
  } else if (val.equals("c")) {
    dVal = "0.0";
    op = ' ';
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0.0";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0.0";
    left = false;
  } else if (val.equals("*")) {
    op = '*';
    dVal = "0.0";
    left = false;
  } else if (val.equals("/")) {
    op = '/';
    dVal = "0.0";
    left = false;
  }
}


void mouseReleased() {
  for (int i=0; i<numButton.length; i++) {
    if ( numButton[i].on && dVal.length() <43) {
      handleEvent(str(numButton[i].val), true);
    }
  }

  for (int i=0; i<opButton.length; i++) {
    if ( opButton[i].on && opButton[i].val == 'C') {
      handleEvent("c", false);
    } else if ( opButton[i].on && opButton[i].val == '=') {
      preformCalculation();
    } else if ( opButton[i].on && opButton[i].val == '+') {
      handleEvent("+", false);
    } else if ( opButton[i].on && opButton[i].val == '-') {
      handleEvent("-", false);
    } else if ( opButton[i].on && opButton[i].val == '*') {
      handleEvent("*", false);
    } else if ( opButton[i].on && opButton[i].val == '/') {
      handleEvent("/", false);
    } else if ( opButton[i].on && opButton[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if ( opButton[i].on && opButton[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if ( opButton[i].on && opButton[i].val == 'S') {
      if (left) {
        l= sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if ( opButton[i].on && opButton[i].val == '%') {
      if (left) {
        l = l/100;
        dVal = str (l);
      } else {
        r = r /100;
        dVal = str (r);
      }
    } else if (opButton[i].on && opButton[i].val == '±') {
      if (left == true) {
        l=l*-1;
        dVal = dVal;
        dVal = str(l);
      } else {
        r=r*-1;
        dVal = str(r);
      }
    } else if ( opButton[i].on && opButton[i].val == '.') {
      handleEvent(".", false);
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + " Left:" + left);
}

void updateDisplay() {
  fill(#958A7A);
  rect(20, 20, 380, 100, 5);
  fill(0);
  textAlign(RIGHT);


  //Find the max length of a string
  if (dVal.length()<20) {
    textSize(20);
  } else if (dVal.length()<30) {
    textSize(15);
  } else if (dVal.length()<43) {
    textSize (15);
  } else if (dVal.length()<100) {
    text("too many numbers, try something smaller and clear", 370, 100);
  }
  text(dVal, width-70, 60);
}

void preformCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r ;
  } else if (op == '*') {
    result = l * r ;
  } else if (op == '/') {
    result = l / r ;
  }
  dVal = str(result);
  l = result;
  left = true;
}
