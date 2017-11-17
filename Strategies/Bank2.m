function choice = Bank2(myscore,yourscore,turnscore)
    if turnscore < 2
        choice = 1; % Roll
    else
        choice = 0; % Save
    end
end