class VotesController < ApplicationController
	def up_vote
		@post = Post.find(params[:post_id])

		@vote = @post.votes.where(user_id: current_user.id).first

		if @vote
			authorize @vote, :update?
			@vote.update_attribute(:value, 1)
		else
			@vote = current_user.votes.build(value: 1, post: @post)
			authorize @vote, :create?
			@vote.save

		# http://apidock.com/rails/ActionController/Base/redirect_to
		redirect_to :back
	end

	private

		def load_post_and_vote
			# extract into this method the definition of @post and @topic
		end

		def update_vote!(new_value)
			# Extract vote updating/creating logic here.
    	# This method has access to @vote, because of the before_action
    end
end