class ExamController < ApplicationController
  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
    @question = @questions.find_by_position(params[:question_id])
  end

  def check
    test = Test.find(params[:exam][:test_id])
    #question = test.questions.find(params[:exam][:question_id])
    #question = params[:exam][:question_id]
    #answer = params[:exam][:options]
    #next_question =
    #format.html { redirect_to "exam/#{test_question_path(@question.test, @question.position)}", notice: 'Вопрос обновлен.' }

  end
end
