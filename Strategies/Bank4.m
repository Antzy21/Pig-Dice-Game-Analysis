function choice = Bank4(myscore,yourscore,turnscore)
    if turnscore < 4
        choice = 1; % Roll
    else
        choice = 0; % Save
    end
end