function choice = Bank17(myscore,yourscore,turnscore)
    if turnscore < 17
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end