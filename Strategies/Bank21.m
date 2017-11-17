function choice = Bank21(myscore,yourscore,turnscore)
    if turnscore < 21
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end