include "globals.mzn";

int: n_tasks;   % Number of tasks
set of int: TASKS = 1..n_tasks;  
array[TASKS] of int: duration; % Task durations

int: n_res;   % Number of resources
set of int: RESOURCES = 1..n_res; 
array[RESOURCES] of int: L; % Resource capacities
array[RESOURCES,TASKS] of int: req; %Resource requirements of tasks

int: p;       % Number of precedence relations
set of int: PREC = 1..p;
array[PREC,1..2] of TASKS: pre; % Precedence relations

int: t = sum(duration); 
array[TASKS] of var 0..t: start; %Variables for task start times

%precedence constraints
constraint forall(i in PREC)
                 (start[pre[i,1]] + duration[pre[i,1]] <= start[pre[i,2]]);
%resource constraints
constraint forall(r in RESOURCES)
   (cumulative(start, duration, [req[r,t] | t in TASKS], L[r]));

%makespan as objective function
var int: makespan = max(t in TASKS)(start[t] + duration[t]);

ann:search_ann;
%search_ann = int_search( start, smallest, indomain_min);
  
solve 
 :: search_ann 
 minimize makespan;
     
output [
    "Start times = ", show(start), "\n",
    "End times   =", show([start[i]+duration[i] | i in TASKS]), "\n",
    "makespan = ", show(makespan), "\n"
];

