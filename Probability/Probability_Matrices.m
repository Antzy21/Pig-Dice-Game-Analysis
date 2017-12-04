function [P,Q]=Probability_Matrices(Strategy_A,Strategy_B,To_win,Dice_prob)

% Set up P & Q probabilities as a matrix
P=zeros(To_win,To_win,To_win);
Q=zeros(To_win,To_win,To_win);

% Set up Strategies as Matrices (If they aren't strategies already)
if isa(Strategy_A, 'double')
    Name_A=inputname(1);
elseif isa(Strategy_A, 'function_handle')
    Name_A=func2str(Strategy_A);
    [Strategy_A]=Strategies_to_Matrices(Strategy_A,To_win);
end
if isa(Strategy_B, 'double')
    Name_B=inputname(2);
elseif isa(Strategy_B, 'function_handle')
    Name_B=func2str(Strategy_B);
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
        [C,D,P_size,Q_size]=Matrices(i,j,Dice_prob,To_win,Strategy_A,Strategy_B,P,Q);
        X=C\D;
        for k=0:P_size-1 % Sort out P
            P(i+1,j+1,k+1)=X(k+1);
        end
        for k=0:Q_size-1 % Sort out Q
            Q(j+1,i+1,k+1)=X(P_size+k+1);
        end
    end
end

fprintf('Probability of ''%s'' winning when going first is %f\n',Name_A,P(1,1,1));
fprintf('Probability of ''%s'' winning when going first is %f\n',Name_B,Q(1,1,1));

end