require "./votersim_classes.rb"
include VoterSimClasses


def greet_and_choose
	puts "\n\n\n\n\n\n\n\n\n\n"
	puts "What would you like to do????"
	puts "Create, List, Update, Vote, or Exit"
	gets.chomp.downcase	
end

def get_voter_type
	puts "Politician or Person?"
	gets.chomp.downcase.capitalize
end


def add_politician(voter_id)
	voter_id = Politician.new(voter_id)
end

def add_person(voter_id)
	voter_id = Person.new(voter_id)
end

def list_of_voters(voters)
	puts "************  L I S T   O F   V O T E R S **************\n\n"
			puts "** VOTER_ID *** TYPE  *****   NAME ****** PREFERENCE ****\n\n"
			voters.each {|i| 
			if i.type == "Person" # if i,class == Politician
				puts "**   #{i.id}     |    Person  |     #{i.name} |     #{i.politics}  \n\n"
			else
				puts "**   #{i.id}     | Politician |     #{i.name} |     #{i.party}    \n\n"
			end

			}
			# puts "Total Voters: #{total_voters}"
			puts "*********************************************************\n\n"	
end

def get_name_to_update
	puts "Please enter the person's name to UPDATE:"
	gets.chomp.downcase.capitalize

end

public

def update_politics(i)
	puts "Found the following Person with that name:\n\n\n"
	puts "Voter_ID: #{i.id}, Person\'s Name: #{i.name}, Person\'s Politics: #{i.politics}"
	puts "-------------------------------------------------------------------------------\n\n"
	puts "New Politics: "
	i.politics = gets.chomp.downcase.capitalize
	puts "Successful update"
	puts "Voter_ID: #{i.id}, Person\'s Name: #{i.name}, Person\'s Politics: #{i.politics}"

end

def update_party(i)
	puts "Found the following Politician with that name:\n\n\n"
	puts "Voter_ID: #{i.id}, Politician\'s Name: #{i.name}, Politician\'s Party: #{i.party}"
	puts "-------------------------------------------------------------------------------"
	puts "New Party: "
	i.party = gets.chomp.downcase.capitalize
	puts "Successful update"
	puts "Voter_ID: #{i.id}, Politician\'s Name: #{i.name}, Politician\'s Politics: #{i.party}"

end





voter_id = 0
selection = ""
voters =[]


# voters.size

while selection != "exit" do 
	
	selection = greet_and_choose
	puts "\n\n\n\n"
	# puts selection
	case selection
	when "create"

		case get_voter_type
			
		when "Politician"
		
			voter_id += 1
			system "clear"
			voters << add_politician(voter_id)

			# puts "voter_id = #{voter_id}"
			# puts "Total Voters = #{total_voters}"
			# p voters
			

		when "Person"
						
			voter_id += 1
			system "clear"
			voters << add_person(voter_id)

			# puts "voter_id = #{voter_id}"
			# puts "Total Voters = #{total_voters}"
			# p voters

		else
			puts "Improper entry, try again."
		end

	when "list"
			system "clear"
			list_of_voters(voters)


	when "update"
			system "clear"
			entry = get_name_to_update
			
			system "clear"
			foundit = voters.select {|i| i.name==entry}


			unless foundit.empty?
				foundit.each{ |i| 
					
					if i.type == "Person"

						i.update_politics(i)
						
					else

						i.update_party(i) 


					end
				}
			else

			puts "No such name found:  #{entry}"
			puts "Try again!"
			end


	when "vote"

		election = Vote.new
		go_ahead_and_vote = election.politicians_speak(voters)

		if go_ahead_and_vote == true
			puts "We have the go ahead to vote!\n\n\n\n"
			election.people_vote(voters)
		else
			puts "We can't vote yet!"
			puts "No politicians have spoken!!\n\n\n"

		end

		
		puts "Republican Votes = #{election.rep_votes}"
		puts "Democrat Votes = #{election.dem_votes}\n\n\n\n"

		if election.rep_votes > election.dem_votes
			puts "Winners:  the R E P U B L I C A N S !!!!!"
		elsif election.rep_votes < election.dem_votes
			puts "Winners:  the D E M O C R A T S !!!"
		else 
			puts "It's a draw!!  Re-vote..."
		end

			



	end


end
system "clear"


















