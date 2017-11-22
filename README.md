# Pig-Dice-Game-Analysis

'LaTeX Report' contains our report in Latex form, with file needed to compile it.

'Optimising' contains code for trying to produce an optimal solution against any Strategy.

'Other interesting code' contains other code that has been produced, mostly for interest or experiments.

'Probability' contains code for giving the probability that any Strategy will beat another.

'Run Pig' contains Code for running the game.

'Strategies' contains strategies to run for the game.
________________________________________________________________________________

A collection of Matlab functions, to achieve a certain goal, call on each other in an order notated as such:
e.g. Function 1 <- (Function 2, Function 3 <- Function 4)
Where Function 1 calls on Function 2 and Function 3, and within that, function 3 calls on function 4.
Here are a list of objectives and the code that will produce the desired output.

Finding probability of strategies winning against eachother:
Probability_Matrices <- (Matrices, Strategies_to_Matrices)

Optimising a Strategy against another attempt 1:
OptimisingVs <- Probability_Matrices <- (Matrices, Strategies_to_Matrices)

Repeating Optimisations to find an optimal Strategy:
OptimisingVs_Iterative <- OptimisingVs <- Probability_Matrices <- (Matrices, Strategies_to_Matrices)
________________________________________________________________________________
