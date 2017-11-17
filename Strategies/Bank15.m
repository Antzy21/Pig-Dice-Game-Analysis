function choice = Bank15(myscore,yourscore,turnscore)
    if turnscore < 15
        choice = 1; % Roll
    else
        choice = 0; % Save
    end
end