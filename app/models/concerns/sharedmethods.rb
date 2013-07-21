module SharedMethods
	extend ActiveSupport::Concern

  def total_votes
  	self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end

	def rank
		@rank = comment.total_votes
	end

end