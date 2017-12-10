function [P,NellaVI]=Nella_Value_Iteration(To_win,Dice_prob,Strategy)

% Set up Strategy
NellaVI = Strategies_to_Matrices(Strategy,To_win);

% Set up Probabilities
[P,~]=Probability_Matrices(NellaVI,Strategy,To_win,Dice_prob);

old_NellaVI = NellaVI;
old_NellaVI(1,1,1)=0;
Iteration = 0;

while isequal(old_NellaVI,NellaVI) == 0 % Run iterations Untill full convergence
    Iteration = Iteration+1;
    old_NellaVI = NellaVI; % For comparison after changes
    
    for i = To_win-1:-1:0            % work backwards
        for j = To_win-1:-1:0        % work backwards
            for k = 0:To_win-1-i     % work backwards
                
                Continue = 1; 
                
                fprintf('Iteration: %d Game State (%d,%d,%d)\n',Iteration,i,j,k);   % Game_State
                
                while Continue == 1;
                    
                    Continue = 0;

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
    
    Change(Iteration) = sum(sum(sum(abs(old_NellaVI - NellaVI))));
    fprintf('total GS choices changed: %d\n',Change(Iteration));
    disp(Change);
    
    [~,~]=Probability_Matrices(NellaVI,Strategy,To_win,Dice_prob);
    
end
semilogy(Change)
end