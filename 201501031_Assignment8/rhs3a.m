function solved = rhs3a(t, initial)
global L C;
solved = zeros(length(initial), 1);
solved(1) = initial(2);
solved(2) = -initial(1) ./ (L * C);
