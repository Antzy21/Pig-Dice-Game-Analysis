function choice = Bank_on_X(myscore,yourscore,turnscore,X)
    if turnscore < X
        choice = 1; % Roll
    else
        choice = 0; % Bank
    end
end