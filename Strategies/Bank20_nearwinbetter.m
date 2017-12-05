function choice = Bank20_nearwinbetter(myscore,yourscore,turnscore)
    if myscore+turnscore<100
        if turnscore < 20
            choice = 1; % Roll
        else
            choice = 0; % Bank
        end
    else
        choice = 0;
    end
end