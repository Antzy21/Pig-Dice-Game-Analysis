function [C,D,n,m,stalemate]=Matrices(i,j,Dice_prob,To_win,A,B,P,Q)
% Let i be P's current score
% Let j be Q's current score
% Let k be the turn score

Top_size=To_win-i;
Bottom_size=To_win-j;
C=zeros(Top_size+Bottom_size,Top_size+Bottom_size);
D=zeros(Top_size+Bottom_size,1);
stalemate=false;

% Build top half of the matrix
for n= 1:Top_size
    k=n-1;
    for z = 1:n % Checks all values above to see if variable is used.
        if C(z,n)~=0 || n == 1 % If not an impossible GS: variable is used.
            if A(i+1,j+1,k+1) == 0 % If Banking:
                if k==0 % If Banking on 0... *sigh*
                    if B(j+1,i+1,1) == 0 % If Oppnt Banking on 0... *sigh*
                        C=0; D=0; n=Top_size; m=Top_size+Bottom_size; stalemate=true;
                        return
                    end
                    D(n)=1;
                    C(n,To_win-i+1)=1;
                else % Proper Bank:
                    D(n)=1-Q(j+1,i+k+1,1);
                end
            elseif A(i+1,j+1,k+1) == 1 % If Rolling:
                C(n,Top_size+1)=Dice_prob;
                for z = 2:Top_size-n
                    if z <= (1/Dice_prob)
                        C(n,n+z)= -Dice_prob;
                    end
                end
                D(n)= 1+sum(C(n,:))-Dice_prob;
            end
            break
        end
    end
    C(n,n)=1;
end

% Build bottom half of the matrix
for m= Top_size+1:Top_size+Bottom_size
    k=m-Top_size-1;
    for z = n+1:m % Checks all values above to see if variable is used.
        if C(z,m)~=0 || m == n+1 % If not an impossible GS: variable is used.
            if B(j+1,i+1,k+1) == 0 % If Banking
                if k==0 % If Banking on 0... *sigh*
                    D(m)=1;
                    C(m,1)=1;
                else % Proper Bank:
                    D(m)=1-P(i+1,j+k+1,1);
                end
            elseif B(j+1,i+1,k+1) == 1 % If Rolling
                C(m,1)=Dice_prob;
                for z = 2:Top_size+Bottom_size-m
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
