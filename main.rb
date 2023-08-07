option = {

}

def main
  puts "Welcom to Catalog of my things applpication\n\n"
  loop do
    puts "Select an option to continue"
    user_option = gets.chomp.to_s
    case user_option
    when '10'
      puts "Bye bye, see you again!"
      exit
    else
      puts "Invalid option, please select again a number between 1 and 10"
    end
  end
end

main
