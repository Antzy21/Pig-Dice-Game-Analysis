function [P,Q,Opt_Strat]=Optimising_Probability_Matrices(Opt_Strat,Strat,To_win,Dice_prob)

% Set up P & Q probabilities as a matrix
P=zeros(To_win,To_win,To_win);
Q=zeros(To_win,To_win,To_win);

% Set up Strategies as Matrices (If they aren't strategies already)
[Opt_Strat,Opt_name]=Strategies_to_Matrices(Opt_Strat,To_win);
[Strat,Strat_name]=Strategies_to_Matrices(Strat,To_win);

% Check for Stalemates
[Stalemate,i,j]=Catch_Stalemates(Opt_Strat,Strat,To_win);
if Stalemate == 1
    fprintf('A Stalemate has occured when ''%s'' has %d points and when ''%s'' has %d points\n',Name_A,i,Name_B,j);
    return
end

for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        [C,D,P_size,Q_size]=Optimising_Matrices(i,j,Dice_prob,To_win,Opt_Strat,Strat,P,Q);
        X=C\D;
        for k=0:P_size-1 % Sort out P
            Proll = X(k+1);
            Pbank = X(P_size+k+1);
            if      Proll > Pbank
                P(i+1,j+1,k+1)   = Proll;   % Set probability Value
                Opt_Strat(i+1,j+1,k+1) = 1; % Set best choice in Strategy
            elseif  Pbank < Proll
                P(i+1,j+1,k+1)   = Pbank;   % Set probability Value
                Opt_Strat(i+1,j+1,k+1) = 0; % Set best choice in Strategy
            end
        end
        for k=0:Q_size-1 % Sort out Q
            Q(j+1,i+1,k+1)=X(2*P_size+k+1);
        end
    end
end

fprintf('Probability of optimised ''%s'' winning when going first is %f\n',Opt_name,P(1,1,1));
fprintf('Probability of ''%s'' winning when going first is %f\n',Strat_name,Q(1,1,1));

end