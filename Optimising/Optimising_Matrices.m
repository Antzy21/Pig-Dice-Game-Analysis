function [C,D,P_size,Q_size,stalemate]=Optimising_Matrices(i,j,Dice_prob,To_win,Opt_Strat,Strategy,P,Q)
% Let i be P's current score
% Let j be Q's current score
% Let k be the turn score

P_size=To_win-i;
Q_size=To_win-j;
C=zeros(P_size+Q_size,P_size+Q_size);
D=zeros(P_size+Q_size,1);
stalemate=false;

% Build top half of the matrix (for P rolling)
for n= 1:P_size
    k=n-1; % Make k value for ease of reading and use
    C(n,n)=1;
    
    % When Rolling:
    C(2*P_size,2*P_size+1)=Dice_prob; % If it fails go to Q
    for z = 2:P_size-n
        if z <= (1/Dice_prob)
            if Opt_Strat(i+1,j+1,k+z+1) == 1
                C(n,n+z)= -Dice_prob; % If the next GS is to roll
            elseif Opt_Strat(i+1,j+1,k+z+1) == 0
                C(n,P_size+n+z)= -Dice_prob; % If the next GS is to bank
            end
        end
    end
    D(n)= sum(C(n,:))-Dice_prob; % Add in value for D matrix
    % When Banking:
    if k==0 % If Banking on 0... *sigh*
        if Strategy(j+1,i+1,1) == 0 % If Oppnt Banking on 0... *sigh*
            C=0; D=0; stalemate=true;
            return
        end
        D(P_size+n)=1; % Value for D matrix
        C(P_size+n,2*P_size+1)=1; % Go straight to Q
    else % Proper Bank:
        D(P_size+n)=1-Q(j+1,i+k+1,1); % Value for D matrix
    end
end

% Build bottom half of the matrix
for m= 2*P_size+1:2*P_size+Q_size
    k=m-2*P_size-1; % Make k value for ease of reading and use
    for z = P_size+1:m % Checks all values above to see if variable is used.
        if C(z,m)~=0 || m == P_size+1 % If not an impossible GS: variable is used.
            if Strategy(j+1,i+1,k+1) == 0 % If Banking
                if k==0 % If Banking on 0... *sigh*
                    D(m)=1;
                    C(m,1)=1;
                else % Proper Bank:
                    D(m)=1-P(i+1,j+k+1,1);
                end
            elseif Strategy(j+1,i+1,k+1) == 1 % If Rolling
                C(m,1)=Dice_prob;
                for z = 2:P_size+Q_size-m
                    if z <= 1/Dice_prob
                        C(m,m+z)=-Dice_prob;
                    end
                end
                D(m)= 1+sum(C(m,:))-Dice_prob;
            end
            break
        end
    end
    C(m,m)=1;
end

end
