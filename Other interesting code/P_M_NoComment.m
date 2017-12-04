function [P,Q]=P_M_NoComment(Strategy_A,Strategy_B,To_win,Dice_prob)

% Set up P & Q probabilities as a matrix
P=zeros(To_win,To_win,To_win);
Q=zeros(To_win,To_win,To_win);

% Set up Strategies as Matrices (If they aren't strategies already)
[Matrix_A,Name_A]=Strategies_to_Matrices(Strategy_A,To_win);
[Matrix_B,Name_B]=Strategies_to_Matrices(Strategy_B,To_win);

% Check for Stalemates
[Stalemate,I,J]=Catch_Stalemates(Matrix_A,Matrix_B,To_win);
if Stalemate == 1
    fprintf('A Stalemate has occured when ''%s'' has %d points and when ''%s'' has %d points\n',Name_A,I,Name_B,J);
    return
end

for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        [C,D,P_size,Q_size]=Matrices(i,j,Dice_prob,To_win,Matrix_A,Matrix_B,P,Q);
        X=C\D;
        for k=0:P_size-1 % Sort out P
            P(i+1,j+1,k+1)=X(k+1);
        end
        for k=0:Q_size-1 % Sort out Q
            Q(j+1,i+1,k+1)=X(P_size+k+1);
        end
    end
end
end