class BoardsController < ApplicationController
  
  def index
    @board = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def show
    @board = Board.find(params[:id])
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path, notice:'投稿しました'
    else
      flash.now[:eoor] = '更新に失敗しました'
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:introduction, :eyecatch)
  end
end