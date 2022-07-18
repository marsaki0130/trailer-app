class BoardsController < ApplicationController
  
  def index
  end

  def new
    @board = current_user.board.build
  end

end