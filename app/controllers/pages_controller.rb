class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    require 'json'
    filepath = 'question.json'
    serialized_questions = File.read(filepath)
    json_questions = JSON.parse(serialized_questions)
    @question_id = params[:question_id]

    #Première question
    @first_question = json_questions["question"]
    @first_children = json_questions["children"]
    if @question_id.to_i < 9
      @is_first_question = true
    end


    #Deuxième question
    if @question_id.to_i > 9 && @question_id.to_i < 100
      @is_second_question = true
      @number_question = @question_id.to_s.split('').map { |digit| digit.to_i }.last
      @second_question = json_questions["children"][@number_question - 1]["question"]
      @second_children = json_questions["children"][@number_question - 1]["children"]
    end

    #Troisième question
    if @question_id.to_i > 99 && @question_id.to_i < 1000
      @is_third_question = true
      @number_question = @question_id.to_s.split('').map { |digit| digit.to_i }.last
      @number_last_question = @question_id.to_s.split('').map { |digit| digit.to_i }[1]
      @second_question = json_questions["children"][@number_last_question - 1]["question"]
      @third_question = json_questions["children"][@number_last_question - 1]["children"][@number_question - 1]["question"]
      @third_children = json_questions["children"][@number_last_question - 1]["children"][@number_question - 1]["children"]
    end

    #Quatrième question
    if @question_id.to_i > 999 && @question_id.to_i < 10000
      @is_fourth_question = true
      @is_graph = params[:graph]
      @number_question = @question_id.to_s.split('').map { |digit| digit.to_i }.last
      @number_third_question = @question_id.to_s.split('').map { |digit| digit.to_i }[2]
      @number_second_question = @question_id.to_s.split('').map { |digit| digit.to_i }[1]
      @second_question = json_questions["children"][@number_second_question - 1]["question"]
      @third_question = json_questions["children"][@number_second_question - 1]["children"][@number_third_question - 1]["question"]
      @fourth_question = json_questions["children"][@number_second_question - 1]["children"][@number_third_question - 1]["question"]
      @fourth_children = json_questions["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"]
      @graph_selected = @fourth_children[@number_question]
    end
  end
end
