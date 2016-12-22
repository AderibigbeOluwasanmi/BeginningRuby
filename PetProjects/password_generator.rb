=begin
  A password generator that generates a password six digit password with two uppercases and two digits
=end
module Sanmi_Utilities
  class PasswordGenerator
    attr_accessor :first_name, :last_name
    attr_reader :password, :time_stamp

    public
    def collect_user_data
      print 'Enter your first name: '
      @first_name = gets.downcase.chop.scan(/./)

      print 'Enter your second name: '
      @last_name = gets.downcase.chop.scan(/./)

    end


    def generate_password
      digits = '1234567890'.scan(/./)
      @password = ''

      2.times do
        @password += @first_name[rand(@first_name.length - 1)]
        @password += @last_name[rand(@last_name.length - 1)]
        @password += digits[rand(9)]
      end

      @time_stamp = Time.now.ctime
      @password
    end

  end
end


