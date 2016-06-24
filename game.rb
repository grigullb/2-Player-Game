require_relative 'Player'
require_relative 'Question'
require 'colorize'

class Game
	def start
		player_1 = Player.new
		player_2 = Player.new
		question = Question.new
		print "Player 1, enter your name: "
		player_1.get_player_name
		print "Player 2, enter your name: "
		player_2.get_player_name
		puts " "
		alive = true
		loop do
			question.generate_new
			puts "#{player_1.name}, #{question.new}"
			print "Answer: "
			player_1.get_answer
			puts " "
			results = player_1.check_answer?(question.answer, player_1.answer)
			player_1.adjust(results)
			if results
				puts "#{player_1.name}'s score: #{player_1.score}".green
				puts "Remaining lives: #{player_1.lives}".green
				puts " "
			else
				puts "#{player_1.name}'s score: #{player_1.score}".red
				puts "Remaining lives: #{player_1.lives}".red
				puts " "
			end
			if player_1.lives == 0
				break
			end
			question.generate_new
			puts "#{player_2.name}, #{question.new}"
			print "Answer: "
			player_2.get_answer
			puts " "
			results = player_2.check_answer?(question.answer, player_2.answer)
			player_2.adjust(results)
			if results
				puts "#{player_2.name}'s score: #{player_2.score}".green
				puts "Remaining lives: #{player_2.lives}".green
				puts " "
			else
				puts "#{player_2.name}'s score: #{player_2.score}".red
				puts "Remaining lives: #{player_2.lives}".red
				puts " "
			end
			if player_2.lives == 0
				break
			end
		end
		if player_1.lives!=0
			puts "#{player_1.name} WINS! Final score: #{player_1.score}".green
		else
			puts "#{player_2.name} WINS! Final score: #{player_2.score}".green
		end
		puts "Goodbye"
	end
end

game = Game.new
game.start
