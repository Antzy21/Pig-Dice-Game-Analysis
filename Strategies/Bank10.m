function choice = Bank10(myscore,yourscore,turnscore)
    if turnscore < 10
        choice = 1; % Roll
    else
        choice = 0; % Save
    end
end