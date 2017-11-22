fprintf('\nOptimisation Version 1\n')
Optimal_Vs=OptimiseVS(@Bank20,Number_of_Iterations,Dice_prob,To_win);
for n=2:3
    fprintf('\nOptimisation Version %d\n',n)
    Optimal_Vs=OptimiseVS(Optimal_Vs,Number_of_Iterations,Dice_prob,To_win);
end