class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  add_breadcrumb 'Home','http://localhost3000'
  before_action :set_genre
  def index
    add_breadcrumb 'ブログ一覧'
    @programs = @genre.programs
    # binding.pry
  end

  def show
    add_breadcrumb 'ブログ一覧'
    add_breadcrumb '日記'
    add_breadcrumb @program_title, :root_path
  end

  def new
    @program = @genre.programs.new
  end

  def edit
  end

  def create
    @program = Program.create(program_params)
    # binding.pry
  end

  def search
    @program = Program.search(genre_params)
    render "index"
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:title,:video,:text, :genre_id).merge(user_id: current_user.id)
    end

    def set_genre
      @genre = Genre.find(params[:genre_id])
      Time.zone ='Tokyo'
      # binding.pry
    end
end
