function [C,D,P_size,Q_size]=Matrices(i,j,Dice_prob,To_win,A,B,P,Q)
% Let i be P's current score
% Let j be Q's current score
% Let k be the turn score

P_size=To_win-i;
Q_size=To_win-j;
C=zeros(P_size+Q_size,P_size+Q_size);
D=zeros(P_size+Q_size,1);

% Build top half of the matrix
for n= 1:P_size
    k=n-1; % Set value of turn score (k) for use and clarity
    for z = 1:n % Checks all values above to see if variable is used.
        if C(z,n)~=0 || n == 1 % If not an impossible GS: variable is used.
            
            if A(i+1,j+1,k+1) == 1 % If Rolling:
                for z = 2:1/Dice_prob % For all the possible value to add to the score
                    if i+k+z < To_win % So long as the GS is not won
                        C(n,n+z)= -Dice_prob;
                    end
                end
                C(n,P_size+1)=Dice_prob; % If it loses, go to Q
                D(n)= 1+sum(C(n,:))-Dice_prob; % Value for D matrix
            end
                
            if A(i+1,j+1,k+1) == 0 % If Banking:
                if k==0 % If Banking on 0... *sigh*
                    D(n)=1; % Value for D matrix
                    C(n,P_size+1)=1; % Call Q GS in the matrix
                else % Proper Bank:
                    D(n)=1-Q(j+1,i+k+1,1);
                end
            end
            
            break
        end
    end
    C(n,n)=1;
end

% Build bottom half of the matrix
for m= P_size+1:P_size+Q_size
    k=m-P_size-1;
    for z = n+1:m % Checks all values above to see if variable is used.
        if C(z,m)~=0 || m == n+1 % If not an impossible GS: variable is used.
            
            if B(j+1,i+1,k+1) == 1 % If Rolling
                for z = 2:1/Dice_prob % For all the possible value to add to the score
                    if j+k+z < To_win % So long as the GS is not won
                        C(m,m+z)=-Dice_prob;
                    end
                end
                C(m,1)=Dice_prob; % If it loses, go to P
                D(m)= 1+sum(C(m,:))-Dice_prob; % Value for D matrix
            end
            
            if B(j+1,i+1,k+1) == 0 % If Banking
                if k==0 % If Banking on 0... *sigh*
                    D(m)=1; % Value for D matrix
                    C(m,1)=1; % Call Q GS in the matrix
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
