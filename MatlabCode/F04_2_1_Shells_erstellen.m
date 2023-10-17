function [Shells] = F04_2_1_Shells_erstellen(Solids)
%% Alle Shells erstellen
Shells  = zeros(6*size(Solids,1),7);

for i = 1:size(Solids)
        %Shell 1
        Shells((i-1)*6+1,1) = (i-1)*6+1; %Die Shell bekommt eine ID zugewiesen
        Shells((i-1)*6+1,2) = Solids(i,2); %Die Shell wird einem Roving zugewiesen
        Shells((i-1)*6+1,3) = Solids(i,3);
        Shells((i-1)*6+1,4) = Solids(i,4);
        Shells((i-1)*6+1,5) = Solids(i,5);
        Shells((i-1)*6+1,6) = Solids(i,6);
        Shells((i-1)*6+1,7) = Solids(i,11);
        %Shell 2
        Shells((i-1)*6+2,1) = (i-1)*6+2; %Die Shell bekommt eine ID zugewiesen
        Shells((i-1)*6+2,2) = Solids(i,2); %Die Shell wird einem Roving zugewiesen
        Shells((i-1)*6+2,3) = Solids(i,7);
        Shells((i-1)*6+2,4) = Solids(i,8);
        Shells((i-1)*6+2,5) = Solids(i,9);
        Shells((i-1)*6+2,6) = Solids(i,10);
        Shells((i-1)*6+2,7) = Solids(i,11);

        %Shell 3
        Shells((i-1)*6+3,1) = (i-1)*6+3; %Die Shell bekommt eine ID zugewiesen
        Shells((i-1)*6+3,2) = Solids(i,2); %Die Shell wird einem Roving zugewiesen
        Shells((i-1)*6+3,3) = Solids(i,6);
        Shells((i-1)*6+3,4) = Solids(i,5);
        Shells((i-1)*6+3,5) = Solids(i,9);
        Shells((i-1)*6+3,6) = Solids(i,10);
        Shells((i-1)*6+3,7) = Solids(i,11);

        %Shell 4
        Shells((i-1)*6+4,1) = (i-1)*6+4; %Die Shell bekommt eine ID zugewiesen
        Shells((i-1)*6+4,2) = Solids(i,2); %Die Shell wird einem Roving zugewiesen
        Shells((i-1)*6+4,3) = Solids(i,3);
        Shells((i-1)*6+4,4) = Solids(i,4);
        Shells((i-1)*6+4,5) = Solids(i,8);
        Shells((i-1)*6+4,6) = Solids(i,7);
        Shells((i-1)*6+4,7) = Solids(i,11);

        %Shell 5
        Shells((i-1)*6+5,1) = (i-1)*6+5; %Die Shell bekommt eine ID zugewiesen
        Shells((i-1)*6+5,2) = Solids(i,2); %Die Shell wird einem Roving zugewiesen
        Shells((i-1)*6+5,3) = Solids(i,8);
        Shells((i-1)*6+5,4) = Solids(i,9);
        Shells((i-1)*6+5,5) = Solids(i,5);
        Shells((i-1)*6+5,6) = Solids(i,4);
        Shells((i-1)*6+5,7) = Solids(i,11);

        %Shell 6
        Shells((i-1)*6+6,1) = (i-1)*6+6; %Die Shell bekommt eine ID zugewiesen
        Shells((i-1)*6+6,2) = Solids(i,2); %Die Shell wird einem Roving zugewiesen
        Shells((i-1)*6+6,3) = Solids(i,7);
        Shells((i-1)*6+6,4) = Solids(i,10);
        Shells((i-1)*6+6,5) = Solids(i,6);
        Shells((i-1)*6+6,6) = Solids(i,3);
        Shells((i-1)*6+6,7) = Solids(i,11);
end
end