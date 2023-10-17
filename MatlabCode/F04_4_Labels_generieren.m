function [Labels, Shells, Solids ] = F04_4_Labels_generieren(Shells, Solids)
%% Label Liste generieren
Roving_Anzahl = max(Shells(:,2));
Labels = zeros(2*Roving_Anzahl + 2,3);
Labels(:,1) = 1:size(Labels,1);

Labels(1:2,2:3) = [1,3;1,4]; % Inlet und Outlet

Labels(3:Roving_Anzahl+2,2) = 1:Roving_Anzahl; % Shell Labels
Labels(3:Roving_Anzahl+2,3) = 2;

Labels(Roving_Anzahl + 3:end,2) = 1:Roving_Anzahl; %Solid Labels
Labels(Roving_Anzahl + 3:end,3) = 1;
%% Die Shells Parts werden geändert
Shells(:,2) = Shells(:,2) + 2;
Shells(Shells(:,7) == 5,2) = 1; % Inlet
Shells(Shells(:,7) == 6,2) = 2; % Outlet

%% Die Solids werden geändert
Solids(:,2) = Solids(:,2) + max(Shells(:,2));
end