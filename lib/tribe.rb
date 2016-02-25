class Tribe
  attr_accessor :name, :members

  def initialize(options={})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Creating new tribe: " + "#{@name}".red
  end

  def to_s
  	@name
  end

  def tribal_council(immune)
    voted_off_candidates = @members.select { |member| member != immune }
    voted_off = voted_off_candidates.sample
    @members.delete(voted_off)
    voted_off
  end
end