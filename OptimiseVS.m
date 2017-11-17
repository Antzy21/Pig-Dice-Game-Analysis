function Optimal_Vs=OptimiseVS(Strategy,Number_of_Iterations,Dice_prob,To_win)

% Start with the strategy we wish to optimise agaisnt
Optimal_Vs = Strategy;

% Build Initial P & Q Probabilities
[P,Q]=Probability_Matrices(Optimal_Vs,Strategy,To_win,Dice_prob);

% Set up Optimal Strategy as a matrix
Optimal_Vs = zeros(To_win,To_win,To_win);

for N = 1 : Number_of_Iterations

% Set up Probability matrix for new Strategy
P_max = zeros(To_win,To_win,To_win);

for i = To_win-1:-1:0
    for j = To_win-1:-1:0
        for k = To_win-i-1:-1:0
            P_roll = Dice_prob*(1-Q(j+1,i+1,1)); % First add the probability that it rolls a 1
            for r = 2:1/Dice_prob
                if i+k+r < To_win % If the added game state has a probability
                    P_roll = P_roll + Dice_prob*P(i+1,j+1,k+r+1);
                else % if the added game state is won
                    P_roll = P_roll + Dice_prob*(1);
                end
            end
            P_bank = 1-Q(j+1,i+k+1,1);
            if P_roll > P_bank % If rolling is better
                Optimal_Vs(i+1,j+1,k+1) = 1;
                P_max(i+1,j+1,k+1) = P_roll;
            elseif P_roll < P_bank % If banking is better
                Optimal_Vs(i+1,j+1,k+1) = 0;
                P_max(i+1,j+1,k+1) = P_roll;
            end
        end
    end
end
fprintf('Optimised Strategy after %d iterations:\n',N)
[P,Q]=Probability_Matrices(Optimal_Vs,Strategy,To_win,Dice_prob);
end
end