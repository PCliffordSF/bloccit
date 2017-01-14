class FavoriteMailer < ApplicationMailer
    default from: "paulclifford2570@gmail.com"
    
   def new_comment(user, post, comment)
 
     headers["Message-ID"] = "<comments/#{comment.id}@bloccit.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
     headers["References"] = "<post/#{post.id}@bloccit.example>"
 
     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, subject: "New comment on #{post.title}")
   end
   
   def new_post(user, post, comment)
 
     headers["Message-ID"] = "<comments/#{post.id}@bloccit.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
     headers["References"] = "<post/#{post.id}@bloccit.example>"

 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "You have favorited your recently created post")
   end
   
    
end
