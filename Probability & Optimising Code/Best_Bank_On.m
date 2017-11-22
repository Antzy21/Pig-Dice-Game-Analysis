function Best_Bank_On=Best_Bank_On()

Best_Bank_On = 14;
Matrix_Best=Strategies_to_Matrices(@Bank_on_X,100,Best_Bank_On);
Best_is_best = false;

while Best_is_best == false
    for n=15:25
        if Best_Bank_On ~= n%Don't test against self
            fprintf('%d vs %d\n',Best_Bank_On,n);
            Matrix_New=Strategies_to_Matrices_Bankon(@Bank_on_X,100,n);
            [P,Q]=Probability_Matrices(Matrix_Best,Matrix_New,100,1/6);
            if P(1,1,1)>Q(1,1,1) % No new best strategy
                fprintf('Best Banker %d beats %d\n',Best_Bank_On,n)
                Best_is_best = true;
            elseif Q(1,1,1)>P(1,1,1) % New best strategy
                Best_is_best = false;
                Matrix_Best = Matrix_New;
                Best_Bank_On = n;
                fprintf('New Best Banker %d\n',Best_Bank_On)
                break
            end
        end
    end
end
        
        