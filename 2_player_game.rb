require 'pry'

# Player 1 input name and initialization
@player1 = {
  name: '',
  life: 3,
  answer: 0,
  points: 0
}

@player2 = {
  name: '',
  life: 3,
  answer: 0,
  points: 0
}

# Instance Variables
@answer = 0
@correct_answer = 0
@num1 = rand(20)
@num2 = rand(20)
@current_player = @player1

# Asking for player name
def asking_name
  puts "What's your name Player 1?"
  @player1[:name] = gets.chomp
  puts "What's your name Player 2?"
  @player2[:name] = gets.chomp
end

# Prompt for Answer
def prompt_player_for_answer
  @num1 = rand(20)
  @num2 = rand(20)
  @correct_answer = @num1 + @num2
  p "#{@current_player[:name]}, What is the sum of #{@num1} and #{@num2}?" 
  @answer = gets.chomp.to_i
end

# Verifying Answer
def verify_answer
# binding.pry
  if @correct_answer == @answer
    @current_player[:points] += 1
    p "Your score is now #{@current_player[:points]}"  
  else 
    @current_player[:life] -= 1
    p "Your life is now #{@current_player[:life]}"
  end
end

def change_turn
  if @current_player == @player1
    @current_player = @player2
  else
    @current_player = @player1
  end
end


# prompt_player_for_answer
def main
  asking_name
  until (@player1[:life]==0 || @player2[:life]==0) do
  prompt_player_for_answer
  verify_answer
  change_turn
end
end

main
