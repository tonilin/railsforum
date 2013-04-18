# -*- encoding : utf-8 -*-
class TopicsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :find_board
  before_filter :find_topic, :only => [:show]
  before_filter :find_user_topic, :only => [:edit, :update, :destroy]

  def show

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
    @topic.user = current_user

    if @topic.save
      redirect_to board_topic_path(@board ,@topic)
    else
      render :new
    end

  end


  def destroy
    @topic.destroy

    redirect_to board_path(@board)

  end

  def edit
    drop_breadcrumb(@board.title, board_path(@board))
    drop_breadcrumb(@topic.title, board_topic_path(@board,@topic))
    drop_breadcrumb("編輯主題")
  end

  def update

    if @topic.update_attributes( params[:topic] )
      redirect_to board_topic_path(@board)
    else
      render :edit
    end
  end






  protected

  def find_board
    @board = Board.find(params[:board_id])
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def find_user_topic
    @topic = current_user.topics.find(params[:id])
  end




end
