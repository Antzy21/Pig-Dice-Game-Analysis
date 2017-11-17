function choice = Bank7(myscore,yourscore,turnscore)
    if turnscore < 7
        choice = 1; % Roll
    else
        choice = 0; % Save
    end
end