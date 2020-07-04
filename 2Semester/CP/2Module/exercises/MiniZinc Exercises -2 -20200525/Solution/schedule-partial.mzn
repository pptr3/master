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

%int: t = ? 
%array[TASKS] of var 0..t: start; %Variables for task start times

%precedence constraints

%resource constraints

%makespan as objective function
%var int: makespan = max(t in TASKS)(start[t] + duration[t]); % this gives me the position where the last task is going to finish.

%solve 
 %:: search_ann 
 %minimize makespan;
 
output ["nt=\(req)\t"];