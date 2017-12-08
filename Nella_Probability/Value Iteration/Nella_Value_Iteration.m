function [P,NellaVI]=Nella_Value_Iteration(Number_of_Iterations,To_win,Dice_prob,Strategy)

% Set up Strategy
NellaVI = Strategies_to_Matrices(Strategy,To_win);

% Set up Probabilities
[P,~]=Probability_Matrices(NellaVI,Strategy,To_win,Dice_prob);

for n = 1:Number_of_Iterations % Run iterations to get close to true value

    for i = To_win-1:-1:0            % work backwards
        for j = To_win-1:-1:0        % work backwards
            for k = 0:To_win-1-i     % work backwards
                
                Continue = 1; 
                
                while Continue == 1;
                    
                    Continue = 0;
                
                    % fprintf('%d: Game State (%d,%d,%d)\n',n,i,j,k);   % Game_State

                    % Calculate probabilities from Equations
                    [Pbank,Proll]  = BankvsRoll_Probabilities(P,i,j,k,To_win,Dice_prob);
                    
                    if abs(P(i+1,j+1,k+1) - max(Proll,Pbank)) > 0.001 ;
                        P(i+1,j+1,k+1) = max(Proll,Pbank);
                        Continue = 1; % The probabilities changed to do another run through
                        if     Proll > Pbank
                            NellaVI(i+1,j+1,k+1) = 1;
                        elseif Pbank > Proll
                            NellaVI(i+1,j+1,k+1) = 0;
                        end
                    end
                    
                end % end of while loop
                
            end % end for k
        end % end for j
    end % end for i
    
    [~,~]=Probability_Matrices(NellaVI,Strategy,To_win,Dice_prob);
    
end

end