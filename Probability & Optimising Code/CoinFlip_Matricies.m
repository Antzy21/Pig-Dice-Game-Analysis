function [C,D,n,m]=Matricies(i,j,Dice_prob,To_win,A,B,P,Q)
% Let i be P's current score
% Let j be Q's current score
% Let k be the turn score

C=zeros(2*To_win-i-j,2*To_win-i-j);
D=zeros(2*To_win-i-j,1);

% build top half of the matrix
for n=[1:To_win-i]
    k=n-1;
    C(n,n)=1;
    
    % If Bank
    if A(i+1,j+1,k+1) == 0
        if A(i+1,j+1,k) == 0
            %Impossible as already banked
        else
            %Successful bank
            D(n)=1-Q(j+1,i+k+1,1);
        end
        
    % If Flip
    elseif A(i+1,j+1,k+1) == 1
        % Continue to next game state
        if i+k+1 < To_win
            C(n,n+1)=-Dice_prob;
            C(n,To_win-i+1)=Dice_prob;
            D(n)=Dice_prob;
        % Win if succesful flip
        elseif i+k+1 == To_win
            C(n,n+1)=Dice_prob;
            D(n)=1;
        % Impossible situations
        elseif i+k+1 > To_win
        end
    end
end

% build bottom half of the matrix
for m=[n+1:n+To_win-j]
    k=m-(To_win-i)-1;
    C(m,m)=1;
    
    % If Bank
    if B(i+1,j+1,k+1) == 0
        if B(i+1,j+1,k) == 0
            %Impossible as already banked
        else
            % Successful bank
            D(m)=1-P(i+1,j+k+1,1);
        end
        
    % If Flip
    elseif B(i+1,j+1,k+1) == 1
        % Continue to next game state
        if j+k+1 < To_win
            C(m,m+1)=-Dice_prob;
            C(m,1)=Dice_prob;
            D(m)=Dice_prob;
        % Win if succesful flip
        elseif j+k+1 == To_win
            C(m,1)=Dice_prob;
            D(m)=1;
        % Impossible situations
        elseif j+k+1 > To_win
        end
    end
end

end
