function choice = Delay10Bank20(myscore,yourscore,turnscore)
    if yourscore > 10
        if turnscore < 20
            choice = 1; % Roll
        else
            choice = 0; % Bank
        end
    else
        choice = 0; % Bank
    end
end