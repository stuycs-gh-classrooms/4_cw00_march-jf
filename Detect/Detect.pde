
int DOT_RESOLUTION = 20;
String PICFILE = "us-temps.png";

PImage art;
boolean showDots;
int resolution;

/*================================
  You should leave setup alone, with the exception
  of changing the size if not using the provided boats.jpg
  imgage.
================================*/
void setup() {
  size(770, 550);
  showDots = false;
  resolution = DOT_RESOLUTION;
  art = loadImage(PICFILE);
  art.loadPixels();
}//setup

/*================================
  You should leave draw alone.
================================*/
void draw() {
  background(255);
  image(art, 0, 0);
  if (showDots) {
    dots(art, resolution);
  }
}//draw


/*================================
  keyPressed
  `r`: reset back to the original image.
  `g`: grayScale the image
  `e`: perform edge detection on the image (this will be added tomorrow)
================================*/
void keyPressed() {
  if (key == 'h') {
    art = highlightRed(art);
  }
  else if (key == 'd') {
    showDots = !showDots;
  }//edge detect
  else if (key == 'r') {
    art = loadImage(PICFILE);
    art.loadPixels();
  }//reset image
  else if (key == 'g'){
    art = grayscale(art);
  }
}//keyPressed


/*================================
  Returns the grayScale value of a color
================================*/
float calculateGray(color c) {
  float g = int((red(c) + green(c) + blue(c)))/3;
  return g;
}//calculateGray
/*================================
  Returns the correct pixel index for img based on the provided x and y values.
================================*/
int getIndexFromXY(int x, int y, PImage img) {
  return y * img.width + x;
}//getIndexFromXY

PImage grayscale(PImage img){
  PImage newImg = new PImage(img.width, img.height);
  newImg.loadPixels();
  for ( int p = 0; p < img.pixels.length; p++){
    color c = img.pixels[p];
    newImg.pixels[p] = color((calculateGray(c)));
    //println(c);
 }
  newImg.updatePixels();
  return newImg;
}//grayscale

PImage highlightRed(PImage img) {
  PImage newImg = new PImage(img.width, img.height);
  newImg.loadPixels();
  for ( int p = 0; p < img.pixels.length; p++){
    color c = img.pixels[p];
    newImg.pixels[p] = color(calculateGray(c)/255*red(c),0,0);
    //println(c);
 }
  newImg.updatePixels();
  return newImg;
}//higlightRed



void dots(PImage img, int resolution) {

}//dots
