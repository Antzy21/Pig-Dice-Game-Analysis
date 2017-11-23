function M=Strategies_to_Matricies_Bankon(S,To_win,X)

M=zeros(To_win,To_win,To_win);

for i=[0:To_win-1]
    for j=[0:To_win-1]
        for k=[0:To_win-1]
            M(i+1,j+1,k+1)=S(i,j,k,X);
        end
    end
end

end
