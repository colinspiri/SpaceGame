PShape getShipShape() {
  PShape ship = createShape(GROUP);
  
  // body
  PShape body = createShape();
  int topX = 30;
  int topY = 50;
  int botX = 80;
  int botY = 50;
  int noseLength = 200;
  // top
  body.beginShape();
  body.vertex(-topX, -topY, 0);
  body.vertex( topX, -topY, 0);
  body.vertex(0, 0, -noseLength);
  // right
  body.vertex( topX, -topY, 0);
  body.vertex( botX, botY, 0);
  body.vertex(0, 0, -noseLength);
  // bottom
  body.vertex( botX, botY, 0);
  body.vertex(-botX, botY, 0);
  body.vertex(0, 0, -noseLength);
  // left
  body.vertex(-botX, botY, 0);
  body.vertex(-topX, -topY, 0);
  body.vertex(0, 0, -noseLength);
  body.endShape(CLOSE);
  
  // wings
  PShape wingLeft = createShape();
  PShape wingRight = createShape();
  int wingX = (topX + botX)/2;
  int wingLength = 100;
  float wingDepth = 0.3;
  // left wing
  wingLeft.beginShape();
  wingLeft.vertex(wingX, 0, 0);
  wingLeft.vertex(wingX - wingDepth*wingX, 0, -wingDepth*noseLength);
  wingLeft.vertex(wingX + wingLength, 0, -wingDepth*noseLength/2);
  wingLeft.endShape(CLOSE);
  // right wing
  wingRight.beginShape();
  wingRight.vertex(-wingX, 0, 0);
  wingRight.vertex(-wingX + wingDepth*wingX, 0, -wingDepth*noseLength);
  wingRight.vertex(-wingX - wingLength, 0, -wingDepth*noseLength/2);
  wingRight.endShape(CLOSE);
  
  // fin
  PShape fin = createShape();
  float finDepth = 0.4;
  int finHeight = 40;
  fin.beginShape();
  fin.vertex(0, -topY, 0);
  fin.vertex(0, -topY + topY*finDepth, -finDepth*noseLength);
  fin.vertex(0, -topY - finHeight, -finDepth*noseLength/2);
  fin.endShape(CLOSE);
  
  // add components to shape
  ship.addChild(body);
  ship.addChild(wingLeft);
  ship.addChild(wingRight);
  ship.addChild(fin);
  
  ship.scale(0.4);
  
  return ship;
}
