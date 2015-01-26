# Super Class Voter.  
# Class variables:
#
module VoterSimClasses


	class Voter
		attr_accessor :name, :id, :type

		def initialize
			# puts "Name (from Voter Class)?"
			# @name = gets.chomp
		end
	end

	# Class Politician, inherits from Voter

	class Politician < Voter
		attr_accessor :party

		def initialize(voter_id)
			@id = voter_id
			@type = "Politician"
			puts "What is your Name?"
			@name = gets.chomp.downcase.capitalize 
			system "clear"
			puts "Hello #{@name}, what is your Party? (Democrat or Republican)"
			@party=gets.chomp.downcase.capitalize
			system "clear"
			puts "Succesful entry.  Politician #{@name}, Party #{@party}"
			# puts "You entered your Party as  = #{@party}"
			
		end
		
		def inspect
			"Politician\'s Name: #{@name},  Politician\'s' Party: #{@party}"
		end


	end

	# Class Person inherits from Voter
	class Person < Voter
		attr_accessor :politics

		def initialize(voter_id)
			@id = voter_id
			@type = "Person"
			puts "What is your Name?"
			@name = gets.chomp.downcase.capitalize 
			system "clear"
			puts "Hello #{@name}, what is your Politics?"
			puts "(Liberal, Conservative, Tea Party, Socialist, or Neutral)"
			@politics=gets.chomp.downcase.capitalize
			system "clear"
			puts "Succesful entry.  Politician #{@name}, Politcs #{@politics}"
			
		end

		def inspect
			"Person\'s Name: #{@name},  Person\'s Politics: #{@politics}"
		end

	end
end