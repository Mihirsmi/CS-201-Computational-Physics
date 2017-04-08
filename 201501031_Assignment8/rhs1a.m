function solved = rhs1a(t, initial)
solved = zeros(length(initial), 1);
global C R maximum_charge;
solved(1) = (-1 / (R * C)) * (initial(1) - maximum_charge);