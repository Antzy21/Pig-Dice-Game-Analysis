function [Nella,P]=Nella_Probability(To_win,Dice_prob)

% Set up Nella Strategy as a matrix
Nella=ones(To_win,To_win,To_win);

% Set up P probabilities as a matrix
[P,~]=Probability_Matrices(Nella,Nella,To_win,Dice_prob);

for i=To_win-1:-1:0
    for j=i:-1:0
        fprintf('Game State (%d,%d)\n',i,j)
        % Always run at least once
        Continue = 1;
        
        while Continue == 1
            
            % Assume correct unless proven otherwise
            Continue = 0;
            
            % Create Matrices & Calculate Probabilities
            [C,D,Pi_size,Pj_size]=Nella_Matrix(i,j,To_win,Dice_prob,P,Nella); X=C\D;
            
            if i == j 
                % Save rolling and banking probabilities from X respectively
                Proll = X(1:Pi_size);
                Pbank = X(Pi_size+1:2*Pi_size);
                for k=0:Pi_size-1 % Sort out P

                    if      Proll(k+1) > Pbank(k+1) && Nella(i+1,j+1,k+1) ~= 1; % If rolling is better & current doesn't roll
                        Nella(i+1,j+1,k+1) = 1; % Change Strategy to roll
                        fprintf('The strategy has changed to roll at (%d,%d,%d), re-calculate\n',i,j,k);
                        % Recalculate P & Q probabilites (for specific i and j only) to use in re-run
                        [P,~]=X_to_Probabilities(i,j,Nella,Nella,Dice_prob,To_win,P,P);
                        Continue = 1;

                    elseif  Pbank(k+1) > Proll(k+1) && Nella(i+1,j+1,k+1) ~= 0; % If banking is better & current doesn't bank
                        Nella(i+1,j+1,k+1) = 0; % Change Strategy to bank
                        fprintf('The strategy has changed to bank at (%d,%d,%d), re-calculate\n',i,j,k);
                        % Recalculate P & Q probabilites (for specific i and j only) to use in re-run
                        [P,~]=X_to_Probabilities(i,j,Nella,Nella,Dice_prob,To_win,P,P);
                        Continue = 1;
                    else
                        fprintf('The strategy is stable at (%d,%d,%d)\n',i,j,k)
                    end
                end
                
            else
                % Save rolling and banking probabilities for (i,j) from X respectively
                Proll = X( 1                   : Pi_size             );
                Pbank = X( Pi_size+1           : 2*Pi_size           );
                for k=0:Pi_size-1 % Sort out P

                    if      Proll(k+1) > Pbank(k+1) && Nella(i+1,j+1,k+1) ~= 1; % If rolling is better & current doesn't roll
                        Nella(i+1,j+1,k+1) = 1; % Change Strategy to roll
                        fprintf('The strategy has changed to roll at (%d,%d,%d), re-calculate\n',i,j,k);
                        % Recalculate P & Q probabilites (for specific i and j only) to use in re-run
                        [P,~]=X_to_Probabilities(i,j,Nella,Nella,Dice_prob,To_win,P,P);
                        Continue = 1;

                    elseif  Pbank(k+1) > Proll(k+1) && Nella(i+1,j+1,k+1) ~= 0; % If banking is better & current doesn't bank
                        Nella(i+1,j+1,k+1) = 0; % Change Strategy to bank
                        fprintf('The strategy has changed to bank at (%d,%d,%d), re-calculate\n',i,j,k);
                        % Recalculate P & Q probabilites (for specific i and j only) to use in re-run
                        [P,~]=X_to_Probabilities(i,j,Nella,Nella,Dice_prob,To_win,P,P);
                        Continue = 1;
                    else
                        fprintf('The strategy is stable at (%d,%d,%d)\n',i,j,k)
                    end
                end
                
                % Save rolling and banking probabilities for (j,i) from X respectively
                Proll = X( 2*Pi_size+1         : 2*Pi_size+Pj_size   );
                Pbank = X( 2*Pi_size+Pj_size+1 : 2*Pi_size+2*Pj_size );
                for k=0:Pj_size-1 % Sort out P

                    if      Proll(k+1) > Pbank(k+1) && Nella(j+1,i+1,k+1) ~= 1; % If rolling is better & current doesn't roll
                        Nella(j+1,i+1,k+1) = 1; % Change Strategy to roll
                        % fprintf('The strategy has changed to roll at (%d,%d,%d), re-calculate\n',i,j,k);
                        % Recalculate P & Q probabilites (for specific i and j only) to use in re-run
                        [P,~]=X_to_Probabilities(i,j,Nella,Nella,Dice_prob,To_win,P,P);
                        Continue = 1;

                    elseif  Pbank(k+1) > Proll(k+1) && Nella(j+1,i+1,k+1) ~= 0; % If banking is better & current doesn't bank
                        Nella(j+1,i+1,k+1) = 0; % Change Strategy to bank
                        % fprintf('The strategy has changed to bank at (%d,%d,%d), re-calculate\n',i,j,k);
                        % Recalculate P & Q probabilites (for specific i and j only) to use in re-run
                        [P,~]=X_to_Probabilities(i,j,Nella,Nella,Dice_prob,To_win,P,P);
                        Continue = 1;
                    else
                        % fprintf('The strategy is stable at (%d,%d,%d)\n',i,j,k)
                    end
                end
                
            end
            
        end % while loop end
        
    end % for j end
end % for i end

end
