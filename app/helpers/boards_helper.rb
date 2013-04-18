module BoardsHelper

  def render_board_title(board)
    link_to(board.title, board_path(board))
  end



end
