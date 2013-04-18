class BoardsController < ApplicationController
  before_filter :find_board, :only => [:show]

  def show
    @topics = @board.topics


  end


  def new
    @board = Board.new

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
