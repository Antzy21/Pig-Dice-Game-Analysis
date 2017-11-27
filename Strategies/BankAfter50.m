function choice = BankAfter50(myscore,yourscore,turnscore)
    if myscore < 50
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end