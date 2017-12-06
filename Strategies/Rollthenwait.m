function choice = Rollthenwait(myscore,yourscore,turnscore)
    if myscore < 60
        if turnscore < 20
            choice = 1;
        else
            choice = 0;
        end
    else
        if myscore > yourscore
            choice = 0;
        else
            if turnscore < 20
                choice = 1;
            else
                choice = 0;
            end
        end
    end
end