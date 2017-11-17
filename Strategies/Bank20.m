function choice = Bank20(myscore,yourscore,turnscore)
    if turnscore < 20
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end