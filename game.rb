module MathGame
  class Game
    attr_accessor :current_player

    #Keep It Sequential:

    #Game Setup:
    def initialize
      @p1 = Player.new('Player 1')
      @p2 = Player.new('Player 2')
      @responses = ['Wrong!', 'Not Today!', 'Back To School!']
      @current_player = @p1
    end

    #Question Setup:
    def next_question
      problem = Question.new
      @question = problem.new_question
      @answer = problem.answer
    end

    #Game Begins
    def start
      puts 'Game is starting.'
      new_turn
    end

    #Ask Question:
    def new_turn
      next_question
      puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
      puts '----- NEW TURN -----'
      puts "#{@current_player.name}: #{@question}"
      print '> '
      @response = gets.chomp.to_i
      @response == @answer ? switch_players : lose_life
    end

    #Next Turn:
    def switch_players
      @current_player == @p1 ? @current_player = @p2 : @current_player = @p1
      new_turn
    end

    #Consequences of Wrong Answer:
    def lose_life
      puts "#{@current_player.name}: #{@responses.sample}"
      @current_player.lives -= 1
      if @current_player.lives.zero?
        @current_player == @p1 ? game_over(@p2, @p2.lives) : game_over(@p1, @p1.lives)
      else
        switch_players
      end
    end

    #Game Conclusion:
    def game_over(winner, lives_remaining)
      puts "#{winner.name} wins with #{lives_remaining}/3 lives left"
      puts '----- GAME OVER -----'
      puts 'Thanks For Playing!'
    end

  end
end
