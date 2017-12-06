function game_score = series ( strategy1, strategy2, total )
	game_score = [0,0,0];
	
	for i=1:total
        w = pig_with_matrices(strategy1,strategy2);
		
		if w == 1
			game_score(1) = game_score(1) + 1;
		elseif w == 2
			game_score(2) = game_score(2) + 1;
        elseif w == 0
            game_score(3) = game_score(3) + 1;
        end
	end
end