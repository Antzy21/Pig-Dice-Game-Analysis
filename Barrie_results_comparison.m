[~,P,~]=Optimising_Probability_Matrices(@Roll,@Bank2,3,1/2);
if abs(P(1,1,1) - 0.65185) < 0.001
    fprintf('%f = 0.65185 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',2,3)
end
[~,P,~]=Optimising_Probability_Matrices(@Roll,@Bank2,5,1/2);
if abs(P(1,1,1) - 0.64362) < 0.001
    fprintf('%f = 0.64362 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',2,5)
end
[~,P,~]=Optimising_Probability_Matrices(@Roll,@Bank2,10,1/2);
if abs(P(1,1,1) - 0.632664) < 0.001
    fprintf('%f = 0.632664 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',2,10)
end
[~,P,~]=Optimising_Probability_Matrices(@Roll,@Bank4,10,1/2);
if abs(P(1,1,1) - 0.574) < 0.001
    fprintf('%f = 0.574 \n',P(1,1,1))
else
    fprintf('Not the same: Bank on %d, %d to win\n',4,10)
end