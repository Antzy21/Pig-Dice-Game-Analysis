function [C,D,P_size,Q_size]=Optimising_Matrices(i,j,Dice_prob,To_win,Opt,Strat,P,Q)
% Let i be P's current score
% Let j be Q's current score
% Let k be the turn score

P_size=To_win-i;
Q_size=To_win-j;
C=zeros(2*P_size+Q_size,2*P_size+Q_size);
D=zeros(2*P_size+Q_size,1);

% Build top half of the matrix
for n= 1:P_size
    k=n-1; % Set value of turn score (k) for use and clarity
	
    % When Rolling:
    C(n,n)=1; % Set Identity Values
    for z = 2:1/Dice_prob % For all the possible value to add to the score
        if i+k+z < To_win % So long as the GS is not won
            if     Opt(i+1,j+1,k+1) == 1 % If Opt's future GS is rolling
                C(n,n+z)        = -Dice_prob;
            elseif Opt(i+1,j+1,k+1) == 0 % If Opt's future GS is banking
                C(n,P_size+n+z) = -Dice_prob;
            end
        end
    end
    C(n,2*P_size+1)=Dice_prob;   % If it loses, go to Q
    D(n)= sum(C(n,:))-Dice_prob; % Value for D matrix

	% When Banking:
    C(P_size+n,P_size+n)=1; % Set Identity Values
    D(P_size+n)=1-Q(j+1,i+k+1,1);  % Value for D matrix
end

% Single occasion in Matrix for P banking on 0
D(P_size+1)=1;     % Value for D matrix
C(P_size+1,2*P_size+1)=1; % Call Q GS in the matrix

% Build bottom half of the matrix
for m= 2*P_size+1:2*P_size+Q_size
    k=m-2*P_size-1;
    for v = 2*P_size+1:m % Checks all values above to see if variable is used.
        if C(v,m)~=0 || m == 2*P_size+1 % If not an impossible GS: variable is used.
            
            if Strat(j+1,i+1,k+1) == 1 % If Rolling
                for z = 2:1/Dice_prob % For all the possible value to add to the score
                    if j+k+z < To_win % So long as the GS is not won
                        C(m,m+z)=-Dice_prob;
                    end
                end
                if     Opt(i+1,j+1,k+1) == 1 % If Opt's future GS is rolling
                    C(m,1)=Dice_prob;        % If it loses, go to P
                elseif Opt(i+1,j+1,k+1) == 0 % If Opt's future GS is banking
                    C(m,P_size+1)=Dice_prob; % If it loses, go to P
                end
                D(m)= 1+sum(C(m,:))-Dice_prob; % Value for D matrix
            end
            
            if Strat(j+1,i+1,k+1) == 0 % If Banking
                if k==0 % If Banking on 0... *sigh*
                    D(m)=1; % Value for D matrix
                    if     Opt(i+1,j+1,k+1) == 1 % If Opt's future GS is rolling
                        C(m,1)=Dice_prob;        % Go to P
                    elseif Opt(i+1,j+1,k+1) == 0 % If Opt's future GS is banking
                        C(m,P_size+1)=Dice_prob; % Go to P
                    end
                else % Proper Bank:
                    D(m)=1-P(i+1,j+k+1,1);
                end
            end
            
            break
        end
    end
    C(m,m)=1;
end

end
