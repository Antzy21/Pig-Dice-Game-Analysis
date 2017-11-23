# Pig-Dice-Game-Analysis

Mathematical Research at Exeter University (3 year group project module)
Researching the dice game Pig.
Details on the game found on [Wikipedia](https://en.wikipedia.org/wiki/Pig_(dice_game))
________________________________________________________________________________

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

#### Title – Liam – Make it fancy and professional

#### Abstract – Josh – give us a good summary of everything to come

1. INTRO
    - A brief intro into the game of pig
    - What do we aim to achieve in this project and what is going to be presented to the reader in this report
        - Brief them on out choices
    - PIG (the Neller story)
        - What has already been done in this area regarding solutions and strategies?
    - PIGLET (the runt of the games)??
2. METHODOLOGY
    - How we set out on this dice oriented project
        - Meeting as a group – the great pig lunch
        - Meetings – what we did and what foundations did we lay?
        - The Barry touch – utilising our supervisor.
    - PIGLET
        - The starting point – hours of hand written matrices
        - The coding of this so simple game
        - Comparisons to our written notes – it was cracked
    - Transference to PIG
        - Generalising the code from piglet
        - The errors of the 0 strategies
        - Fixing the bugs in order to get  a working machine
    - Humans the feeling computers
        - What did we want to know about people playing the game?
        - What do they actually do?
    - Statistics
        - Do you get similar results playing 1000 times as you do from the theoretical probabilities?
        - What is a fair test?
        - At what point can you determine that a strategy is better than another?
    - Optimals
        - What is an optimal strategy?
        - How do you get to an optimal?
        - Is there a unique one/pair/3way?
        - Are these optimal local or global maxima?
3. FINDINGS
    - Did we “solve” PIG?
        - Have we got code that will give you the probability of you winning versus another strategy?
        - Do we fully understand pig?
    - Humans
        - How did the people perform?
        - Can we see a trend?
        - Are humans inherently greedy?
        - Do we see a universal rule of thumb as to how to play??
        - Can we code a human and play them against a computer?
    - Statistics
        - Have we determined what it means to be a better strategy?
        - Have we began to determine whether playing 1000 games is representative of a theoretical result?
        - Do we have a new number of games that you can play to be within a tolerance of being a fair representation?
    - Optimal
        - Have we decided on what kind of optimal occurs?
        - Does It depend on where in the strategy space you start, as in if you start form @HOLD20 do you reach a different maxima than @HOLD21?
        - Is NELLERS’ Optimal actually the global maxima or is it just a very close local maxima to which you have to leave a nash equilibria in order to get to?
4. CONCLUSION
    - What did we achieve
        - Have we solved the pig equations?
        - Have we figured out how people play the game?
        - Have we determined that experiments can accurately represent theroies?
        - Have we determined where the optimal’s lie?
        - Have we confirmed what neller has already thought or have we found a counter argument?
5. EVALUATION
    - Do we want to go over what we have done and give a little self evaluative overview?
    - Talking about working in a team?
    - Give our thanks to those that helped?
    - Does this actually need to be in the presentation instead? (Aswell?)
6. BIBLIOGRAPHY
    -  Liam to compile everyone’s many citations
