function [Strategy_A,Strategy_B,To_win,Dice_prob]=Set_Pig_Variables()
To_win     = 100;
Dice_prob  = 1/6;
Strategy_A = @Bank20;
Strategy_B = @Bank21;
end