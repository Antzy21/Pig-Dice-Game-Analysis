function choice = Bank18(myscore,yourscore,turnscore)
    if turnscore < 18
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end