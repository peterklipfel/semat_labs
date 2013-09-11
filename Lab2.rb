class HelloWorldClass
    def initialize(name)
       @name = name.capitalize
    end
    def sayHi
        puts "Hello #{@name}!"
    end
end
hello = HelloWorldClass.new("Peter")
hello.sayHi



def palindrome?(word)
  word.gsub(/[^a-zA-Z]/, '').downcase.to_s == word.gsub(/[^a-zA-Z]/, '').downcase.to_s.reverse
end

raise "Failed!" unless palindrome?("A man, a plan, a canal -- Panama")
raise "Failed!" unless palindrome?("Madam, I'm Adam!")
raise "Failed!" unless not palindrome?("Abracadabra")

def count_words(words)
  occurrences = {}
  stripped = words.gsub(/[^a-zA-Z\s]/, '')
  split_words = stripped.split(/\s/).map{ |w| w.downcase}
  split_words.each { |w| occurrences[w].nil? ? occurrences[w]=1 : occurrences[w]+= 1}
  occurrences.delete('')
  occurrences
end

raise "Failed" unless (count_words("A man, a plan, a canal -- Panama") == {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1})
raise "Failed" unless (count_words("Doo bee doo bee doo") == {'doo' => 3, 'bee' => 2})


class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game) # game = [["p1", "r"], ["p2", "p"]]
  raise WrongNumberOfPlayersError unless game.length == 2
  moves = [game[0][1].downcase, game[1][1].downcase]
  moves.each {|m| raise NoSuchStrategyError unless ['r', 'p', 's'].include? m }
  return game[0] if [['s', 'p'], ['p', 'r'], ['r', 's'], ['r', 'r'], ['p', 'p'], ['s', 's']].include? moves
  return game[1] if [['p', 's'], ['r', 'p'], ['s', 'r']].include? moves
end

raise "Failed" unless rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ]) == ["Dave", "S"]

def get_set_winner set
  first_winner = rps_game_winner set[0]
  second_winner = rps_game_winner set[1]
  set_winner = rps_game_winner [[first_winner, moves[first_winner]], [second_winner, moves[second_winner]] ]
end

def rps_tournament_winner tournie
  # inspiration from http://stackoverflow.com/questions/14388700/ruby-rock-paper-scissors-tournament
  return rps_game_winner(tournie) if tournie[0][0].kind_of? String
  return rps_game_winner([rps_tournament_winner(tournie[0]),rps_tournament_winner(tournie[1])])
end

raise "Failed" unless rps_tournament_winner(
  [
      [
          [ ["Armando", "P"], ["Dave", "S"] ],
          [ ["Richard", "R"],  ["Michael", "S"] ],
      ],
      [
          [ ["Allen", "S"], ["Omer", "P"] ],
          [ ["David E.", "R"], ["Richard X.", "P"] ]
      ]
  ]
) == ["Richard", "R"]

def combine_anagrams(words)
  anagram = {}
  words.each do |word|
    anagram[count_letters word] ||= []
    anagram[count_letters word] << word
  end
  anagram.values
end

def count_letters(word)
  occurrences = {}
  word.scan(/[a-zA-Z]/).each{|l| occurrences[l].nil? ? occurrences[l] = 1 : occurrences[l] += 1}
  occurrences
end

# Doesn't work because array ordering 
raise "Failed" unless 
  (combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']) -
    [ ["cars", "racs", "scar"],
      ["four"],
      ["for"],
      ["potatoes"],
      ["creams", "scream"] ]
  ) == []
