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
      print 'Enter your first name: '
      @first_name = gets.downcase.chop.scan(/./)

      print 'Enter your second name: '
      @last_name = gets.downcase.chop.scan(/./)

      print 'Enter the name of software which password is to be generated for:'
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

    #TODO implement saving to file.
    #TODO implement saving to database.
  end
end


