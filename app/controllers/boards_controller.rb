# -*- encoding : utf-8 -*-
class BoardsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :find_board, :only => [:show, :edit, :update, :destroy]

  def show
    @topics = @board.topics.recent.includes(:user)

    drop_breadcrumb(@board.title)
  end


  def new
    @board = Board.new


    drop_breadcrumb("新增討論版")
  end


  def create
    @board = Board.new(params[:board])

    if @board.save
      redirect_to board_url(@board)
    else
      render :new
    end

  end

  def edit
    drop_breadcrumb(@board.title, board_path(@board))
    drop_breadcrumb("編輯討論版")
  end

  def update
    if @board.update_attributes( params[:board] )
      redirect_to board_path(@board)
    else
      render :edit
    end
  end


  def destroy
    @board.destroy

    redirect_to "/"
  end




  protected

  def find_board
    @board = Board.find(params[:id])

  end


end
