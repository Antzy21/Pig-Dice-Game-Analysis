function [score1,score2] = series_series(n,strategy1, strategy2, total)
a=0;
score1=0;
score2=0;
while a<n/2;
    game_score=series(strategy1, strategy2, total);
    if game_score(1)>game_score(2);
        score1=score1+1;
    elseif game_score(2)>game_score(1);
        score2=score2+1;
    else score1=score1;
        score2=score2;
    end
    a=a+1;
end
a=0;
while a<n/2;
    game_score=series(strategy2, strategy1, total);
    if game_score(2)>game_score(1);
        score1=score1+1;
    elseif game_score(1)>game_score(2);
        score2=score2+1;
    else score1=score1;
        score2=score2;
    end
    a=a+1;
end
end
        
    