function solved = rhs3b(t, initial)
global L C R;
solved = zeros(length(initial), 1);
solved(1) = initial(2);
solved(2) = -(initial(1) / (L * C)) - (initial(2) / (R * C));
