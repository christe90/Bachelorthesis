function Geruest = HF_02_3_1_Geruest_fuellen(Geruest, Hoehe)
if (Hoehe == 1) %% Falls es sich um eine flache Fläche handelt
    Geruest = ones(size(Geruest));
else
    for x = 1:size(Geruest,1)
        y = round(sqrt((1-((x-size(Geruest,1)/2)/(size(Geruest,1)/2))^2) * (Hoehe/2)^2));
        
        if (y < 1)
            continue;
        else
            Geruest(x,1:y,:) = 1;
        end
    end
end
end