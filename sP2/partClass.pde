class Particle {
  float x,y,xd,yd,r,xv,yv,tv,xa,ya,ta,a,mxv,myv,c1,c2;
  float mv = 5;


  Particle() {
    x=random(0, xBorder-pr/2);
    y=random(0, yBorder-pr/2);
  }



  void display() {
    c1 = map(tv,0,mv,15,255);
    c2 = map(tv,0,mv,50,255);
    fill(c1,c2);
    noStroke();
    ellipse(x, y, pr, pr);
  }



  void update() {
    xd=(mmx-x);
    yd=(mmy-y);
    r = sqrt(pow(xd, 2)+pow(yd, 2));
    a = abs(degrees(atan(yd/xd)));
    tv=sqrt(pow(xv, 2)+pow(yv, 2));

    if (mousePressed) {
      xa=-xd/(r*2);
      ya=-yd/(r*2);
    } else {
      xa=0;
      ya=0;
    }

    xv=xv+xa;
    yv=yv+ya;
    

    x=x+xv;
    y=y+yv;



    if (x<0+pr/2 || x>xBorder-pr/2) {
      xv=-xv;
    }
    if (y<0+pr/2 || y>yBorder-pr/2) {
      yv=-yv;
    }
  }




  void debug() {
    fill(255);
    //X distance
    strokeWeight(1);
    stroke(255, 0, 0);
    line(x, y, mmx, y);

    //Y distance
    stroke(0, 255, 0);
    line(mmx, y, mmx, mmy);

    //Z distance
    stroke(0, 0, 255);
    line(x, y, mmx, mmy);
    
    //Print X,Y,V
    println("("+int(x)+", "+int(y)+") - a: "+String.format("%.2f", a)+" - tv: "+tv);
    
    
    
    //Angle
    text("a:"+int(a),x-10,y-10);
    
    //Total velocity
    text("tv:"+String.format("%.4f", tv),x-10,y-20);
    
    //Velocity arrow
    mxv = map(xv,-mv,mv,-1,1);
    myv = map(yv,-mv,mv,-1,1);
    stroke(50,100,200);
    strokeWeight(2);
    line(x,y,x+mxv*50,y+myv*50);
    
  }
}
