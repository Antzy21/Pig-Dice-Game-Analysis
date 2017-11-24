function [C,D,n,m,stalemate]=Optimising_Matrices(i,j,Dice_prob,To_win,S,P,Q)
% Let i be P's current score
% Let j be Q's current score
% Let k be the turn score

P_size=To_win-i;
Q_size=To_win-j;
C=zeros(2*P_size+Q_size,2*P_size+Q_size);
D=zeros(2*P_size+Q_size,1);
stalemate=false;


for n= 1:2*P_size
    if n <= To_win-i % Build top half of the matrix (For P rolling)
        k=n-1; % Set value of turn score (k) for use and clarity
        C(n,n)=1; % Identity Values
        C(n,2*P_size+1)=Dice_prob; % If it looses, go to Q
        for z = 2:(To_win-i)-n
            if z <= (1/Dice_prob)
                C(n,n+z)= -Dice_prob;
            end
        end
        D(n)= sum(C(n,:))-Dice_prob; % Set value in D matrix
    elseif n > To_win-i % Build top half of the matrix (For P banking)
        k=n-2*P_size/2-1; % Set value of turn score (k) for use and clarity
        C(n,n)=1; % Identity Values
        if k==0 % If Banking on 0... *sigh*
            if S(j+1,i+1,1) == 0 % If Oppnt Banking on 0... *sigh*
                C=0; D=0; n=2*P_size; m=2*P_size+Q_size; stalemate=true;
                return
            end
            D(n)=1; % Set value in D matrix for banking on 0
            C(n,2*P_size+1)=1; % Goes to Q
        else % Proper Bank:
            D(n)=1-Q(j+1,i+k+1,1); % Set value in D matrix for normal bank
        end
    end
end

% Build bottom half of the matrix
for m= 2*P_size+1:2*P_size+Q_size
    k=m-2*P_size-1; % Set value of turn score (k) for use and clarity
    for z = 2*P_size+1:m % Checks all values above to see if variable is used.
        if C(z,m)~=0 || m == n+1 % If not an impossible GS: variable is used.
            if S(j+1,i+1,k+1) == 0 % If Banking
                if k==0 % If Banking on 0... *sigh*
                    D(m)=1;
                    C(m,1)=1;
                else % Proper Bank:
                    D(m)=1-P(i+1,j+k+1,1);
                end
            elseif S(j+1,i+1,k+1) == 1 % If Rolling
                for z = 2:2*P_size+Q_size-m
                    if z <= 1/Dice_prob
                        C(m,m+z)=-Dice_prob;
                    end
                end
                D(m)= 1+sum(C(m,:))-Dice_prob*P(i+1,j+1,k+1);
            end
            break
        end
    end
    C(m,m)=1;
end

end
