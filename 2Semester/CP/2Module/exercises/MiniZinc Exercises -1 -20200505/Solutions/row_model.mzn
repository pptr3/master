% Row model

include "alldifferent.mzn";

int: n; 
array[1..n] of var 1..n: rows; %row variables

%column attack constraints
constraint alldifferent(rows)::domain;

%diagonal attack constraints
constraint forall(i,j in 1..n where i<j) (abs(rows[i]-rows[j]) != abs(i-j));

%Default search
solve satisfy; 