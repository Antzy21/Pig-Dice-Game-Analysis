function [M,Name]=Strategies_to_Matrices(S,To_win)
if isa(S, 'function_handle')
    M=zeros(To_win,To_win,To_win);
    for i=[0:To_win-1]
        for j=[0:To_win-1]
            for k=[0:To_win-1]
                M(i+1,j+1,k+1)=S(i,j,k);
            end
        end
    end
    Name=func2str(S);
elseif isa(S, 'double')
    if size(S) == [To_win,To_win,To_win]
        M=S;
        Name=inputname(1);
    else
        disp('The Matrix is not the correct size for this game')
        return
    end
end
end
