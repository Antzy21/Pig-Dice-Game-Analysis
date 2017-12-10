function choice = Bank22(myscore,yourscore,turnscore)
    if turnscore < 22
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end