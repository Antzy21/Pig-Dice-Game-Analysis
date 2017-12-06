function choice = Bank50(myscore,yourscore,turnscore)
    if turnscore < 50
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end