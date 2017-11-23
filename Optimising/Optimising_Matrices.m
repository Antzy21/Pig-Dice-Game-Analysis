function [C,D,n1,n2,m,stalemate]=Optimising_Matrices(i,j,Dice_prob,To_win,S,P,Q)
% Let i be P's current score
% Let j be Q's current score
% Let k be the turn score

Matrix_Size = 3*To_win-2*i-j;
C=zeros(Matrix_Size,Matrix_Size);
D=zeros(Matrix_Size,1);
stalemate=false;

% Build top half of the matrix (For P rolling)
for n1= 1:To_win-i
    k=n1-1; % Set value of turn score (k) for use and clarity
    C(n1,n1)=1; % Identity Values
    C(n1,2*(To_win-i)+1)=Dice_prob; % If it looses, go to Q
    for z = 2:(To_win-i)-n1
        if z <= (1/Dice_prob)
            C(n1,n1+z)= -Dice_prob;
        end
    end
    D(n1)= 1+sum(C(n1,:))-Dice_prob; % Set value in D matrix
end

% Build top half of the matrix (For P banking)
for n2= n1:2*(To_win-i)
    k=n2-1; % Set value of turn score (k) for use and clarity
    C(n2,n2)=1; % Identity Values
    if k==0 % If Banking on 0... *sigh*
        if S(j+1,i+1,1) == 0 % If Oppnt Banking on 0... *sigh*
            C=0; D=0; n2=To_win-i; m=n2+To_win-j; stalemate=true;
            return
        end
        D(n2)=1; % Set value in D matrix for banking on 0
        C(n2,2*(To_win-i)+1)=1; % Goes to Q
    else % Proper Bank:
        D(n2)=1-Q(j+1,i+k+1,1); % Set value in D matrix for normal bank
    end
end

% Build bottom half of the matrix
for m= n2+1:n2+To_win-j
    k=m-(To_win-i)-1; % Set value of turn score (k) for use and clarity
    for z = n2+1:m % Checks all values above to see if variable is used.
        if C(z,m)~=0 || m == n2+1 % If not an impossible GS: variable is used.
            if S(j+1,i+1,k+1) == 0 % If Banking
                if k==0 % If Banking on 0... *sigh*
                    D(m)=1;
                    C(m,1)=1;
                else % Proper Bank:
                    D(m)=1-P(i+1,j+k+1,1);
                end
            elseif B(j+1,i+1,k+1) == 1 % If Rolling
                C(m,1)=Dice_prob;
                for z = 2:(To_win-j)-(m-n2)
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
