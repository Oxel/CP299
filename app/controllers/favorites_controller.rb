class FavoritesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)

		if favorite.save
			flash[:notice] = "Favorited!"
      redirect_to [@post.topic, @post]
    else
    	flash[:error] = "There was an error favoriting the post. Please try again."
      render :new
    end
  end

  def destroy
  	@post = Post.find(params[:id])
  	favorite = @post.favorites.find(params[:id])

  	if favorite.destroy
  		flash[:notice] = "Favorite was removed."
  		redirect_to [@post.topic, @post]
  	else
  		flash[:error] = "There was an error removing the favorite. Please try again."
  		redirect_to [@post.topic, @post]
  	end

  end

end
