function [Stalemate,i,j]=Catch_Stalemates(A,B,To_win)
Stalemate = false;
for i=0:To_win-1
    for j=0:To_win-1
        if A(i+1,j+1,1) == 0 && B(i+1,j+1,1) == 0
            Stalemate = true;
            return
        end
    end
end
end