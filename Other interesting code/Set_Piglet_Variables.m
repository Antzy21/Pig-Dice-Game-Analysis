function [Strategy_A,Strategy_B,To_win,Dice_Prob]=Set_Piglet_Variables()
To_win     = 3;
Dice_prob  = 1/2;
Strategy_A = @Bank3;
Strategy_B = @Bank2;
end