def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [2,4,6]  #Right start diagonal
]

board = ["X", "X", "X", "O", " ", "O", "O", " ", " "]
camel = [8, " ", " ", " ", 8, " ", " ", " ", 8]

#board.select {|i| board[i] == "X"}

#board_indices = board.length.times.select {|i| board[i] == "X" || board[i] == "O"}
#board_indices
#board_guy = board.each_index.select {|i| board[i] == "X" || board[i] == "O"}
#board_guy
=begin
position_1 = board[0..2]
if position_taken?(board, 0..2)
  puts "Hello World"
end
=end

def won?(board)
winner = []
empty_board = board.all? {|x| x == " "}
WIN_COMBINATIONS.each do |sub_array|
    if empty_board || full?(board)
      return false
    elsif sub_array.all? { |value| board[value] =="X" } || sub_array.all? { |value| board[value] =="O" }
      winner = sub_array
    end
  end
  winner
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board) || !won?(board)
    return false
  end
end

draw?(board)
