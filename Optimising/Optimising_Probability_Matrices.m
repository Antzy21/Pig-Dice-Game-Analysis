function [P,Q,Opt]=Optimising_Probability_Matrices(Opt,Str,To_win,Dice_prob)

% Set up P & Q probabilities as a matrix
P=zeros(To_win,To_win,To_win);
Q=zeros(To_win,To_win,To_win);

% Set up Stregies as Matrices (If they aren't Stregies already)
[Opt,Opt_name]=Stregies_to_Matrices(Opt,To_win);
[Str,Str_name]=Stregies_to_Matrices(Str,To_win);

% Check for Stalemates
[Stalemate,i,j]=Catch_Stalemates(Opt,Str,To_win);
if Stalemate == 1
    fprintf('A Stalemate has occured when ''%s'' has %d points and when ''%s'' has %d points\n',Name_A,i,Name_B,j);
    return
end

for i=To_win-1:-1:0
    for j=To_win-1:-1:0
        [C,D,P_size,Q_size]=Optimising_Matrices(i,j,Dice_prob,To_win,Opt,Str,P,Q);
        X=C\D;
        for k=0:P_size-1 % Sort out P
            Proll = X(k+1);
            Pbank = X(P_size+k+1);
            if      Proll > Pbank
                P(i+1,j+1,k+1)   = Proll;   % Set probability Value
                Opt(i+1,j+1,k+1) = 1; % Set best choice in Stregy
            elseif  Pbank < Proll
                P(i+1,j+1,k+1)   = Pbank;   % Set probability Value
                Opt(i+1,j+1,k+1) = 0; % Set best choice in Stregy
            end
        end
        for k=0:Q_size-1 % Sort out Q
            Q(j+1,i+1,k+1)=X(2*P_size+k+1);
        end
    end
end

fprintf('Probability of optimised ''%s'' winning when going first is %f\n',Opt_name,P(1,1,1));
fprintf('Probability of ''%s'' winning when going first is %f\n',Str_name,Q(1,1,1));

end