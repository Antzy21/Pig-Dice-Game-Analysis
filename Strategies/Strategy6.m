function choice = sixthstrat(myscore,yourscore,turnscore) 

if myscore <= 80
    if turnscore < 20
        choice = 1;
    else 
        choice = 0;
    end
end

if myscore >80
    if turnscore < 15
        choice = 1;
    else
        choice = 0;
    end
end

if myscore + turnscore >= 100;
    choice = 0;
end


end