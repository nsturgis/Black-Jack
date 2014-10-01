require_relative 'blackjack'

require "pry"


Ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
Suits = %w{♠ ♥ ♣ ♦}

deck = Deck.new

dealer_hand = []
dealer = Hand.new(dealer_hand)
player_hand = []
player = Hand.new(player_hand)

puts "Welcome to blackjack!"


while true
  2.times do
    player_hand << deck.draw
  end

  player_hand.each do |card|
    puts "Player was dealt: #{card.join}"
  end

  puts "Player's score: #{player.count_cards}"

  puts "Hit or Stand (h/s):"
  answer = gets.chomp.downcase

    while answer != "s"
      player_hand << deck.draw

      puts "Player was dealt: #{player_hand[-1].join}"

      puts "Player's score: #{player.count_cards}"

      if player.count_cards > 21
        puts "Bust!"
        exit
      end

      puts "Hit or Stand (h/s):"
      answer = gets.chomp.downcase

    end
      2.times do
        dealer_hand << deck.draw
      end


      dealer_hand.each do |card|
        puts "dealer was dealt: #{card.join}"
      end

      puts "dealer's score: #{dealer.count_cards}"

      while dealer.count_cards < 17
        puts "Dealer hits!"
        dealer_hand << deck.draw

        puts "dealer was dealt: #{dealer_hand[-1].join}"
      end
      if dealer.count_cards >= 17 && dealer.count_cards <= 21
        puts "Dealer Stands!"
        break
      else
        puts "Dealer Busts!"
        break
      end
end

if dealer.count_cards > player.count_cards && dealer.count_cards < 22
  puts "YOU SUCK!"
elsif dealer.count_cards < player.count_cards || dealer.count_cards > 21
  puts "YOU WIN!"
else
  puts "PUSH!"
end
