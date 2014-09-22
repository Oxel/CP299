require 'rails_helper'

describe Vote do
	

	describe "validations" do

	before do
		@vote = @post.votes.where(user_id: current_user.id)
	end
		
		describe "value validation" do

			describe '#up_votes' do
				before { @vote.value = 1 }
					it 'tests if the value of up vote is equal to 1'
			end

			describe '#down_votes' do
				before { @vote.value = -1 }
					it 'tests if the value of a down vote is equal to -1'
					
			end

			describe '#invalid_votes' do
				before { @vote.value = 0 }
					it 'test if the votes is invalid'
			end

				
		end
	end
end



