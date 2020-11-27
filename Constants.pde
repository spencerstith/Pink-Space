float xOff = 0;
int scale = 10;
int w = 1200;
int h = 900;
int cols = w / scale;
int rows = h / scale;
float[][] terrain = new float[cols][rows];
float upperBound = 0;
float lowerBound = 0;

color v = color(173, 59, 173);
color m = color(255, 138, 179);
