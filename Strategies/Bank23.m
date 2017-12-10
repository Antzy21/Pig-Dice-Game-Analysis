function choice = Bank23(myscore,yourscore,turnscore)
    if turnscore < 23
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end