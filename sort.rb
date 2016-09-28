require 'csv'

# output schema: first name | middle names | last name | email
open('./output.csv', 'w') { |file|
  file << "first name," << "middle names," << "last name," << "email"
}

# input schema: email | name
CSV.foreach('./input.csv') do |row|
  puts row.inspect
  name_array = row[1].split(" ")

  first_name = name_array.first
  name_array.delete(first_name)

  last_name = name_array.last
  name_array.delete(last_name)

  middle_names = name_array.join(" ")

  open('./new_list.csv', 'a') { |file|
    file << "#{first_name}," << "#{middle_names}," << "#{last_name}," << "#{row[0]}\n"
  }
end