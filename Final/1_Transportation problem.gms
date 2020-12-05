$title Transportation problem

Set i /1*2/;
alias (i, j);

parameter a(i)/
1 150
2 200
/;

parameter b(j)/
1 175
2 175
/;

parameter c(i,j)/
1. 1   25
1. 2   28
2. 1   26
2. 2   25
/;

variable z;
positive variables  x(i,j);

equations
obj
demand(i)
supply(j)
;

obj.. z =e= sum((i,j),c(i,j)*x(i,j));
demand(i).. sum(j,x(i,j)) =e= a(i);
supply(j).. sum(i,x(i,j)) =e= b(j);

Model problem_2 /all/;
solve problem_2 using LP minimizing z;

display x.l;
display z.l;
