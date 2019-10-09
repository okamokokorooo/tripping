class LikesController < ApplicationController
  before_action :set_program, only: [:destroy]
  def create
    @like = Like.create(user_id: current_user.id, program_id: params[:program_id])
    @likes = Like.where(program_id: params[:program_id])
    @programs = Program.all
    @program = Program.new
    # binding.pry
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, program_id: params[:program_id])
    @like.destroy
    @likes = Like.where(program_id: params[:program_id])
    @programs = Program.all
    # binding.pry
  end

  def set_program
    @program = Program.find(params[:id])
    # binding.pry
  end
end
