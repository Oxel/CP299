require 'rails_helper'

describe VotesController do
	
	include TestFactories
	Devise::TestHelpers

	describe '#upvote' do
		it "adds an up-vote to the post" do
			@user = authenticated_user
			@post = associated_post
			request.env["HTTP_REFERER"] = '/'
			sign_in @user

			expect {
				post( :up_vote, post_id: @post.id )
			}.to change{ @post.up_votes }.by 1
	end
	
	describe '#downvote' do
		it "adds an down-vote to the post" do
			@user = authenticated_user
			@post = associated_post
			request.env["HTTP_REFERER"] = '/'
			sign_in @user

			expect {
				post( :down_vote, post_id: @post.id )
			}.to change{ @post.up_votes }.by -1
	end





	end

end