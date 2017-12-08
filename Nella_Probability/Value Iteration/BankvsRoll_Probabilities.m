function [Bank,Roll] = BankvsRoll_Probabilities(p,i,j,k,To_win,Dice_prob)

Roll_a = ones(1,1/Dice_prob);

Roll_a(1) = 1-p(j+1,i+1,1); % loose and pass to opponent

for r = 2:1/Dice_prob
    if i+k+r < To_win 
        Roll_a(r) = p(i+1,j+1,(k+1)+r); % add r to turnscore
    end
end

Roll     = sum(Roll_a)*Dice_prob;
Bank     = 1-p(j+1,(i+k)+1,1);

end