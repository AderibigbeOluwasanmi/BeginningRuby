=begin
  A password generator that generates a password six digit password with two uppercases and two digits
=end
module Sanmi_Utilities
  class PasswordGenerator
    attr_accessor :first_name, :last_name
    attr_reader :password


    def collect_user_data
      print 'Enter your first name: '
      @first_name = gets.chop.scan(/./)
      print 'Enter your second name: '
      @last_name = gets.chop.scan(/./)

    end


    private
  end
end

