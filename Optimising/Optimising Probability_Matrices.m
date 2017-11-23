function [P,Q]=Probability_Matrices_Optimising(Strategy_A,Strategy_B,To_win,Dice_prob)
for i=1:2

P=zeros(To_win,To_win,To_win);
Q=zeros(To_win,To_win,To_win);

[Strategy_A,Name_A]=Strategies_to_Matrices(Strategy_A,To_win);
[Strategy_B,Name_B]=Strategies_to_Matrices(Strategy_B,To_win);

global_stalemate = false;
for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        [C,D,n,m,stalemate]=Matrices(i,j,Dice_prob,To_win,Matrix_A,Matrix_B,P,Q);
        if stalemate == false
            X=C\D;
            for l=1:n
                P(i+1,j+1,l)=X(l);
            end
            for l=1:m-n
                Q(j+1,i+1,l)=X(n+l);
            end
        elseif stalemate == true
            global_stalemate = true;
            for l=1:n
                P(i+1,j+1,l)=0;
            end
            for l=1:m-n
                Q(j+1,i+1,l)=1;
            end
        end
    end
end

if global_stalemate == false
    fprintf('Probability of ''%s'' winning when going first is %f \n',Name_A,P(1,1,1));
    fprintf('Probability of ''%s'' winning when going first is %f \n',Name_B,Q(1,1,1));
    return
end
fprintf('Probability of ''%s'' winning when going first is %f \n',Name_A,P(1,1,1));
Strategy_temp = Strategy_A; Strategy_A = Strategy_B; Strategy_B = Strategy_temp;
end
end