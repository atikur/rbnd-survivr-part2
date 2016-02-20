require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require "colorizr"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	8.times do |iteration|
	  winning_tribe = @borneo.immunity_challenge
	  if winning_tribe.name == @hunapu.name
	  	index = rand(@coyopa.members.length)
	  	@coyopa.members.delete_at(index)
	  else
	  	index = rand(@hunapu.members.length)
	  	@hunapu.members.delete_at(index)
	  end
	end
end

def phase_two
	3.times do |iteration|
	  winning_member = @borneo.individual_immunity_challenge
	  not_immune_members = @merge_tribe.members.select { |member| member != winning_member }
	  delete_index = rand(not_immune_members.length)
	  not_immune_members.delete_at(delete_index)
	  @merge_tribe.members = not_immune_members + [winning_member]
	end
end

def phase_three
	7.times do |iteration|
	  winning_member = @borneo.individual_immunity_challenge
	  not_immune_members = @merge_tribe.members.select { |member| member != winning_member }
	  delete_index = rand(not_immune_members.length)
	  @jury.members.push(not_immune_members[delete_index])
	  not_immune_members.delete_at(delete_index)
	  @merge_tribe.members = not_immune_members + [winning_member]
	end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
