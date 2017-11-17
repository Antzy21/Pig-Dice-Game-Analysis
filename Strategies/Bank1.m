function choice = Bank1(myscore,yourscore,turnscore)
    if turnscore < 1
        choice = 1; % Roll
    else
        choice = 0; % Save
    end
end