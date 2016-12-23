=begin
  A password generator that generates a six digit password with two uppercase and two digits
=end
module Sanmi_Utilities
  class PasswordGenerator

    attr_accessor :first_name, :last_name, :software_name
    attr_reader :password, :time_stamp

    def initialize
      @password = ''
    end

    private
    def collect_user_data
      #TODO implement error handling.
      puts
      print 'Enter your first name: '
      @first_name = gets.downcase.chop.scan(/./)
      puts
      print 'Enter your second name: '
      @last_name = gets.downcase.chop.scan(/./)
      puts
      print 'Enter the name of software name:'
      @software_name = gets
    end

    private
    def generate_password
      digits = '1234567890'.scan(/./)

      2.times do
        @password += @first_name[rand(@first_name.length)]
        @password += @last_name[rand(@last_name.length)]
        @password += digits[rand(10)]
      end

      @time_stamp = Time.now.ctime

      @password[0] = @password[0].upcase
      @password[3] = @password[3].upcase

      @password
    end

    public
    def to_s
      " Software name: #{@software_name}" + " Password generated: #{@password}" + "  Time stamp: #{@time_stamp}"
    end

    public
    def run
      puts 'Welcome to Sanmi\'s cryptic password generator'
      puts
      print 'Enter y to start program or o to open save file '
      print 'press enter to exit the program:'
      start_decision =gets.downcase.chop

      case start_decision
        when 'y'
          while start_decision == 'y'

            #Create a new password from user data
            if @password.empty?
              process
            else
              puts
              print 'Type old to generate a new password using previously inputted data or new to generate from new data:'
              user_decision = gets.chop
              if user_decision == 'old'
                @password = ''
                generate_password
                print_password
              elsif user_decision =='new'
                @password = ''
                process
              end
            end

            print 'Enter y to generate new password or press enter to stop generating password:'
            start_decision = gets.chop
          end

          puts
          print 'Enter y if you  want to save password to file before exiting the program.'
          #Saving actions
          case gets.chop
            when 'y'
              save_to_file
          end
          say_goodbye

        when 'o'
          open_save_file
      end


    end

    #TODO implement saving to database.
    #TODO implement upload to cloud.

    private
    def save_to_file
      File.open('/home/sanmi/Documents/Password_Generator_save/password_save_file.txt', 'a') do |f|
        f.puts
        f.puts self.to_s
      end
    end

    def open_save_file
      File.open('/home/sanmi/Documents/Password_Generator_save/password_save_file.txt').each { |line| puts line }
    end

    private
    def process
      collect_user_data
      generate_password
      print_password
    end

    private
    def say_goodbye
      puts
      puts 'Thank you for using the program.'
    end

    private
    def print_password
      puts
      puts to_s
      puts
    end
  end

  pass_gen = PasswordGenerator.new
  pass_gen.run
end



