class TopicsController < ApplicationController
  before_filter :find_board, :only => [:new, :create]
  before_filter :find_topic, :only => [:show]

  def show


  end


  def new
    @topic = @board.topics.build
  end

  def create
    @topic = @board.topics.build(params[:topic])

    if @topic.save
      redirect_to board_topic_url(@board ,@topic)
    else
      render :action => :new
    end

  end



  protected

  def find_board
    @board = Board.find(params[:board_id])
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end




end
