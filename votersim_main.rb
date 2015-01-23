require "./votersim_classes.rb"
include VoterSimClasses


def greeting
	puts "What would you like to do????"
	puts "Create, List, Update, Vote, or Exit"
	gets.chomp.downcase
end

def voter_type
	puts "Politician or Person?"
	gets.chomp.downcase.capitalize
end


def add_politician(voter_id)
	voter_id = Politician.new
end

def add_person(voter_id)
	voter_id = Person.new
end



total_voters = 0
selection = ""
voters =[]

while selection != "exit" do 
	
	selection = greeting
	# puts selection
	case selection
	when "create"

		case voter_type
		when "Politician"
			total_voters += 1			
			voter_id = "pol" + total_voters.to_s
			voters << add_politician(voter_id)

			puts "voter_id = #{voter_id}"
			puts "Total Voters = #{total_voters}"
			p voters

		when "Person"
			total_voters += 1			
			voter_id = "person" + total_voters.to_s
			voters << add_person(voter_id)

			puts "voter_id = #{voter_id}"
			puts "Total Voters = #{total_voters}"
			p voters

		else
			puts "Improper entry, try again."
		end

	when "list"

	when "update"

	when "vote"

	end





end

