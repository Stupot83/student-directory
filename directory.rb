def input_students
  print "Instructions:\n\nPlease enter the student names.\n\nThen to finish, just hit return twice!\n\n"

  @students = []

  months = [
    :January,
    :February,
    :March,
    :April,
    :May,
    :June,
    :July,
    :August,
    :September,
    :October,
    :November,
    :December,
  ]

  print "Enter the first name:\n"
  first_name = gets.delete "\r\n"

  while !first_name.empty?
    print "Enter #{first_name}'s last name:\n"
    last_name = gets.delete "\r\n"
    until !last_name.empty?
      print "You need to enter #{first_name}'s last name!\n"
      last_name = gets.delete "\r\n"
    end
    print "Enter #{first_name}'s date of birth:\n"
    date_of_birth = gets.delete "\r\n"
    until !date_of_birth.empty?
      print "You need to enter #{first_name}'s date of birth!\n"
      date_of_birth = gets.delete "\r\n"
    end
    print "Enter #{first_name}'s country of birth:\n"
    country_of_birth = gets.delete "\r\n"
    until !country_of_birth.empty?
      print "You need to enter #{first_name}'s country of birth!\n"
      country_of_birth = gets.delete "\r\n"
    end
    print "Enter #{first_name}'s height:\n"
    height = gets.delete "\r\n"
    until !height.empty?
      print "You need to enter #{first_name}'s height!\n"
      height = gets.delete "\r\n"
    end
    print "Enter #{first_name}'s cohort\n"
    cohort = gets.chomp.capitalize.to_sym
    if cohort.empty?
      cohort = :November
    end
    while !months.include?(cohort)
      print "Invalid entry. Enter #{first_name}'s cohort or hit enter to use default)\n"
      cohort = gets.chomp.capitalize.to_sym
      if cohort.empty?
        cohort = :November
      end
    end
    print "Enter #{first_name}'s hobbies:\n"
    hobbylist = gets.delete "\r\n"
    hobbies = []
    hobbies << hobbylist.split { " " }
    until !hobbies.empty?
      print "You need to enter #{first_name}'s hobbies!\n"
      hobbylist = gets.delete "\r\n"
    end

    @students << {
      first_name: first_name,
      last_name: last_name,
      date_of_birth: date_of_birth,
      country_of_birth: country_of_birth,
      height: height,
      cohort: cohort,
      hobbies: hobbies,
    }

    if @students.length > 1
      print "Now we have #{@students.length} students\n"
    else print "Now we have #{@students.length} student\n"     end

    print "Next student! Enter the first name:\n"
    first_name = gets.delete "\r\n"
  end

  @students
end

def display_header
  print "The Students of AllSpark Academy\n-------------\n"
end

def display(students)
  students.each_with_index do |student, index|
    print "#{index + 1}. #{student[:first_name]} #{student[:last_name]} #{student[:country_of_birth]} #{student[:height]} (#{student[:cohort]} cohort) #{student[:hobbies]}\n"
  end
end

# Code below was to display students by cohort

# def display_cohort_list(students)
#   if !students.is_a? Array
#     return empty_list_error
#   else
#     groups = {}
#     students.each do |student|
#       cohort = student[:cohort]
#       if groups[cohort] == nil
#         groups[cohort] = []
#       end
#       groups[cohort].push(student[:first_name])
#     end
#     groups.each do |key, value|
#       puts "#{key}:"
#       value.each do |first_name|
#         puts first_name
#       end
#       puts "-----"
#     end
#   end
# end

def display_footer(students)
  if @students.length > 1
    print "In total we have #{@students.length} students\n"
  else print "In total we have #{@students.length} student\n"   end
end

students = input_students

display_header
display(students)
display_footer(students)
