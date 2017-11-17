function choice = jEvenBank20(myscore,yourscore,turnscore)
    if mod(yourscore,2) == 0
        if turnscore < 20
            choice = 1; % Roll
        else
            choice = 0; % Bank
        end
    elseif mod(yourscore,2) == 1
        choice = 0; % Bank
    else
        disp('error')
    end
end