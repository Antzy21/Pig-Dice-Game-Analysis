# Pig-Dice-Game-Analysis

'Run Pig' contains Code for running the game.

'Strategies' contains strategies to run for the game.

'LaTeX Report' contains our report in Latex form, with file needed to compile it

'Probability & Optimising Code' contains all code for calculating the probability of each strategy winning against another
___

Each other file is a function that calls on other ones in such an order that is notated as such:
e.g: Function 1 <- (Function 2, Function 3 <- Function 4)
Where Function 1 calls on Function 2 and Function 3, and within that, function 3 calls on function 4.
___
Finding probability of strategies winning against eachother:
Probability_Matrices <- (Matrices, Strategies_to_Matrices)

Optimising a Strategy against another attempt 1:
OptimisingVs <- Probability_Matrices <- (Matrices, Strategies_to_Matrices)

Repetative Optimisations:
OptimisingVs_Iterative <- OptimisingVs <- Probability_Matrices <- (Matrices, Strategies_to_Matrices)
___
