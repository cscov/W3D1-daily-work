class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    if !game_over
      require_sequence
      show_sequence
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "What's the sequence?"
    begin
      sequence = gets.chomp.split
    rescue
      puts "That sequence is the wrong length."
      retry
    end

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Congrats! You won this round! The sequence was: #{seq}"
  end

  def game_over_message
    puts "Wrong! The sequence was #{seq}. Game over."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
