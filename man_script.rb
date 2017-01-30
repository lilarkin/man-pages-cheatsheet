require 'pry'

@cmd_arr = ['pwd', 'ls', 'rm']

def main_menu
    puts '1: Command Line'
    puts '2: Search'
    puts '3: Exit'
    puts '*****Make a Selection*****'
    main_menu_input
end

def main_menu_input
  user_input = gets.chomp
  case user_input
    when '1'
      cmd_line
    when '2'
      search 
    else '3'
      exit_program
  end
end

def cmd_line
    @cmd_arr.each_with_index do |c, index|
        puts "#{index + 1}: #{c}"
    end
    num = @cmd_arr.length + 1 
    puts "#{num}: New Command"
    num = num + 1
    puts "#{num}: Main Menu"
    cmd_line_input
end

def cmd_line_input
    length = @cmd_arr.length + 1
    input = gets.chomp.to_i
    if cmd = @cmd_arr[input - 1] 
        puts `man #{cmd}`
        cmd_line
    elsif input == length
        new_command 
    elsif input == length + 1
        main_menu
    end 
    # case input
    #     when '1'
    #        puts `man pwd`
    #        main_menu
    #     when '2'
    #        puts `man ls`
    #        main_menu
    #     when '3'
    #        puts `man rm`
    #        main_menu
    #     when '4'
    #         main_menu
    #     else
    #         puts 'Invalid Input'
    #         cmd_line
    # end 
end

def new_command
    puts 'Enter Command:'
    input = gets.chomp
    manual = `man #{input}`
    if manual == ""
        puts 'Invalid entry'
        new_command
    else
        if @cmd_arr.include? (input)
            puts 'Already exists'
            cmd_line
        else
            @cmd_arr << input
            cmd_line
        end
    end
end

def search
    puts 'Enter a command:'
    cmd = gets.chomp
    puts `man #{cmd}`
    main_menu
end

def exit_program
    puts "Goodbye"
    exit(0)
end

main_menu