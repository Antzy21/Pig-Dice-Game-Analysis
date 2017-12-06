function choice = Bank50_nearwinbetter(myscore,yourscore,turnscore)
    if myscore+turnscore<100
        if turnscore < 50
            choice = 1; % Roll
        else
            choice = 0; % Bank
        end
    else
        choice = 0;
    end
end