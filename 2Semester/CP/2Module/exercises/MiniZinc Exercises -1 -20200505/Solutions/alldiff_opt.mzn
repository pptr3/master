% alldiff model

include "alldifferent.mzn";

int: n; 
array[1..n] of var 1..n: q; %variables

%column attack constraints
constraint alldifferent(q)::domain;

%diagonal attack constraints
constraint alldifferent([q[i]+i |i in 1..n ])::domain;
constraint alldifferent([q[i]-i | i in 1..n ])::domain;

n = 50;
%objective function: this obj function is trying to concentrate the queens as near as possible to the main diagonal. 
var int: obj = sum(i in 1..n)(abs(q[i] - i));  

%programmed search
ann: search_ann; 
search_ann = int_search(q, dom_w_deg, indomain_random); 

solve 
 :: search_ann 
 :: restart_luby(250) 
 minimize obj; % since we are not doing satisfaction search but instead we are doing an optimization search, we use ` minimize obj`

output["obj = \(obj)\n"];

