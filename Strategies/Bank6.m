function choice = Bank6(myscore,yourscore,turnscore)
    if turnscore < 6
        choice = 1; % Roll
    else
        choice = 0; % Save
    end
end