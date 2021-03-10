import processing.sound.*;
FFT fft;
int bands = 64;
float scale = 4000.0;
SoundFile soundfile;

 
void setup() {
  size(800, 600, P2D);
  noStroke();
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  soundfile = new SoundFile(this, "sound.wav");
  soundfile.loop();
  fft = new FFT(this, bands);
  fft.input(soundfile);
}
 
void draw() {
  background(0);
  fft.analyze();
  float w = width/float(bands)/2.0;
  for (int i = 0; i < bands; i++) {
    float hue = 360/float(bands) * i;
    fill(hue, 100, 6);
    float diameter = fft.spectrum[i] * scale;
    ellipse(width/2.0 + i * w, height/2.0, diameter, diameter);
    ellipse(width/2.0 - i * w, height/2.0, diameter, diameter);
  }
}