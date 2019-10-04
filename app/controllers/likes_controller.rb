class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, program_id: params[:program_id])
    @likes = Like.where(program_id: params[:program_id])
    @programs = Program.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, program_id: params[:program_id])
    like.destroy
    @likes = Like.where(program_id: params[:program_id])
    @programs = Program.all
  end
end
