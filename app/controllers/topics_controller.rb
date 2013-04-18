# -*- encoding : utf-8 -*-
class TopicsController < ApplicationController
  before_filter :find_board, :only => [:new, :create]
  before_filter :find_topic, :only => [:show, :destroy]

  def show
    @board = @topic.board


    drop_breadcrumb(@board.title, board_path(@board))
    drop_breadcrumb(@topic.title)
  end


  def new
    @topic = @board.topics.build


    drop_breadcrumb(@board.title, board_path(@board))
    drop_breadcrumb("新增主題")
  end

  def create
    @topic = @board.topics.build(params[:topic])

    if @topic.save
      redirect_to board_topic_path(@board ,@topic)
    else
      render :new
    end

  end


  def destroy
    @board = @topic.board
    @topic.destroy

    redirect_to board_path(@board)

  end



  protected

  def find_board
    @board = Board.find(params[:board_id])
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end




end
