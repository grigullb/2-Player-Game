class Question
	def initiate
		@num1 = nil
		@num2 = nil
		@answer = nil
		@new = nil
	end

	attr_reader :answer
	attr_accessor :new

  def generate_new
		@num1 = random_number
		@num2 = random_number
		@answer = @num1 + @num2
		@new = "What does #{@num1} + #{@num2} equal?"
	end


	private

	def random_number
		number = rand(21)
  end 
end
