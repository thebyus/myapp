# Assumes votes association with a boolean 'vote' column
=begin
module	Voteable	
	def total_votes
		self.votes.where(vote: true).size - self.votes.where(vote: false).size
	end
end
=end