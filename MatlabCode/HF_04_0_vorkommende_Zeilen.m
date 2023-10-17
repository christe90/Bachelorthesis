function [Zeilen] = HF_04_0_vorkommende_Zeilen(Matrix1, Matrix2,Modus)
%% Modus 1 = Zeilen für ismember, Modus2 = wie Mous 1 nur mit 'rows' Attribut, Modus -1 = das Gegenteil von Modus1, Modus -2 = das Gegenteil von Modus 2
if (Modus == 1)
    indexe = ismember(Matrix1, Matrix2);
    [Zeilen,~] = find(indexe);
elseif (Modus == 2)
    indexe = ismember(Matrix1, Matrix2, 'rows');
    [Zeilen,~] = find(indexe);
elseif (Modus == -1)
    indexe = ismember(Matrix1, Matrix2);
    [Zeilen,~] = find(~indexe);
elseif (Modus == -2)
    indexe = ismember(Matrix1, Matrix2,'rows');
    [Zeilen,~] = find(~indexe);
else
    disp('ungültiger Modus');
end

end