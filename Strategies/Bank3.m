function choice = Bank3(myscore,yourscore,turnscore)
    if turnscore < 3
        choice = 1; % Roll
    else
        choice = 0; % Save
    end
end