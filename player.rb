class Player
	def initialize
		@name = nil
		@score = 0
		@lives = 3
		@answer = nil
	end

	attr_reader :name, :score, :lives
	attr_accessor :answer

	def get_player_name
		@name = gets.chomp
	end

	def get_answer
		@answer=gets.chomp.to_i
  end

  def check_answer?(player_answer, real_answer)
		if real_answer != player_answer
			false
		else
			true
		end
	end

	def adjust(correct)
		if correct
			@score += 10
		else
			@lives -= 1
		end
	end
end
