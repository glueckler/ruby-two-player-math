class Game
  require "./player"
  attr_accessor :player1, :player2, :on

  def initialize()
    @starting_game = true
    @on = true
    @player1 = Player.new('player 1')
    @player2 = Player.new('player 2')
    @current_player = @player1
  end

  def welcome
    if @starting_game
      puts "Welcome to the game"
      @starting_game = false
    end
  end

  def rand_q
    num1 = Random.rand(21)
    num2 = Random.rand(21)
    {
      q: "#{num1} plus #{num2}",
      ans: (num1 + num2).to_s
    }
  end

  def switch_turns
    if @current_player == @player1
      @current_player = @player2
      return nil
    end
    @current_player = @player1
  end

  def check_game_over
    if @current_player.lives == 0
      @on = false
      puts "Game over"
    end
  end

  def next
    welcome
    puts "#{@player1.name} has #{@player1.lives}/3 and #{@player2.name} has #{@player2.lives}/3"
    puts "it's #{@current_player.name}'s turn"

    q_and_a = rand_q
    puts "what tis #{q_and_a[:q]}"
    answer = gets.chomp
    correct = answer == q_and_a[:ans]
    if correct
      puts "Correct, good merrit!"
    else
      puts "Wrong"
      @current_player.take_life
    end
    check_game_over
    switch_turns
  end
end
