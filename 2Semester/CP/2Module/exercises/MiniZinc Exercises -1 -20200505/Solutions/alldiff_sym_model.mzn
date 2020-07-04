  % alldiff_sym model

include "alldifferent.mzn";

int: n; 
array[1..n] of var 1..n: q; %variables

%column attack constraints
constraint alldifferent(q)::domain;

%diagonal attack constraints
constraint alldifferent([q[i]+i |i in 1..n ])::domain;
constraint alldifferent([q[i]-i | i in 1..n ])::domain;

%dual model 
include "lex_lesseq.mzn";
array[1..n, 1..n] of var bool: qb; %variables

%chanelling constraints
constraint forall (i,j in 1..n) (qb[i,j] <-> q[i]=j); % everytime q[i]=j, this will lead into a 1, otherwise 0. Then, the resulting value will be assigned to qb[i,j].

%symmetry breaking
constraint
    lex_lesseq(array1d(qb), [ qb[j,i] | i,j in 1..n ]) % this constraint basically switch (i, j) with (j, i), flipping the board in   this way \.
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i in reverse(1..n), j in 1..n ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i in 1..n, j in reverse(1..n) ])
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i in 1..n, j in reverse(1..n) ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i in reverse(1..n), j in 1..n ])
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i,j in reverse(1..n) ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i,j in reverse(1..n) ]) % this constraint flips /.
;

% Default search
solve satisfy;