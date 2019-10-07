class Jukebox
  attr_accessor :input
  def initialize(songs)
    @songs = songs
  end

  def call
    puts "Welcome to the Jukebox! Type 'help' to see the list of available commands"
    while @input != "exit" do
      do_command
    end
  end

  def help
    puts "Available commands: help, list, play, exit"
  end

  def list
    @songs.each_with_index do |song, index|
      puts (index + 1).to_s + ". " + song
    end
  end

  def play
    puts "Enter a song number or enter the artist and song title, as shown in the list above"
    resp = gets.chomp
    if @songs.include?(resp)
      puts "Now playing " + resp
    elsif resp.to_i <= @songs.count
      puts "Now playing: " + @songs[resp.to_i - 1]
    else
      puts "sorry, please enter a valid song or type 'help' for more options."
    end
  end

  def exit
    puts "Goodbye!"
  end

  def get_input
    puts "Enter a command:"
    @input = gets.chomp
  end

  def do_command
    get_input
    case @input
    when "help"
      help
    when "list"
      list
    when "play"
      play
    when "exit"
      exit
    end
  end
end
