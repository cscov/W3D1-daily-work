require_relative 'player.rb'
require 'byebug'

class Ghost
  attr_reader :current_player, :previous_player, :dictionary, :fragment
  ALPHABET = ('a'..'z').to_a

  def initialize(player1, player2, file_name = 'dictionary.txt')
    @current_player = player1
    @previous_player = player2
    @dictionary = create_dictionary(file_name)
    @fragment = ""
  end

  def create_dictionary(file_name)
    hash = Hash.new(false)
    File.readlines(file_name).each do |line|
      hash[line.chomp] = true
    end

    hash
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def play_round
    while true
      take_turn(@current_player)
      if !game_over?
        next_player!
      else
        puts "#{@current_player.name} lost!"
        break
      end
    end
  end

  def take_turn(player)
    while true
      string = player.get_string
      if vaild_play?(string)
        fragment << string
        break
      else
        player.alert_invaild_guess
      end
    end
  end

  def vaild_play?(letter)
    return false if !ALPHABET.include?(letter)
    true
  end

  def game_over?
    debugger
    return false unless dictionary[@fragment]
    return false if starts_new_word?(@fragment)
    true
  end

  private

  def starts_new_word?(new_fragment)
    @dictionary.keys.any? do |word|
      new_fragment == word[0...new_fragment.length]
    end
  end
end

if __FILE__ == $PROGRAM_NAME

  game = Ghost.new(Player.new('Walter'), Player.new('Carolyn'))
  game.play_round


  # p game.dictionary.keys.sample(10)
  # p game.current_player
  # p game.previous_player
  # game.next_player!
  # p game.current_player
  # p game.previous_player

end
