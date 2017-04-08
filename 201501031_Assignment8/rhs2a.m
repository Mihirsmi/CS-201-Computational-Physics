function solved = rhs2a(t, initial)
solved = zeros(length(initial), 1);
global L R maximum_current;
solved(1) = (R / L) * (maximum_current - initial(1));