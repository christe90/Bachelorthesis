function  Koordinaten = HF_03_0_Koordinatentransformation(Koordinaten, Abbildungsmatrix, Ursprung , Modus)
if (isempty(Koordinaten))
    Koordinaten = zeros(0,3);
elseif(Modus == -1) % Abbildung von Koordinatensystem 1 in 2
    Koordinaten = bsxfun(@minus, Koordinaten, Ursprung);
    Abbildungsmatrix = inv(Abbildungsmatrix);
    Koordinaten = Koordinaten';
    Koordinaten = (Abbildungsmatrix * Koordinaten)';
else % Abbildung von Koordinatensystem 2 in 1
    Koordinaten = Koordinaten';
    Koordinaten = (Abbildungsmatrix * Koordinaten)';
    Koordinaten = bsxfun(@plus,Koordinaten, Ursprung);
end

Koordinaten = round(Koordinaten);
end