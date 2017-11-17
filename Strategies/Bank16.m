function choice = Bank16(myscore,yourscore,turnscore)
    if turnscore < 16
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end