function choice = Bank25(myscore,yourscore,turnscore)
    if turnscore < 25
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end