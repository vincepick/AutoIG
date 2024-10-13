
int: b;

var 3..30: x;
var 0..6: y;
var 10..100000: z;

constraint x = b;       
constraint z = x + y;   

solve satisfy;
