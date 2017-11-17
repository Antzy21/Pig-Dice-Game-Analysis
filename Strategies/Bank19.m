function choice = Bank19(myscore,yourscore,turnscore)
    if turnscore < 19
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end