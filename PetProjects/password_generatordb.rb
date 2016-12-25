require 'sequel'
require 'pg'


class PasswordGeneratordb

  attr_reader :db

  def initialize(database_name)
    begin
      @db = Sequel.connect('postgres://sanmi:Ng3Ab3@localhost/'+"#{database_name}")
      @passwords =@db[:password_generated]

      raise DatabaseConnectionError if @db.nil?
    end
  end

  def create_new_table
    @db.create_table? :password_generated do
      primary_key :id
      String :software_name
      String :password
      String :time_stamp
    end
  end

  def print_all_passwords
    @passwords.all.each { |row| puts "#{row[:id]} => #{row[:software_name]} ,#{row[:password]} ,#{row[:time_stamp]}" }
  end

  def insert(password)
    @passwords.insert(:software_name => "#{password.software_name}", :password => "#{password.password}", :time_stamp => "#{password.time_stamp}")
  end

  #Find password by software name
  # Throws data not found error
  def find_password_by_software_name(name)
    @db.fetch('SELECT password FROM password_generated WHERE software_name = ?', name) do |row|
      puts "#{name} password => #{row[:password]}"
    end
  end

  def delete_password(name)
    @db[:password_generated].filter(:software_name => name).delete
  end
end



