class TestsController < ApplicationController
  layout "profile"

  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @filter = params[:filter]
    filters = {public: "Открытые тесты", private: "Закрытые тесты", drafts: "Черновики", all: "Все тесты"}
    if !@filter.nil? && @filter_name = filters[@filter.to_sym]
      @tests = Test.send(@filter)
    else
      @filter_name = filters[:all]
      @tests = Test.all
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
   @questions = @test.questions
  end

  # GET /tests/new
  def new
    @test = current_user.tests.build
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to [:profile, @test], notice: 'Тест создан' }
        format.js {}
        format.json { render action: 'show', status: :created, location: @test }
      else
        format.html { render action: 'new' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Тест обновлен' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_params
    params.require(:test).permit(:name)
  end
end

