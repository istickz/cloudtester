class QuestionsController < ApplicationController
  layout "profile"
  before_action :set_question_s, only: [:show, :edit, :create, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new(test_id: params[:test_id])
    4.times { @question.options.build }
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to test_question_url(question_params[:test_id],@question.position), notice: 'Вопрос создан успешно.' }
        format.json { render action: 'show', status: :created, location: @question }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to test_question_path(@question.test, @question.position), notice: 'Вопрос обновлен.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    @questions = @question.test.questions
  end


  def reorder
    @question = Question.find(params[:question])
    @test = @question.test
    @course = params[:course]
    if @course== "up"
      @question.move_higher
    elsif @course == "down"
      @question.move_lower
    end
    respond_to do |format|
      format.html { redirect_to test_url(@test), notice: 'Позиция вопроса обновлена.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_s
      @test = Test.find(params[:test_id])
      @questions = @test.questions
      @question = @questions.find_by_position(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:test_id, :content, options_attributes: [:id,:content, :right])
    end


end
