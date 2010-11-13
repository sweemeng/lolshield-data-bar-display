#include <Charliplexing.h>

int data;
int value=0;
int count = 0;
void setup(){
  LedSign::Init();
  Serial.begin(9600); 
}
void loop(){
  if(Serial.available() > 0){
    data = Serial.read();
  }
  else{
    data = -1;
 //   lit_led(2);
  }
  if(data == 83){
    count = 0;
    data = 0;
    reset_led(value);
  } 
  else if(data >=0){
    
    if(count < 3){
      int temp = data - 48;
      
      if(count==0){
        value = temp;
      }
      else{
        value = value * 10;
        value = value + temp;
      }
      
      count++;
    }
    if(value>14){
      value=14;
    } 
    if(value < 0){
      value=0;
    }
   
  }
  else if(data == -1){
    lit_led(value);
    reset_led(value);
    lit_led(5);
  }
  
}
void lit_led(int no){
  for(uint8_t y = 0;y < no;y++){
    for(uint8_t x = 0;x < 9;x++){
      LedSign::Set(y,x,1);
    }
  }
}
void reset_led(int no){
  for(uint8_t y = 0;y < no;y++){
    for(uint8_t x = 0;x < 9;x++){
      LedSign::Set(y,x,0);
    }
  }
}
