// 01 サウンドの再生
// import processing.sound.*;
// SoundFile soundfile;
 
// void setup() {
//   soundfile = new SoundFile(this, "sound.wav");
//   soundfile.loop();
// }
 
// void draw(){
// }
 
// // 02 音量とスピードをマウスで変化
// import processing.sound.*;
// SoundFile soundfile;
 
// void setup() {
//   size(800, 600);
//   soundfile = new SoundFile(this, "sound.aiff");
//   soundfile.loop();
// }
 
// void draw() {
//   background(0);
//   float rate = map(mouseX, 0, width, 0.0, 2.0);
//   float amp = map(mouseY, 0, height, 1.0, 0.0);
//   soundfile.rate(rate);
//   soundfile.amp(amp);
// }
 
// // 03 ディレイ
// import processing.sound.*;
// SoundFile soundfile;
// Delay delay;
 
// void setup() {
//   size(800, 600);
//   soundfile = new SoundFile(this, "sound.aiff");
//   delay = new Delay(this);
//   soundfile.loop();
//   delay.process(soundfile, 5);
// }
 
// void draw() {
//   background(0);
//   float delayTime = map(mouseY, 0, height, 0.0001, 1.0);
//   delay.time(delayTime);
//   float feedback = map(mouseX, 0, width, 0.0, 0.9);
//   delay.feedback(feedback);
// }
 
// //04 音量を解析
// import processing.sound.*;
// SoundFile soundfile;
// Amplitude rms;
 
// void setup() {
//   size(800, 600);
//   fill(0, 127, 255);
//   noStroke();
//   soundfile = new SoundFile(this, "sound.aiff");
//   soundfile.loop();
//   rms = new Amplitude(this);
//   rms.input(soundfile);
// }
 
// void draw() {
//   background(0);
//   float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);
//   ellipse(width/2, height/2, diameter, diameter);
// }
 
// //05 音量を解析 (サウンド入力)
// import processing.sound.*;
// AudioIn input;
// Amplitude rms;
 
// void setup() {
//   size(800, 600);
//   fill(0, 127, 255);
//   noStroke();
//   input = new AudioIn(this, 0);
//   input.start();
//   rms = new Amplitude(this);
//   rms.input(input);
// }
 
// void draw() {
//   background(0);
//   float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);
//   ellipse(width/2, height/2, diameter, diameter);
// }
 
// //06 FFT基本
// import processing.sound.*;
// AudioIn in;
// FFT fft;
// int bands = 1024;
// float scale = 20.0;
 
// void setup() {
//   size(800, 600);
//   in = new AudioIn(this, 0);
//   in.start();
//   fft = new FFT(this, bands);
//   fft.input(in);
// }
 
// void draw() {
//   background(0);
//   fft.analyze();
//   noFill();
//   stroke(255);
//   beginShape();
//   for (int i = 0; i < bands; i++) {
//     vertex(i * width/float(bands), height - fft.spectrum[i] * height * scale);
//   }
//   endShape();
// }
 
// //06 FFT : 明度で表現
// import processing.sound.*;
// AudioIn in;
// FFT fft;
// int bands = 128;
// float scale = 5000.0;
 
// void setup() {
//   size(800, 600);
//   noStroke();
//   in = new AudioIn(this, 0);
//   in.start();
//   fft = new FFT(this, bands);
//   fft.input(in);
// }
 
// void draw() {
//   background(0);
//   fft.analyze();
//   float w = width/float(bands)/2.0;
//   for (int i = 0; i < bands; i++) {
//     fill(fft.spectrum[i] * scale);
//     rect(width/2.0 + i * w, 0, w, height);
//     rect(width/2.0 - i * w, 0, w, height);
//   }
// }
 
// //07 FFT : 明度と色相で表現
// import processing.sound.*;
// AudioIn in;
// FFT fft;
// int bands = 128;
// float scale = 5000.0;
 
// void setup() {
//   size(800, 600);
//   colorMode(HSB, 360, 100, 100, 100);
//   noStroke();
//   in = new AudioIn(this, 0);
//   in.start();
//   fft = new FFT(this, bands);
//   fft.input(in);
// }
 
// void draw() {
//   background(0);
//   fft.analyze();
//   float w = width/float(bands)/2.0;
//   for (int i = 0; i < bands; i++) {
//     float hue = 360/float(bands) * i;
//     fill(hue, 100, fft.spectrum[i] * scale);
//     rect(width/2.0 + i * w, 0, w, height);
//     rect(width/2.0 - i * w, 0, w, height);
//   }
// }
 
 
// //08 FFT : 円の大きさで表現
// import processing.sound.*;
// AudioIn in;
// FFT fft;
// int bands = 128;
// float scale = 40000.0;
 
// void setup() {
//   size(800, 600, P2D);
//   noStroke();
//   blendMode(ADD);
//   colorMode(HSB, 360, 100, 100, 100);
//   in = new AudioIn(this, 0);
//   in.start();
//   fft = new FFT(this, bands);
//   fft.input(in);
// }
 
// void draw() {
//   background(0);
//   fft.analyze();
//   float w = width/float(bands)/2.0;
//   for (int i = 0; i < bands; i++) {
//     float hue = 360/float(bands) * i;
//     fill(hue, 100, 6);
//     float diameter = fft.spectrum[i] * scale;
//     ellipse(width/2.0 + i * w, height/2.0, diameter, diameter);
//     ellipse(width/2.0 - i * w, height/2.0, diameter, diameter);
//   }
// }
 
//09 立方体でビジュアライズ
import processing.sound.*;
AudioIn in;
FFT fft;
int bands = 128;
float scale = 4000.0;
 
void setup() {
  size(800, 600, P3D);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  in = new AudioIn(this, 0);
  in.start();
  fft = new FFT(this, bands);
  fft.input(in);
}
 
void draw() {
  blendMode(ADD);
  background(0);
  fft.analyze();
  for (int i = 0; i < bands; i++) {
    float hue = map(i, 0, bands/4.0, 0, 360);
    fill(hue, 100, 100, 30);
    float boxSize = map(fft.spectrum[i], 0, 1, 0, scale);
    float rot = map(i, 0, bands, 0, PI*8);
    pushMatrix();
    translate(width/2, height/2);
    rotateX(rot+frameCount/frameRate);
    rotateY((rot+frameCount/frameRate)*1.2);
    box(boxSize);
    popMatrix();
  }
}