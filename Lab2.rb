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
