class Jury
  attr_accessor :members

  def initialize
  	@members = []
  end

  def add_member(name)
  	@members.push(name)
  end
end