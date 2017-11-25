function Stalemate=Catch_Stalemates(A,B,To_win)
Stalemate = false;
for i=0:To_win
    for j=0:To_win
        if A(i+1,j+1,0) == 0 && B(i+1,j+1,0) == 0
            Stalemate = true;
        end
    end
end
end