class Game
  attr_reader :tribes

  def initialize(tribe1, tribe2)
  	@tribes = [tribe1, tribe2]
  end

  def add_tribe(new_tribe)
  	@tribes.push(new_tribe)
  end

  def immunity_challenge
  	@tribes.sample
  end

  def clear_tribes
  	@tribes = []
  end

  def merge(name)
  	members = []
	  @tribes.each { |tribe| members += tribe.members }
  	Tribe.new({name: name, members: members})
  end

  def individual_immunity_challenge
  	merge("combined_tribe").members.sample
  end
end