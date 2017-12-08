function game_score = series_BankOnX(M,N,total)
	half = floor(total/2);
	game_score = [0,0];
	
	for i=1:half
		w = pig_BankOnX(M,N);
		
		if w == 1
			game_score(1) = game_score(1) + 1;
		elseif w == 2
			game_score(2) = game_score(2) + 1;
        end
		
		w = pig_BankOnX(M,N);
		
		if w == 2
			game_score(1) = game_score(1) + 1;
		elseif w == 1
			game_score(2) = game_score(2) + 1;
        end
	end
end