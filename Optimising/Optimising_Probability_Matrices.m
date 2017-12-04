function [Opt,P,Q]=Optimising_Probability_Matrices(Opt,Str,To_win,Dice_prob)

% Set up P & Q probabilities as a matrix
[P,Q]=P_M_NoComment(Opt,Str,To_win,Dice_prob);

% Set up Stregies as Matrices (If they aren't Strategies already)
[Opt]=Strategies_to_Matrices(Opt,To_win);
[Str]=Strategies_to_Matrices(Str,To_win);

% Check for Stalemates
[Stalemate,i,j]=Catch_Stalemates(Opt,Str,To_win);
if Stalemate == 1
    fprintf('A Stalemate has occured when ''%s'' has %d points and when ''%s'' has %d points\n',Name_A,i,Name_B,j);
    return
end

for i=To_win-1:-1:0
    for j=To_win-1:-1:0
            
            Continue = 1; % Always run at least once
            
            Iters = 0;
            
            while (Continue == 1 && Iters < 10)
            
            Iters = Iters + 1;
            
            fprintf('Game State (%d,%d) Iteration:%d\n',i,j,Iters)

            [C,D,P_size,~]=Optimising_Matrices(i,j,Dice_prob,To_win,Opt,Str,P,Q); X=C\D;

            Proll=zeros(P_size,1);
            Pbank=zeros(P_size,1);

            for k=0:P_size-1 % Sort out P
                Proll(k+1) = X(k+1);
                Pbank(k+1) = X(P_size+k+1);
                if      Proll(k+1) > Pbank(k+1) && Opt(i+1,j+1,k+1) ~= 1; % If rolling is better & current doesn't roll
                    Opt(i+1,j+1,k+1) = 1; % Change Strategy to roll
                    fprintf('The strategy has changed to roll at (%d,%d,%d), re-calculate\n',i,j,k);
                    Continue = 1;
                elseif  Pbank(k+1) > Proll(k+1) && Opt(i+1,j+1,k+1) ~= 0; % If banking is better & current doesn't bank
                    Opt(i+1,j+1,k+1) = 0; % Change Strategy to bank
                    fprintf('The strategy has changed to bank at (%d,%d,%d), re-calculate\n',i,j,k);
                    Continue = 1;
                else
                    %fprintf('The strategy is stababilise at (%d,%d,%d)\n',i,j,k)
                    Continue = 0;
                end
            end

            % Recalculate P & Q probabilites to use in re-run
            [P,Q]=P_M_NoComment(Opt,Str,To_win,Dice_prob);

        end
    end
end

[P,Q]=Probability_Matrices(Opt,Str,To_win,Dice_prob);

end