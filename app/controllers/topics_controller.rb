class TopicsController < ApplicationController
  before_filter :find_board, :only => [:new, :create]
  before_filter :find_topic, :only => [:show, :destroy]

  def show
    @board = @topic.board

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


  def destroy
    @board = @topic.board
    @topic.destroy

    redirect_to board_path(@board);

  end



  protected

  def find_board
    @board = Board.find(params[:board_id])
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end




end
