# -*- encoding : utf-8 -*-
class BoardsController < ApplicationController
  before_filter :find_board, :only => [:show]

  def show
    @topics = @board.topics


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
      render :action => :new
    end

  end


  protected

  def find_board
    @board = Board.find(params[:id])

  end


end
