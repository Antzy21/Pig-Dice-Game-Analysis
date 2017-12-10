function choice = Bank27(myscore,yourscore,turnscore)
    if turnscore < 27
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end