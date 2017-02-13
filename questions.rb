module MathGame
  class Question
    attr_reader :num1, :num2

    def initialize
      @num1 = random_number
      @num2 = random_number
    end

    def answer
      @num1 + @num2
    end

    def random_number
      1 + rand(20)
    end

    def new_question
      "What is the sum of #{@num1} + #{@num2}?"
    end

  end
end
