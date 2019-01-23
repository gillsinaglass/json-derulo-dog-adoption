class Cli

  attr_accessor :user, :name, :answer, :prompt

  def initialize
    puts "Welcome to JSON Derulo's Dog Adoption Agency! \n"
    @user = nil
    @name = nil
    @answer = nil
    @prompt = TTY::Prompt.new
  end


  def ask_name
    puts "\nWhat is your name?"
    self.name = gets.chomp
  end

  def login
    self.user = Buyer.find_or_create_by(name: self.name)
    self.user.save
    puts "\nHi, #{self.user.name}!"
  end

  def goodbye
    puts "\nThank you for choosing JSON Derulo's Dog Adoption Agency!"
  end

  def act
      if self.answer == 1
        self.user.adopt_dog
        self.prompt_menu
      elsif self.answer == 2
        self.user.show_adoptions
        self.goodbye
      end
  end

  def prompt_menu
    puts "\n"
    choices = {'Adopt a new dog' => 1, 'Exit' => 2}
    self.answer = self.prompt.select("What would you like to do?", choices)
    self.act
  end

end
