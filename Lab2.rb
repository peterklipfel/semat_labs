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

