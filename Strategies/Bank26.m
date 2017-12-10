function choice = Bank26(myscore,yourscore,turnscore)
    if turnscore < 26
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end