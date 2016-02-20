class Tribe
  attr_reader :name, :members

  def initialize(options={})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Creating new tribe: #{@name}"
  end

  def to_s
  	@name
  end

  def tribal_council(immune)
  	@members.select { |member| member != immune }
  end
end