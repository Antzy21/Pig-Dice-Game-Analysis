function [P,Q]=Optimising_Probability_Matrices(Strategy_A,Strategy_B,To_win,Dice_prob)
for i=1:2

% Set up P & Q probabilities as a matrix
P=zeros(To_win,To_win,To_win);
Q=zeros(To_win,To_win,To_win);

% Set up Strategies as Matrices (If they aren't strategies already)
[Opt_Strat,Name_A]=Strategies_to_Matrices(Strategy_A,To_win);
[Strategy,Name_B]=Strategies_to_Matrices(Strategy_B,To_win);

global_stalemate = false;
for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        [C,D,P_size,Q_size,stalemate]=Matrices(i,j,Dice_prob,To_win,Opt_Strat,Strategy,P,Q);
        if stalemate == false
            X=C\D;
            for l=1:P_size
                Proll=X(l);
                Pbank=X(P_size+l);
                P(i+1,j+1,l)=max(Proll,Pbank);
            end
            for l=P_size+1:P_size+Q_size
                Q(j+1,i+1,l)=X(P_size+l);
            end
        elseif stalemate == true
            global_stalemate = true;
            for l=1:P_size
                P(i+1,j+1,l)=0;
            end
            for l=P_size+1:P_size+Q_size
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