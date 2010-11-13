This is a project that use the lolshield and the arduino.
Arduino will receive serial connection in form of S+number. The result will be display by how much led lights up horizontally. 

To use it
- upload the processing code to arduino
- send a code in form of S+number, you can use the arduino serial monitor
- see the lolshield lights up!!!!

The reason you need to add a S, because arduino detect S to reset the number receive. 

TODO
- Fix the issue where once serial connection close, all the display led is off
