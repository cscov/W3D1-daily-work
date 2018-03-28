class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_string
    puts "#{@name}, Please enter a letter: "
    gets.chomp.downcase
  end

  def alert_invaild_guess
    puts 'The letter you entered is not valid.'
  end
end
