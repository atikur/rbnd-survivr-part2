class Jury
  attr_accessor :members

  def initialize
  	@members = []
  	@votes = {}
  end

  def add_member(name)
  	@members.push(name)
  end

  def cast_votes(finalists)
  	votes = {finalists[0] => 0, finalists[1] => 0}

  	@members.count.times.each do |i|
  	  if rand(0...2) == 0
  	  	votes[finalists[0]] += 1
  	  else
  	  	votes[finalists[1]] += 1
  	  end
  	  puts "Voting: " + "#{@members[i]}".yellow
  	end

  	votes
  end

  def report_votes(votes)
  	votes.each do |key, val|
  	  puts "#{key} - #{val}".green
  	end
  end

  def announce_winner(votes)
  	votes.key(votes.values.max)
  end
end