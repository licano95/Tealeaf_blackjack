def calculate_total(cards) 
  # [['H', '3'], ['S', 'Q'], ... ]
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end


#Blackjack game

puts "Welcome to BlackJack"

suits = ['C', 'H', 'D', 'S']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


deck = suits.product(cards)
deck.shuffle!

#This section deals card

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

# Show Cards
puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of: #{mytotal}"
puts ""
puts "What would you like to do? 1) hit 2) stay"
hit_or_stay = gets.chomp

while hit_or_stay == '1'
  #hit condition
  mycards << deck.pop
  mytotal = calculate_total(mycards)
  puts "Dealer has: #{dealercards}, for a total of #{dealertotal}"
  puts "You have: #{mycards}, for a total of: #{mytotal}"
  puts ""
  break if mytotal >= 21
  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp
end

while dealertotal < 17
  #dealer hit condition
  dealercards << deck.pop
  dealertotal = calculate_total(dealercards)
  puts "Dealer has: #{dealercards}, for a total of #{dealertotal}"
  puts "You have: #{mycards}, for a total of: #{mytotal}"
  puts ""
end

if mytotal == 21 && dealertotal < 21
  puts "BLACKJACK! You WIN"
elsif mytotal == 21 && dealertotal == 21
  puts "TIE!"
elsif mytotal == dealertotal 
  puts "TIE!"
elsif mytotal > 21 && dealertotal <= 21
  puts "YOU'RE BUSTED"
elsif mytotal < dealertotal && dealertotal != 21 && dealertotal < 21
  puts "YOU LOSE"
elsif mytotal < dealertotal && dealertotal != 21 && dealertotal > 21
  puts "You Win"
elsif mytotal > dealertotal && mytotal != 21 && mytotal < 21
  puts "You WIN"
end 


  

