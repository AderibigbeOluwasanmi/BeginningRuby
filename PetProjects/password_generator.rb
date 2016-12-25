require 'yaml'
require_relative 'password_generatordb'
=begin
  A password generator that generates a six digit password with two uppercase and two digits
=end
module Sanmi_Utilities_Password_Generator
  public
  class PasswordGenerator

    attr_accessor :first_name, :last_name, :software_name
    attr_reader :password, :time_stamp

    def initialize
      @password = ''
      @pass_gen_db = PasswordGeneratordb.new('sanmi')
    end

    private
    def collect_user_data
      #TODO implement error handling.
      begin
        puts
        print 'Enter your first name: '
        @first_name = gets.downcase.chop.scan(/./)
        raise 'Enter valid first name' if @first_name.empty?

        puts
        print 'Enter your last name: '
        @last_name = gets.downcase.chop.scan(/./)
        puts
        raise 'Enter valid last name' if @last_name.empty?

        print 'Enter the name of software name:'
        @software_name = gets.chop
        raise 'Enter valid software name' if @software_name.empty?
      end

    end

    private
    def generate_password

      begin
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

        raise 'Error generating password, please enter valid data' if @password.empty?
      end

    end

    public
    def to_s
      "Software name: #{@software_name}\n" + "Password generated: #{@password}\n" + "Time stamp: #{@time_stamp}\n"
    end

    public
    def run
      puts 'Welcome to Sanmi\'s cryptic password generator'
      puts
      puts 'Enter y to start program or o to open save file '
      puts 'Enter s to search for password or p to print all password'
      puts 'press enter to exit the program:'
      print 'Enter command:'
      start_decision =gets.downcase.chop


      case start_decision
        when 'y'
          while start_decision == 'y'
            #Create a new password from user data
            begin
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

            rescue => e
              puts e
            end
            puts
            print 'Enter y to generate new password or press enter to stop generating password:'
            start_decision = gets.downcase.chop
            puts
          end
          print 'Enter y if you  want to save password  before exiting the program.'
          #Saving actions
          case gets.downcase.chop
            when 'y'
              save_to_file
              save_to_db
          end
          say_goodbye
        when 'o'
          open_save_file
        when 's'
          print 'To search for password, please enter software name:'
          query = gets.chop
          @pass_gen_db.find_password_by_software_name(query)
      end
    end
    #TODO implement saving to database.

    private
    def save_to_file
      begin
        File.open('/home/sanmi/Documents/Password_Generator_save/password_save_file.txt', 'a') do |f|
          f.puts
          f.puts self
        end
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
    def print_password
      puts
      puts to_s
      puts
    end

    private
    def say_goodbye
      puts
      puts 'Thank you for using the program.'
    end

    #creates new db connection
    #creates table if none
    #write password to database.
    private
    def save_to_db

      @pass_gen_db.create_new_table
      @pass_gen_db.insert(self)
    end

  end
end


password_generator = Sanmi_Utilities_Password_Generator::PasswordGenerator.new()
password_generator.run





