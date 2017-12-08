function BankOnX_Battle()
W=zeros(30,30);
tic;
while max(W)<5
for m=10:29
    for n=m+1:30
        fprintf('(%d,%d)\n',m,n)
        m_wins = 0;
        n_wins = 0;
        while max(m_wins,n_wins)<10;
            s=series_BankOnX(m,n,200);
            if     s(1)>s(2)
                m_wins = m_wins+1;
            elseif s(2)>s(1) 
                n_wins = n_wins+1;
            end
        end
        if m_wins > n_wins
            W(m-9,n-9)=W(m-9,n-9)+1;
        end            
    end
end
end
toc;