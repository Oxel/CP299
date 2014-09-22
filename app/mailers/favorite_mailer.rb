class FavoriteMailer < ActionMailer::Base
  default from: "louismorin99@gmail.com"

  def new_comment(user, post, comment)

  	# new Headers
  	headers["Message-ID"] = "<comments/#{comment.id}@bloccit.example>"
  	headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
  	headers["References"] = "<post/#{post.id}@bloccit.example>"

  	@user = user
  	@post = post
  	@comment = comment

  	mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
