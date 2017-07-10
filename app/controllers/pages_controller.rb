class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    require 'json'
    filepath = 'question.json'
    serialized_questions = File.read(filepath)
    json_questions = JSON.parse(serialized_questions)
    @question_id = params[:question_id]
    @main_question = "What do you want to show ?"

    #Première question
    if @question_id.to_i < 1
      @is_first_question = true
      @first_children = json_questions
    end

    #Deuxième question
    if @question_id.to_i < 9 && @question_id.to_i > 0
      #Condition pour afficher la 2e question
      @is_second_question = true
      # Récupérer le n° de la 1e question
      @number_question = @question_id.to_s.split('').map { |digit| digit.to_i }.last
      # Chercher la 1e question
      @second_question = json_questions[@number_question - 1]["question"]
      # Cherchez les réponses à la 1e question
      @second_children = json_questions[@number_question - 1]["children"]
    end

    #Aller chercher la 3e question
    if @question_id.to_i < 99 && @question_id.to_i > 10
      #Condition pour afficher la 2e question
      @is_third_question = true
      # Récupérer le n° de la 1e question
      @number_first_question = @question_id.to_s.split('').map { |digit| digit.to_i }.first
      # Récupérer le n° de la 2e question
      @number_second_question = @question_id.to_s.split('').map { |digit| digit.to_i }[1]
      # Chercher la 1e question
      @first_question = json_questions[@number_first_question - 1]["question"]
      # Cherchez la 2e question
      @second_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["question"]
      # Cherchez les réponses à la 2e question
      @second_children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"]
    end

    #Aller chercher la 4e question
    if @question_id.to_i < 999 && @question_id.to_i > 100
      #Condition pour afficher la 2e question
      @is_fourth_question = true
      # Récupérer les N° et les phrases de question
      # 1. 1e question
      @number_first_question = @question_id.to_s.split('').map { |digit| digit.to_i }.first
      @first_question = json_questions[@number_first_question - 1]["question"]
      # 2. 2e question
      @number_second_question = @question_id.to_s.split('').map { |digit| digit.to_i }[1]
      @second_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["question"]
      # 3. 3e question
      @number_third_question = @question_id.to_s.split('').map { |digit| digit.to_i }[2]
      @third_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["question"]
      # Cherchez les réponses à la 3e question
      @third_children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"]
    end

    #Aller chercher la 4e question
    if @question_id.to_i < 9999 && @question_id.to_i > 1000
      #Condition pour afficher la 2e question
      @is_five_question = true
      # Récupérer les N° et les phrases de question
      # 1. 1e question
      @number_first_question = @question_id.to_s.split('').map { |digit| digit.to_i }.first
      @first_question = json_questions[@number_first_question - 1]["question"]
      # 2. 2e question
      @number_second_question = @question_id.to_s.split('').map { |digit| digit.to_i }[1]
      @second_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["question"]
      # 3. 3e question
      @number_third_question = @question_id.to_s.split('').map { |digit| digit.to_i }[2]
      @third_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["question"]
      # 4. 4e question
      @number_fourth_question = @question_id.to_s.split('').map { |digit| digit.to_i }[3]
      # Cherchez les réponses à la 4e question
      if params[:graph] == false
        @fourth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["question"]
        @fourth_children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"]
      else
        @fourth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["label"]
      end
    end

  end
end
