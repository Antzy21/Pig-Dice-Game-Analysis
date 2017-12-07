function [C,D,Pi_size,Pj_size]=Nella_Matrix(i,j,To_win,Dice_prob,P,Nella)

if i == j
    P_size=To_win-i;
    C=zeros(2*P_size,2*P_size);
    D=zeros(2*P_size,1);
    
    for n= 1:P_size
        k=n-1; % Set value of turn score (k) for use and clarity

        % When Rolling:
        C(n,n)=1; % Set Identity Values
        for z = 2:1/Dice_prob % For all the possible value to add to the score
            if i+k+z < To_win % So long as the GS is not won
                if     Nella(i+1,j+1,k+z+1) == 1 % If Nella(i,j,k+z) future GS is rolling
                    C(n,n+z)        = -Dice_prob;
                elseif Nella(i+1,j+1,k+z+1) == 0 % If Nella(i,j,k+z) future GS is banking
                    C(n,P_size+n+z) = -Dice_prob;
                end
            end
        end
        C(n,1) = Dice_prob; % If it loses, go to P(i,j,0) (Roll not Bank on 0)
        D(n)   = sum(C(n,:))-Dice_prob; % Value for D matrix

        % When Banking:
        C(P_size+n,P_size+n)=1; % Set Identity Values
        D(P_size+n)=1-P(j+1,i+k+1,1);  % Value for D matrix
    end
    % Single occasion in Matrix for P banking on 0, going to a rolling version of itself (Roll not Bank on 0)
    D(P_size+1)=1; % Value for D matrix
    C(P_size+1,1)=1; % Call Rolling P(i,j,0) GS in the matrix
    % Single occasion in Matrix for P rolling on 0 and failing, going to itself (Roll not Bank on 0)
    C(1,1) = 1+Dice_prob; % If it loses, go to P(i,j,0) (Roll not Bank on 0)
    D(1)   = sum(C(n,:))-Dice_prob; % Value for D matrix
    
    Pi_size=P_size; Pj_size=P_size;
elseif i ~= j
    Pi_size=To_win-i;
    Pj_size=To_win-j;
    C=zeros(2*Pi_size+2*Pj_size,2*Pi_size+2*Pj_size);
    D=zeros(2*Pi_size+2*Pj_size,1);
    
    for n= 1:Pi_size
        k=n-1; % Set value of turn score (k) for use and clarity
        
        % When Rolling:
        C(n,n)=1; % Set Identity Values
        for z = 2:1/Dice_prob % For all the possible value to add to the score
            if i+k+z < To_win % So long as the GS is not won
                if     Nella(i+1,j+1,k+z+1) == 1 % If Nella(i,j,k+z) future GS is rolling
                    C(n,n+z)        = -Dice_prob;
                elseif Nella(i+1,j+1,k+z+1) == 0 % If Nella(i,j,k+z) future GS is banking
                    C(n,Pi_size+n+z) = -Dice_prob;
                end
            end
        end
        C(n,2*Pi_size+1) = Dice_prob; % If it loses, go to P(j,i,0) (Roll not Bank on 0)
        D(n) = sum(C(n,:))-Dice_prob;   % Value for D matrix
        
        % When Banking:
        C(Pi_size+n,Pi_size+n)=1; % Set Identity Values
        D(Pi_size+n)=1-P(j+1,i+k+1,1);  % Value for D matrix
    end
    % Single occasion in Matrix for P banking on 0 go to P(i,j,0) (Roll not Bank on 0)
    D(Pi_size+1)  =1; % Value for D matrix
    C(Pi_size+1,2*Pi_size+1)=1; % Call Rolling P(j,i,0) GS in the matrix
    
    for m= 2*Pi_size+1:2*Pi_size+Pj_size
        k=m-2*Pi_size-1; % Set value of turn score (k) for use and clarity
        
        % When Rolling:
        C(m,m)=1; % Set Identity Values
        for z = 2:1/Dice_prob % For all the possible value to add to the score
            if i+k+z < To_win % So long as the GS is not won
                if     Nella(j+1,i+1,k+z+1) == 1 % If Nella(j,i,k+z) future GS is rolling
                    C(m,m+z)        = -Dice_prob;
                elseif Nella(j+1,i+1,k+z+1) == 0 % If Nella(j,i,k+z) future GS is banking
                    C(m,Pj_size+m+z) = -Dice_prob;
                end
            end
        end
        C(m,1) = Dice_prob; % If it loses, go to P(i,j,0) (Roll not Bank on 0)
        D(m) = sum(C(m,:))-Dice_prob;   % Value for D matrix
        
        % When Banking:
        C(Pj_size+m,Pj_size+m)=1; % Set Identity Values
        D(Pj_size+m)=1-P(i+1,j+k+1,1);  % Value for D matrix
    end
    % Single occasion in Matrix for P banking on 0 go to P(i,j,0) (Roll not Bank on 0)
    D(2*Pi_size+Pj_size+1)  =1; % Value for D matrix
    C(2*Pi_size+Pj_size+1,1)=1; % Call Rolling P(i,j,0) GS in the matrix
    
end

end