void setup() {
  size(600, 600, P3D);
  populateNoise();
}

void draw() {
  background(0);
  //noStroke();
  translate(width * 0.5, height * 0.5);
  rotateX(PI/3);
  translate(-w * 0.5, -h * 0.5);
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      fill(getColorValue(terrain[x][y]));
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, y * scale + scale, terrain[x][y + 1]);
    }
    endShape();
  }
  
  // Add stars
  stroke(255);
  for (int i = 0; i < 100; i++) {
    strokeWeight(random(3));
    point(random(100, 1100), 0, random(300));
  }
  
  noLoop();
}

color getColorValue(float noiseVal) {
  float r = map(noiseVal, lowerBound, upperBound, red(v), red(m));
  float g = map(noiseVal, lowerBound, upperBound, green(v), green(m));
  float b = map(noiseVal, lowerBound, upperBound, blue(v), blue(m));
  return color(r, g, b);
}

void populateNoise() {
  float xOff = 0;
  float yOff = 0;

  for (int y = 0; y < rows; y++) {
    xOff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xOff, yOff), 0, 1, -100, 100);
      xOff += 0.05;
      
      if (terrain[x][y] > upperBound) {
        upperBound = terrain[x][y];
      } else if(terrain[x][y] < lowerBound) {
        lowerBound = terrain[x][y];
      }
    }
    yOff += 0.05;
  }
}
