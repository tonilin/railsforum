class BoardsController < ApplicationController
  before_filter :find_board, :only => [:show]

  def show
    @topics = @board.topics


  end


  def new


  end




  protected

  def find_board
    @board = Board.find(params[:id])

  end


end
