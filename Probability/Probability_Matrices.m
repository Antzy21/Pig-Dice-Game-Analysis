function [P,Q]=Probability_Matrices(Strategy_A,Strategy_B,To_win,Dice_prob)

% Set up P & Q probabilities as a matrix
P=zeros(To_win,To_win,To_win);
Q=zeros(To_win,To_win,To_win);

% Set up Strategies as Matrices (If they aren't strategies already)
if isa(Strategy_A, 'function_handle')
    Name_A=func2str(Strategy_A);
    [Strategy_A]=Strategies_to_Matrices(Strategy_A,To_win);
else
    Name_A=inputname(1);
    [Strategy_A]=Strategies_to_Matrices(Strategy_A,To_win);
end
if isa(Strategy_B, 'function_handle')
    Name_B=func2str(Strategy_B);
    [Strategy_B]=Strategies_to_Matrices(Strategy_B,To_win);
else
    Name_B=inputname(2);
    [Strategy_B]=Strategies_to_Matrices(Strategy_B,To_win);
end

% Check for Stalemates
[Stalemate,I,J]=Catch_Stalemates(Strategy_A,Strategy_B,To_win);
if Stalemate == 1
    fprintf('A Stalemate has occured when ''%s'' has %d points and when ''%s'' has %d points\n',Name_A,I,Name_B,J);
    return
end

for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        [P,Q]=X_to_Probabilities(i,j,Strategy_A,Strategy_B,Dice_prob,To_win,P,Q);
    end
end

fprintf('    %f    ''%s'' Probability of winning when going first\n',P(1,1,1),Name_A);
fprintf('    %f    ''%s'' Probability of winning when going first\n',Q(1,1,1),Name_B);

end