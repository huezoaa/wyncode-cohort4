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

	class Vote
		attr_accessor :tea, :social, :cons, :lib, :neutral, :rep_votes, :dem_votes, :go_for_election

		
		def initialize
			@tea = ["R","R","R","R","R","R","R","R","R","D"]
			@social = ["D","D","D","D","D","D","D","D","D","R"]
			@cons = ["R","R","R","D"]
			@lib = ["D","D","D","R"]
			@neutral = ["D","R"]
			@rep_votes = 0
			@dem_votes = 0
			@go_for_election = false

			# puts "new vote!"
			# tea.each{ |i| puts i}
			# p tea

		end

		def add_votes(vote)
			
			if vote == "R"
				@rep_votes +=1
			else
				@dem_votes +=1
			end

		end


		def politicians_speak(voters)
			puts "Politician Speeches will take place."

			rep_pol = voters.select{ |x| (x.type=="Politician")&&(x.party == "Republican")}
			dem_pol = voters.select{ |x| (x.type=="Politician")&&(x.party == "Democrat")}

			if rep_pol.empty?
				puts "No Republican politicians in this election!\n"
				if dem_pol.empty? #No politicians have spoken
					puts "No Democrat politicians in this election!\n"
					puts "No politicians available to speak!!!\n"
					go_for_election = false
				else # only democrats have spoken
					puts "Only Democrat politicians in this election!\n"
					go_for_election = true
					dem_pol.each{ |i| 
						puts "Speech>> Hello, my name is #{i.name}, and I always vote Democrat\n"
						@dem_votes += 1
						puts "Democrat votes so far = #{dem_votes}"
					}
				end

			else
				if dem_pol.empty? 
				# only republicans have spoken
					puts "Only Republican politicians in this election!\n"
					go_for_election = true
					rep_pol.each{ |i|
						puts "Speech>> Hello, my name is #{i.name}, and I always vote Republican\n"
						@rep_votes += 1
					}
				else # both parties have spoken
					puts "Both parties have politicians in this election!\n\n\n\n"
					go_for_election=true
					rep_pol.each{ |i|
						puts "Speech>> Hello, my name is #{i.name}, and I always vote Republican\n"
						@rep_votes += 1 
						
						dem_pol.each{|ii| 
							puts "Condemn>>>#{ii.name} condemns #{i.name}\'s speech\n"
						}
					}

					dem_pol.each{ |i|
						puts "Speech>> Hello, my name is #{i.name}, and I always vote Democrat\n"
						@dem_votes += 1

						rep_pol.each{ |ii|
							puts "Condemn>>>#{ii.name} condemns #{i.name}\'s speech\n"
						}
					}
				end
				
			end # end of if --> politician arrays are empty
		
		return go_for_election # method politicians_speak(voters)

		end # end of method politicians_speak(voters)

		def people_vote(voters)

			voters.each{ |i| 
				if i.type == "Person"

					case i.politics 
					when "Tea party"
						vote = tea.sample
						puts "Voter>> My name is #{i.name}, I'm with the Tea Party, and my vote is:"
						puts "#{vote}\n\n"
						add_votes(vote)

					when "Socialist"
						vote = social.sample
						puts "Voter>> My name is #{i.name}, I'm a Socialist, and my vote is:"
						puts "#{vote}\n\n"
						add_votes(vote)

					when "Conservative"
						vote = cons.sample
						puts "Voter>> My name is #{i.name}, I'm a Conservative, and my vote is:"
						puts "#{vote}\n\n"
						add_votes(vote)

					when "Neutral"
						vote = neutral.sample
						puts "Voter>> My name is #{i.name}, I'm undecided, and my vote is:"
						puts "#{vote}\n\n"
						add_votes(vote)

					when "Liberal"
						vote = lib.sample
						puts "Voter>> My name is #{i.name}, I'm a Liberal, and my vote is:"
						puts "#{vote}\n\n"
						add_votes(vote)

					when "Socialist"
						vote = social.sample
						puts "Voter>> My name is #{i.name}, I'm a Socialist, and my vote is:"
						puts "#{vote}\n\n"
						add_votes(vote)						
					end

				end # end of case i.politics

			} # close braces of voter.each


		end # end of method "people_vote(voters)"



	end

end















