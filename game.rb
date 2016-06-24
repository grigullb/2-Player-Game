
@p1_lives = 3
@p2_lives = 3
@p1_points = 0
@p2_points = 0

def random_number
	number = rand(20)
end 

def generate_question
	@num1 = random_number
	@num2 = random_number
	question = "What does #{@num1} + #{@num2} equal"
end

def generate_answer
	@answer = @num1 + @num2
end

def check_p1(player_answer)
	if @answer != player_answer
		puts "WRONG"
		puts "Player 1 remaining lives: #{@p1_lives -= 1}"
	else
		puts "CORRECT"
		puts "Player 1 points: #{@p1_points += 1}"
	end
end

def check_p2(player_answer)
	if @answer != player_answer
		puts "WRONG"
		puts "Player 2 remaining lives: #{@p2_lives -= 1}"
	else
		puts "CORRECT"
		puts "Player 2 points: #{@p2_points += 1}"
	end
end

def get_player_answer
	answer=gets.chomp.to_i
end

begin
	alive = true
	if @p1_lives> 0 && @p2_lives > 0
		puts "PLAYER 1 TURN"
		puts generate_question
		generate_answer
		print "Answer: "
		check_p1(get_player_answer)
		puts " "
	else
		alive = false
	end
	if @p2_lives > 0 && @p1_lives> 0
		puts "PLAYER 2 TURN"
		puts generate_question
		generate_answer
		print "Answer: "
		check_p2(get_player_answer)
		puts " "
	else
		alive = false
	end
end while alive 
if @p1_lives > 0
	puts "Player 1 WINS! Final score: #{@p1_points}"
else
	puts "Player 2 WINS! Final score: #{@p2_points}"
end
puts "Goodbye"
