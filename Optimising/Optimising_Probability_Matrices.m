function [Opt,P,Q]=Optimising_Probability_Matrices(Opt,Strat,To_win,Dice_prob)

% Set up P & Q probabilities as a matrix
[P,Q]=Probability_Matrices(Opt,Strat,To_win,Dice_prob);

% Set up Stregies as Matrices (If they aren't Strategies already)
[Opt]=Strategies_to_Matrices(Opt,To_win);
[Str]=Strategies_to_Matrices(Strat,To_win);

% Check for Stalemates
[Stalemate,i,j]=Catch_Stalemates(Opt,Str,To_win);
if Stalemate == 1
    fprintf('A Stalemate has occured when ''%s'' has %d points and when ''%s'' has %d points\n',Name_A,i,Name_B,j);
    return
end

for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        fprintf('Game State (%d,%d)\n',i,j)
        % Always run at least once
        Continue = 1;
        while Continue == 1
            
            % Assume correct unless proven otherwise
            Continue = 0;
            
            % Create Matrices & Calculate Probabilities
            [C,D,P_size,~]=Optimising_Matrices(i,j,Dice_prob,To_win,Opt,Str,P,Q); X=C\D;
            
            % Save rolling and banking probabilities from X respectively
            Proll = X(1:P_size);
            Pbank = X(P_size+1:2*P_size);
            
            for k=0:P_size-1 % Sort out P
                
                if      Proll(k+1) > Pbank(k+1) && Opt(i+1,j+1,k+1) ~= 1; % If rolling is better & current doesn't roll
                    Opt(i+1,j+1,k+1) = 1; % Change Strategy to roll
                    % fprintf('The strategy has changed to roll at (%d,%d,%d), re-calculate\n',i,j,k);
                    % Recalculate P & Q probabilites (for specific i and j only) to use in re-run
                    [P,Q]=X_to_Probabilities(i,j,Opt,Str,Dice_prob,To_win,P,Q);
                    Continue = 1;
                    
                elseif  Pbank(k+1) > Proll(k+1) && Opt(i+1,j+1,k+1) ~= 0; % If banking is better & current doesn't bank
                    Opt(i+1,j+1,k+1) = 0; % Change Strategy to bank
                    % fprintf('The strategy has changed to bank at (%d,%d,%d), re-calculate\n',i,j,k);
                    % Recalculate P & Q probabilites (for specific i and j only) to use in re-run
                    [P,Q]=X_to_Probabilities(i,j,Opt,Str,Dice_prob,To_win,P,Q);
                    Continue = 1;
                else
                    % fprintf('The strategy is stababilise at (%d,%d,%d)\n',i,j,k)
                end
            end
        end
    end
end

[P,Q]=Probability_Matrices(Opt,Strat,To_win,Dice_prob);

end