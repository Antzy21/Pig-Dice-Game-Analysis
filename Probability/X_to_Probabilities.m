function [P,Q]=X_to_Probabilities(i,j,Strategy_A,Strategy_B,Dice_prob,To_win,P,Q)
[C,D,P_size,Q_size]=Matrices(i,j,Dice_prob,To_win,Strategy_A,Strategy_B,P,Q);
X=C\D;
for k=0:P_size-1 % Sort out P
P(i+1,j+1,k+1)=X(k+1);
end
for k=0:Q_size-1 % Sort out Q
Q(j+1,i+1,k+1)=X(P_size+k+1);
end
end