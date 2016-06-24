require_relative 'Player'
require_relative 'Question'
require 'colorize'

class Game
	def initialize
		@player_1 = Player.new
		@player_2 = Player.new
		@question = Question.new
	end

	def enter_names
		print "Player 1, enter your name: "
		@player_1.get_player_name
		print "Player 2, enter your name: "
		@player_2.get_player_name
		puts " "
	end

	def ask_player(player)
			@question.generate_new
			puts "#{player.name}, #{@question.new}"
			print "Answer: "
			player.get_answer
			puts " "
	end

	def check_answer(player)
		results = player.check_answer?(@question.answer, player.answer)
	end

	def update_score(player, results)
		player.adjust(results)
		if results
				puts "#{player.name}'s score: #{player.score}".green
				puts "Remaining lives: #{player.lives}".green
				puts " "
			else
				puts "#{player.name}'s score: #{player.score}".red
				puts "Remaining lives: #{player.lives}".red
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
	end

	def start
		loop do
			ask_player(@player_1)
			update_score(@player_1, check_answer(@player_1))
			if @player_1.lives == 0
				break
			end
			ask_player(@player_2)
			update_score(@player_2, check_answer(@player_2))
			if @player_2.lives == 0
				break
			end
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
