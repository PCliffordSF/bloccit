class TopicsController < ApplicationController
 
   before_action :require_sign_in, except: [:index, :show]
    
   def index
     @topics = Topic.all
   end
   
    
   def show
     @topic = Topic.find(params[:id])
   end
   
    
   def new
    if current_user.member? || current_user.moderator?
     flash[:alert] = "You must be an admin to do that."
     redirect_to topics_path
    else
     @topic = Topic.new
    end
   end 
   
   def create
    if current_user.member? || current_user.moderator?
     flash[:alert] = "You must be an admin to do that."
     redirect_to topics_path
    else
    @topic = Topic.new(topic_params)
 
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
    end
   end
   
    
   def edit
    if current_user.member?
     flash[:alert] = "You must be an admin or moderator to do that."
     redirect_to topics_path
    else
     @topic = Topic.find(params[:id])
    end
   end
   
    
   def update
    if current_user.member?
     flash[:alert] = "You must be an admin or moderator to do that."
     redirect_to topics_path
    else
     @topic = Topic.find(params[:id])
 
     @topic.assign_attributes(topic_params)
 
     if @topic.save
        flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash.now[:alert] = "Error saving topic. Please try again."
       render :edit
     end
    end
   end
   
   def destroy
    if current_user.member? || current_user.moderator?
     flash[:alert] = "You must be an admin to do that."
     redirect_to topics_path
    else
     @topic = Topic.find(params[:id])
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
    end
   end
 
   private
 
   def topic_params
     params.require(:topic).permit(:name, :description, :public)
   end
   
end
