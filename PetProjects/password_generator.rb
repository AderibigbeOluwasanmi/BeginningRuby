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
      " Software name: #{@software_name} Password generated: #{@password}  Time stamp: #{@time_stamp}"
    end

    public
    def run
      puts 'Welcome to Sanmi\'s cryptic password generator'
      puts
      print 'Enter y or press enter to exit the program:'

      while gets.downcase.chop == 'y'

        #Create a new password from user data
        if @password.empty?
          process
          print_password
        else
          puts
          print 'Type old to generate a new password using previously inputted data or new to generate from new data:'
          if gets.chop == 'old'
            @password = ''
            generate_password
            print_password
          else
            @password = ''
            process
            print_password
          end
        end

        print 'Enter y to generate new password or press enter to exit the program:'
      end

      #TODO implement saving to file.
      #TODO implement saving to database.
      #TODO implement upload to cloud.

      say_goodbye
    end

    private
    def process
      collect_user_data
      generate_password
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



