function Tests_to_run()
[~,~]=Probability_Matrices(@Bank20, @Bank21, 100, 1/6);
[~,~]=Probability_Matrices(@Bank10, @Bank15, 100, 1/6);
[~,~]=Probability_Matrices(@Bank0, @Bank20, 100, 1/6);
[~,~]=Probability_Matrices(@Bank20, @Bank0, 100, 1/6);
[~,~]=Probability_Matrices(@Bank0, @Bank0, 100, 1/6);
[~,~]=Probability_Matrices(@Delay10Bank20, @jEvenBank20, 100, 1/6);
end