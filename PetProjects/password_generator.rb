=begin
  A password generator that generates a six digit password with two uppercase and two digits
=end
module Sanmi_Utilities
  class PasswordGenerator

    attr_accessor :first_name, :last_name, :software_name
    attr_reader :password, :time_stamp

    public
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

    def generate_password
      digits = '1234567890'.scan(/./)
      @password = ''

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

    def to_s
      " Software name: #{@software_name} Password generated: #{@password}  Time stamp: #{@time_stamp}"
    end

    def run
      puts 'Welcome to Sanmi\'s cryptic password generator'
      puts
      print 'Enter y or press enter to exit the program:'

      while gets.downcase.chop == 'y'

        print 'Enter y to generate new password or press enter to exit the program:'
      end

      puts
      puts 'Thank you for using the program.'
    end
    #TODO implement saving to file.
    #TODO implement saving to database.
    #TODO implement upload to cloud.
  end
end


