function [P,Q]=Optimising_Probability_Matrices(Strategy_S,To_win,Dice_prob)
for i=1:2

P=zeros(To_win,To_win,To_win);
Q=zeros(To_win,To_win,To_win);

[Strategy_S,Name_S]=Strategies_to_Matrices(Strategy_S,To_win);

global_stalemate = false;
for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        [C,D,n1,n2,m,stalemate]=Matrices_Optimising(i,j,Dice_prob,To_win,Matrix_S,P,Q);
        if stalemate == false
            X=C\D;
            for l=1:n1
                % Choose the max between Banking and Rolling
                Proll=X(l);
                Pbank=X(n1+l);
                P(i+1,j+1,l)=max(Proll,Pbank);
            end
            for l=1:m-n2
                Q(j+1,i+1,l)=X(n2+l);
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

