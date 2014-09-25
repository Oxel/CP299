class VotesController < ApplicationController
	before_action :load_post_and_vote
	

	def up_vote
		# http://apidock.com/rails/ActionController/Base/redirect_to
		update_vote!(1)
		redirect_to :back
	end

	def down_vote
		update_vote!(-1)
		redirect_to :back
	end

	private

	def load_post_and_vote
		# extract into this method the definition of @post and @vote
		@post = Post.find(params[:post_id])
		@vote = @post.votes.where(user: current_user).first
	end

	def update_vote!(new_value)
		# Extract vote updating/creating logic here.
    # This method has access to @vote, because of the before_action
    if @vote
			authorize @vote, :update?
			@vote.update_attribute(:value, 1)
		else
			@vote = current_user.votes.build(value: 1, post: @post)
			authorize @vote, :create?
			@vote.save
    end
  end


end