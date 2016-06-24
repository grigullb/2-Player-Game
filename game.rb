require_relative 'Player'
require_relative 'Question'
require 'colorize'

class Game
	def initialize
		@player_1 = Player.new
		@player_2 = Player.new
		@question = Question.new
		@current_player = @player_1
	end

	def enter_names
		print "Player 1, enter your name: "
		@player_1.get_player_name
		print "Player 2, enter your name: "
		@player_2.get_player_name
		puts " "
	end

	def ask_player
			@question.generate_new
			puts "#{@current_player.name}, #{@question.new}"
			print "Answer: "
			@current_player.get_answer
			puts " "
	end

	def check_answer
		results = @current_player.check_answer?(@question.answer, @current_player.answer)
	end

	def update_score(results)
		@current_player.adjust(results)
		if results
				puts "#{@current_player.name}'s score: #{@current_player.score}".green
				puts "Remaining lives: #{@current_player.lives}".green
				puts " "
			else
				puts "#{@current_player.name}'s score: #{@current_player.score}".red
				puts "Remaining lives: #{@current_player.lives}".red
				puts " "
			end
	end

	def end_game
		if @player_1.lives!=0
			puts "#{@player_1.name} WINS! Final score: #{@player_1.score}".green
		else
			puts "#{@player_2.name} WINS! Final score: #{@player_2.score}".green
		end
	end

	def game_restart
		print "restart? (yes/no): "
		input = gets.chomp
		if input == 'yes'
			answer=true
		else
			puts "Goodbye"
			answer=false
		end
	end

	def reset
		@player_1.lives = 3
		@player_2.lives = 3
		@player_1.score = 0
		@player_2.score = 0
		@current_player = @player_1
	end

	def switch(player)
		if player == @player_1
			@current_player = @player_2
		else
			@current_player = @player_1
		end
	end

	def start
		loop do
			ask_player
			update_score(check_answer)
			if @current_player.lives == 0
				break
			end
			switch(@current_player)
			ask_player
			update_score(check_answer)
			if @current_player.lives == 0
				break
			end
			switch(@current_player)
		end
	end

end

game = Game.new
game.enter_names
loop do
game.start
game.end_game
continue=game.game_restart
if !continue
	break
end
game.reset
end
