int back=360;
float hue, i, colour, j, limit, diameter, opacity;
PFont t;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(back);
  title();
  diameter=20;
  opacity=100;
  j=width-30;
  limit=30+(diameter/2);
  t= createFont("Serif", 14);
  textFont(t);
  noFill();
}

void draw() {
  i=0;
  palette();
}

void mouseDragged() {
  //we want the whole brush to be outside the palette
  //so, it's 30 for the palette, plus half the radius, so 30+10
  if (mouseX>limit) {
  noStroke();
  ellipse(mouseX, mouseY, diameter, diameter);
  }
}

void mouseClicked() {
  if ((mouseX<=30)&&(mouseY<=j)) {
    colour=map(mouseY, 0, j, 0, 360);  
    fill(colour, 100, 100, opacity);
  }
  else
  {
    if ((mouseX<=30)&&(mouseY>j)) {
      fill(back);
    }
  }
}

void keyPressed() {
  if ((diameter>=2)&&(diameter<=width)) {
    if (key=='+') diameter=diameter+2;
    if (key=='-') diameter=diameter-2;
      else {
        if (key=='0') {
          background(back);
          title();
          palette();
        }
    }
  }
}


void title() {
  fill(0);
  text("This is a paint equivalent. Choose a color.", 50, 20);
  text("Change the size of the brush by pressing '+' and '-' respectively", 50, 35);
  text("Press '0' to clear canvas", 50, 50);
} 

void palette() {
    while (i<=(height-30)) {
    stroke(0);
    hue=map(i, 0, height-30, 0, 360);
    stroke(hue, 100, 100);
    line(0, i, 30, i);
    i++;
  }
}
  
  
    
    
    
    
