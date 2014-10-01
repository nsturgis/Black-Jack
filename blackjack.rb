class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def join
    card = [rank, suit]
    card.join('')
  end

  def to_i
    rank.to_i
  end

end

class Deck
  def initialize
    @deck = []
    Suits.each do |suit|
      Ranks.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def draw
    card = @deck.pop
    card
  end

  def size
    @deck.size
  end
end

class Hand
  def initialize(user_arr)
    @user_arr = user_arr
  end

  def count_cards
    count = 0
    ranks = []

    @user_arr.each do |card|
      ranks << card.rank
    end
    ranks.each do |rank|
      if ["K", "Q", "J"].include?(rank)
        count += 10
      elsif rank.include?("A")
        count += 11
      else
        count += rank.to_i
      end
    end
    if count > 21 && ranks.include?("A")
      count -= 10
    end
    count
  end
end

