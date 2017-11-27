function Tests_to_run(Type,Game)

if strcmp(Game,'Pig')
    [~,~,To_win,Dice_prob]=Set_Pig_Variables();
elseif strcmp(Game,'Piglet')
    [~,~,To_win,Dice_prob]=Set_Piglet_Variables();
else
    disp('Please choose appropriate Game')
end
    
if strcmp(Type,'Prob')
    [~,~]=Probability_Matrices(@Bank20, @Bank21, To_win, Dice_prob);
    [~,~]=Probability_Matrices(@Bank10, @Bank15, To_win, Dice_prob);
    [~,~]=Probability_Matrices(@Bank0, @Bank20, To_win, Dice_prob);
    [~,~]=Probability_Matrices(@Bank20, @Bank0, To_win, Dice_prob);
    [~,~]=Probability_Matrices(@Bank0, @Bank0, To_win, Dice_prob);
    [~,~]=Probability_Matrices(@Delay10Bank20, @jEvenBank20, To_win, Dice_prob);
elseif strcmp(Type,'Opt')
    [~,~]=Probability_Matrices(@Bank20, @Bank21, To_win, Dice_prob);
    [~,~,Opt]=Optimising_Probability_Matrices(@Bank20,@Bank21,To_win,Dice_prob);
    [~,~,Opt]=Optimising_Probability_Matrices(Opt,@Bank21,To_win,Dice_prob);
    [~,~,Opt]=Optimising_Probability_Matrices(Opt,@Bank21,To_win,Dice_prob);
    [~,~,Opt]=Optimising_Probability_Matrices(Opt,@Bank21,To_win,Dice_prob);
else
    disp('Please choose appropriate Type')
end
end