class ForumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @topics = Forum.all.reverse
  end

  def show
    @topic = Forum.find(params[:id])
    @messages = Message.where(forum: @topic).reverse
    @message = Message.new
  end

  def new
    @forum = Forum.new
    @message = Message.new
  end

  def create
    topic = params["Topic"]
    topic_new = Forum.new(name: topic.capitalize)
    if topic_new.save
      title = params["Title"]
      body = params["Body"]
      if title.present? && body.present?
        Message.create(title: title, content: body, user: current_user, date: Time.now, forum: topic_new)
      end
      redirect_to forums_path, notice: "Thread successfully created"
    else
      redirect_to new_forum_path, notice: "Missing Topic Title"
    end
  end
end
