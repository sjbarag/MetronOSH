#include "TimerOne.h"

// pinouts
#define quarter    6
#define eighth     9
#define sixteenth 10
#define triplet   11

// frequencies
#define f4  3400
#define f8  3000
#define f16 2600
#define f3  2200

// beep length
#define bpLen     30

#define encoder0PinA 2
#define encoder0PinB 4

boolean changeBPM = false;
boolean ready = false;
int bpm = 120;
int dBPM = 0;
int sub = 0;

int encoder0Pos = 0;
int encoder0PinALast = LOW;
int n = LOW;

//debug
int mx = 0;
int mn = 999999;
double v = 0;

void setup()
{
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(quarter, OUTPUT);
  pinMode(eighth, OUTPUT);
  pinMode(sixteenth, OUTPUT);
  pinMode(triplet, OUTPUT);
  Timer1.initialize(1000000.00*(60.00/bpm)/12);
//  Timer1.attachInterrupt(beep);
  
  pinMode(encoder0PinA, INPUT);
  pinMode(encoder0PinB, INPUT);
  
  digitalWrite(encoder0PinA, HIGH);
  digitalWrite(encoder0PinB, HIGH);
  Serial.println("start");
}

void beep()
{

  
  /* ---------- beat timings ----------
    
  "sub"        |  |  |  |  |  |  |  |  |  |  |  |
  quarter      *
  eighth       *                 *
  sixteenth    *        *        *        *
  triplet      *           *           *
  */
  
  switch (sub)
  {
    case 0: 
      // haptic feedback
      tone(13, 1000, 75);
      
      // noises
      tone(quarter, f4, bpLen);
      tone(eighth, f8, bpLen);
      tone(sixteenth, f16, bpLen);
      tone(triplet, f3, bpLen);
      
      // turn off
      digitalWrite(quarter, LOW);
      digitalWrite(eighth, LOW);
      digitalWrite(sixteenth, LOW);
      digitalWrite(triplet, LOW);

      break;
    case 3:
      tone(sixteenth, f16, bpLen);
      digitalWrite(sixteenth, LOW);
      
      break;
    case 4:
      tone(triplet, f3, bpLen);
      digitalWrite(triplet, LOW);
      
      break;
    case 6:
      tone(eighth, f8, bpLen);
      tone(sixteenth, f16, bpLen);
      
      digitalWrite(eighth, LOW);
      digitalWrite(sixteenth, LOW);
      break;
    case 8:
      tone(triplet, f3, bpLen);
      digitalWrite(triplet, LOW);
      break;
    case 9:
      tone(sixteenth, f16, bpLen);
      digitalWrite(sixteenth, LOW);
      break;
    case 11:
      // change frequencies at the end of each full beat,
      // only if changeBPM is set
      if (changeBPM)
      {
        bpm = bpm + dBPM;
        if (bpm <= 0)
        {
          bpm = 120;
        }
        Timer1.setPeriod(1000000.00*(60.00/bpm)/12);
        dBPM = 0;
        changeBPM = false;
        Serial.print("BPM:");
        Serial.println(bpm);
      }
      break;
    default: break;
  }  
  
  // increment sub
  // modulo gives values on [0,11]
  sub = (sub + 1)%12;
  
  // debug

}


void loop()
{
  
   n = digitalRead(encoder0PinA);
   if ((encoder0PinALast == LOW) && (n == HIGH)) {
     if (digitalRead(encoder0PinB) == LOW) {
       changeBPM = true;
       dBPM = dBPM - 1;
     } else {
       changeBPM = true;
       dBPM = dBPM + 1;
     }
   } 
   encoder0PinALast = n;
   digitalWrite(
   for (int val = 100; val < 1024; val = val + 100)
   {
     for (int i = 0; i < 100; i++)
     {
     analogWrite(7, val);
     delayMicroseconds(1000);
     analogWrite(7, 0);
     delayMicroseconds(1000);
     }
   }
   // dbg

}

