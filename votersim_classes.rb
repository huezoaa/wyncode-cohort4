# Super Class Voter.  
# Class variables:
#
module VoterSimClasses


	class Voter
		attr_accessor :name

		def initialize
			puts "Name?"
			@name = gets
		end
	end

	# Class Politician, inherits from Voter

	class Politician < Voter
		attr_accessor :party

		def initialize
			puts "Name?"
			@name = gets
			puts "Party? (Democrat or Republican)"
			@party=gets.chomp.downcase.capitalize
			puts "Party = #{@party}"
		end

	end

	# Class Person inherits from Voter
	class Person < Voter
		attr_accessor :politics

		def initialize
			puts "Name?"
			@name = gets
			puts "Politics? (Liberal, Conservative, Tea Party, Socialist, or Neutral)"
			@politics=gets.chomp.downcase.capitalize
			puts "Politics = #{@politics}"
		end
	end
end