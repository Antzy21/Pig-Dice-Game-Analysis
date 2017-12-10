function choice = Bank24(myscore,yourscore,turnscore)
    if turnscore < 24
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end