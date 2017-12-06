function Barrie_results_comparison()
[~,P1,~]=Optimising_Probability_Matrices(@Roll,@Bank2,3,1/2);
[~,P2,~]=Optimising_Probability_Matrices(@Roll,@Bank2,5,1/2);
[~,P3,~]=Optimising_Probability_Matrices(@Roll,@Bank2,10,1/2);
[~,P4,~]=Optimising_Probability_Matrices(@Roll,@Bank4,10,1/2);
[~,P5,~]=Optimising_Probability_Matrices(@Roll,@Bank20,100,1/6);
[~,P6,~]=Optimising_Probability_Matrices(@Roll,@Bank21,100,1/6);
if abs(P1(1,1,1) - 0.65185) < 0.001
    fprintf('%f = 0.65185 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',2,3)
end
if abs(P2(1,1,1) - 0.64362) < 0.001
    fprintf('%f = 0.64362 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',2,5)
end
if abs(P3(1,1,1) - 0.632664) < 0.001
    fprintf('%f = 0.632664 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',2,10)
end
if abs(P4(1,1,1) - 0.574) < 0.001
    fprintf('%f = 0.574 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',4,10)
end
if abs(P5(1,1,1) - 0.587367) < 0.001
    fprintf('%f = 0.587367 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',20,100)
end

if abs(P6(1,1,1) - 0.59718) < 0.001
    fprintf('%f = 0.59718 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',21,100)
end
end