require 'rails_helper'

describe User do
	
	include TestFactories

	describe "#favorited(post)" do

		before do
			@post = associated_post
			@user = authenticated_user
			@favorite = Favorite.new(post @post)
		end

		it "returns 'nil' if the user has not favorited the post" do
			
			expect( FavoriteMailer )
				.not_to receive(:new_favorite)
				.with(@user, @post, 'nil')
				.and_return( double(deliver: true) )
			
		end

		it "returns the appropriate favorite if it exists" do
			@user.favorites.where(post: @post).after_create

			allow( FavoriteMailer )
				.to receive(:new_favorite)
				.with(@user, @post, @favorite)
				.and_return( double(deliver: true) )

			@post.save

		end
	end
end