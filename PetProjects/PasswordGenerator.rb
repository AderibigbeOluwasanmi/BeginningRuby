require_relative 'password_generator'

pass_gen = Sanmi_Utilities::PasswordGenerator.new

pass_gen.collect_user_data
p pass_gen.generate_password
puts pass_gen