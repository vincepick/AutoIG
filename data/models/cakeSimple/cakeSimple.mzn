% Baking cakes for the school fete (with data file)


% Integer variables representing how many grams of each ingredient are available according to our generator
int: flour;  %no. grams of flour available

int: banana; %no. of bananas available

int: sugar;  %no. grams of sugar available

int: butter; %no. grams of butter available

int: cocoa;  %no. grams of cocoa available


% Asserting valid inputs
constraint assert(flour >= 0,"Invalid datafile: " ++

                  "Amount of flour should be non-negative");

constraint assert(banana >= 0,"Invalid datafile: " ++

                  "Amount of banana should be non-negative");

constraint assert(sugar >= 0,"Invalid datafile: " ++

                  "Amount of sugar should be non-negative");

constraint assert(butter >= 0,"Invalid datafile: " ++

                  "Amount of butter should be non-negative");

constraint assert(cocoa >= 0,"Invalid datafile: " ++

                  "Amount of cocoa should be non-negative");


% Declaring number of cakes that can possibly be made, are constrained between 0-100
var 0..100: b; % no. of banana cakes

var 0..100: c; % no. of chocolate cakes


% Constraints ensuring that the number of cakes does not exceed available quantity of each ingredient
% flour

constraint 250*b + 200*c <= flour;  % each banana cake requires 250 grams of flour and each chocolate one requires 200 grams

% bananas

constraint 2*b  <= banana; % each banana cake requires 2 bananas

% sugar

constraint 75*b + 150*c <= sugar; % each banana cake requires 75 grams of sugar, each chocolate oe requires 150 grams

% butter

constraint 100*b + 150*c <= butter;

% cocoa

constraint 75*c <= cocoa;


% maximize our profit

solve maximize 400*b + 450*c; % specifies the goal of the model, which is to maximize profit, each banana cake makes a profit of 400 units and each chocolate cake 450


output ["no. of banana cakes = \(b)\n",

        "no. of chocolate cakes = \(c)\n"];