function solved = rhs4(t, initial)
solved = zeros(length(initial), 1);
global L C R E w;
solved(1) = initial(2);
solved(2) = (E * sin(w * t) / L) - (initial(2) * (R / L)) - (initial(1) / (L * C));