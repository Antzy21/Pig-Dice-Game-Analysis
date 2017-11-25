function [P,Q,Optimised_Strategy]=Optimising_Probability_Matrices(Strategy_S,To_win,Dice_prob)
for i=1:2

[Matrix_S,Name_S]=Strategies_to_Matrices(Strategy_S,To_win);
    
[P,Q]=Probability_Matrices(Strategy_S,Strategy_S,To_win,Dice_prob);
Optimised_Strategy = zeros(To_win,To_win,To_win);


global_stalemate = false;
for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        [C,D,P_size,Q_size,stalemate]=Optimising_Matrices(i,j,Dice_prob,To_win,Matrix_S,P,Q);
        if stalemate == false
            X=C\D;
            for l=1:P_size
                % Choose the max between Banking and Rolling
                Proll=X(l);
                Pbank=X(P_size+l);
                P(i+1,j+1,l)=max(Proll,Pbank);
                if Proll > Pbank % If rolling best option, choose roll
                    Optimised_Strategy(i+1,j+1,l)=1;
                end
            end
            for l=1:Q_size-P_size
                Q(j+1,i+1,l)=X(P_size+l);
            end
        elseif stalemate == true
            global_stalemate = true;
            for l=1:P_size
                P(i+1,j+1,l)=0;
            end
            for l=1:Q_size-P_size
                Q(j+1,i+1,l)=1;
            end
        end
    end
end

if global_stalemate == false
    fprintf('Probability of Optimised winning when going first is %f \n',P(1,1,1));
    fprintf('Probability of ''%s'' winning when going first is %f \n',Name_S,Q(1,1,1));
    return
end
fprintf('Probability of ''%s'' winning when going first is %f \n',Name_A,P(1,1,1));
Strategy_temp = Strategy_A; Strategy_A = Strategy_B; Strategy_B = Strategy_temp;
end
end

