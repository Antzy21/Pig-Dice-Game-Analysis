function winner = pig_with_matrices(opp1,opp2)


    [opp1]=Strategies_to_Matrices(opp1,100);
    [opp2]=Strategies_to_Matrices(opp2,100);

    score1 = 0;
    score2 = 0;
    cont_game = 1;
    
    turn = 0;
    
    while cont_game
        if opp1(score1+1,score2+1,1) == 0 && opp2(score2+1,score1+1,1) == 0
            winner = 0;
            return
        end
        while opp1(score1+1,score2+1,turn+1) == 1
            throw = randi(6);
            if throw == 1
                turn = 0;
                break
            else
                turn = turn + throw;
                if score1 + turn > 99
                    break
                end
            end
        end
        score1 = score1 + turn;
        turn = 0;
        %score = [score1, score2]
        
        if score1 < 100
            while opp2(score2+1,score1+1,turn+1) == 1
                throw = randi(6);
                if throw == 1
                    turn = 0;
                    break
                else
                    turn = turn + throw;
                    if score2 + turn > 99
                        break
                    end
                end
            end
            score2 = score2 + turn;
            turn = 0;
            %score = [score1, score2]
        end
        
        if score1 > 99
            %disp('Player 1 wins the game')
            cont_game = 0;
            winner = 1;
            return
        elseif score2 > 99
            %disp('Player 2 wins the game')
            cont_game = 0;
            winner = 2;
            return
        end
    end
end     