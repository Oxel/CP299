require 'rails_helper'

describe Vote do
	
	include TestFactories

	describe "validations" do

		before do
			@vote = Vote.new
		end
			
		it 'is valid with a value of 1' do
			@vote.value = 1
			expect(@vote).to be_valid
		end

		it 'is valid with a value of -1' do
			@vote.value = -1
			expect(@vote).to be_valid
		end
				
		it 'is invalid with a value of 0' do
			@vote.value = 0
			expect(@vote).to be_invalid
		end

		it 'is invalid with a value of 2' do
			@vote.value = 2
			expect(@vote).to be_invalid
		end
			
		it 'is invalid with a value of -2' do
			@vote.value = -2
			expect(@vote).to be_invalid
		end

		it 'is invalid with a value of "foo"' do
			@vote.value = "foo"
			expect(@vote).to be_invalid
		end			
	end
end

	describe 'after_save' do
		it "calls 'Post#update_rank' after save" do
			request.env["HTTP_REFERER"] = '/'
			@user = authenticated_user
			@post = associated_post
			sign_in @user

			vote = Vote.new(value:1, post: post)
			expect(post). to receive(:update_rank)
				vote.save
		end
	end








