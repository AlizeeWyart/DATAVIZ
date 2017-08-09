class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :atlas, :find]

  def home
    @home_text = ["Need to visualise a huge amount of data?", "Have absolutely no clue of how to show data?","Want to learn new ways of representing data?","Want to find new data visualisation ideas? "]
    @rand_text = @home_text.sample(2)
  end

  def find
    require 'json'
    filepath = 'question.json'
    serialized_questions = File.read(filepath)
    json_questions = JSON.parse(serialized_questions)

    second_filepath = 'graph.json'
    serialized_graphs = File.read(second_filepath)
    json_graphs = JSON.parse(serialized_graphs)

    @question_id = params[:question_id]
    @main_question = "What do you want to show ?"

    #SENTENT WHAT DO YOU WANT TO DO
    @to_do = ["What next ?", "What do we do now ?", "And then ?", "And now ?", "What would you most like to do ?", "Which choice suits you best ?"]
    @rand_text = @to_do.sample
    @end_result_text = "<i class=\"fa fa-hand-spock-o\" aria-hidden=\"true\"></i>"

    #Première question
    if @question_id.to_i < 1
      @is_first_question = true
      @first_children = json_questions
      @before_results = nil
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
      @array_before_results = json_questions[@number_question - 1]["before_results"]
      if !@array_before_results.nil? && @array_before_results.length > 0
        @before_results = before_results(@array_before_results)
      end
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
      #Next graph ?
      @next_graph = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["next_graph"]
      if @next_graph
        @number_of_results = @second_children.length
        @results = []
        @second_children.each do |child|
          number_graph = child["graph_number"]
          current_graph = json_graphs[number_graph]
          graph_info = [number_graph, current_graph, child["comparison"][0]]
          @results << graph_info
        end
      end
      # Before results
      @array_before_results = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["before_results"]
      if !@array_before_results.nil? && @array_before_results.length > 0
        @before_results = before_results(@array_before_results)
      end
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
      @next_graph = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["next_graph"]
      # Cherchez les réponses à la 3e question
      @third_children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"]
      if @next_graph
        @number_of_results = @third_children.length
        @results = []
        @third_children.each do |child|
          number_graph = child["graph_number"]
          current_graph = json_graphs[number_graph]
          graph_info = [number_graph, current_graph, child["comparison"][0]]
          @results << graph_info
        end
      end
      # Before results
      @array_before_results = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["before_results"]
      if !@array_before_results.nil? && @array_before_results.length > 0
        @before_results = before_results(@array_before_results)
      end
    end

    #Aller chercher la 5e question
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
      @last_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["question"]
      @fourth_children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"]
      if params[:graph] == false
        @fourth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["question"]
      else
        @fourth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["label"]
      end
      # Afficher les réponses ?
      @children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"]
      @next_graph = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["next_graph"]
      if @next_graph
        @number_of_results = @children.length
        @results = []
        @children.each do |child|
          number_graph = child["graph_number"]
          current_graph = json_graphs[number_graph]
          graph_info = [number_graph, current_graph, child["comparison"][0]]
          @results << graph_info
        end
      end
      # Before results
      @array_before_results = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["before_results"]
      if !@array_before_results.nil? && @array_before_results.length > 0
        @before_results = before_results(@array_before_results)
      end
    end

    #Aller chercher la 6e question
    if @question_id.to_i < 99999 && @question_id.to_i > 10000
      #Pour affiche la prochaine question
      @is_sixth_question = true
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
      @fourth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["question"]
      # 5. 5e question
      @number_fifth_question = @question_id.to_s.split('').map { |digit| digit.to_i }[4]
      @last_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["question"]
      # Réponses
      @children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"]
      # next graph ? si les "children" sont des graphs alors présentation des résultats
      @next_graph = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["next_graph"]
      if @next_graph
        @number_of_results = @children.length
        @results = []
        @children.each do |child|
          number_graph = child["graph_number"]
          current_graph = json_graphs[number_graph]
          graph_info = [number_graph, current_graph, child["comparison"][0]]
          @results << graph_info
        end
      end
      # Before results
      @array_before_results = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["before_results"]
      if !@array_before_results.nil? && @array_before_results.length > 0
        @before_results = before_results(@array_before_results)
      end
    end

    #Aller chercher la 7e question
    if @question_id.to_i < 999999 && @question_id.to_i > 100000
      #Pour affiche la prochaine question
      @is_seventh_question = true
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
      @fourth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["question"]
      # 5. 5e question
      @number_fifth_question = @question_id.to_s.split('').map { |digit| digit.to_i }[4]
      @fifth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["question"]
      #6. 6e question
      @number_sixth_question = @question_id.to_s.split('').map { |digit| digit.to_i }[5]
      @last_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["question"]
      #children
      @children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["children"]
      # is next_graph ?
      @next_graph = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["next_graph"]
      if @next_graph
        @number_of_results = @children.length
        @results = []
        @children.each do |child|
          number_graph = child["graph_number"]
          current_graph = json_graphs[number_graph]
          graph_info = [number_graph, current_graph, child["comparison"][0]]
          @results << graph_info
        end
      end
      # Before results
      @array_before_results = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["before_results"]
      if !@array_before_results.nil? && @array_before_results.length > 0
        @before_results = before_results(@array_before_results)
      end
    end

    #Aller chercher la 7e question
    if @question_id.to_i < 9999999 && @question_id.to_i > 1000000
      #Pour affiche la prochaine question
      @is_eight_question = true
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
      @fourth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["question"]
      # 5. 5e question
      @number_fifth_question = @question_id.to_s.split('').map { |digit| digit.to_i }[4]
      @fifth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["question"]
      #6. 6e question
      @number_sixth_question = @question_id.to_s.split('').map { |digit| digit.to_i }[5]
      @sixth_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["question"]
      #7. 7e question
      @number_seventh_question = @question_id.to_s.split('').map { |digit| digit.to_i }[6]
      @last_question = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["children"][@number_seventh_question - 1]["question"]
      #children
      @children = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["children"][@number_seventh_question - 1]["children"]
      # is next_graph ?
      @next_graph = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["next_graph"]
      if @next_graph
        @number_of_results = @children.length
        @results = []
        @children.each do |child|
          number_graph = child["graph_number"]
          current_graph = json_graphs[number_graph]
          graph_info = [number_graph, current_graph, child["comparison"][0]]
          @results << graph_info
        end
      end
      # Before results
      @array_before_results = json_questions[@number_first_question - 1]["children"][@number_second_question - 1]["children"][@number_third_question - 1]["children"][@number_fourth_question - 1]["children"][@number_fifth_question - 1]["children"][@number_sixth_question - 1]["children"][@number_sixth_question - 1]["before_results"]
      if !@array_before_results.nil? && @array_before_results.length > 0
        @before_results = before_results(@array_before_results)
      end
    end

  end

  def atlas
    @graph_number = params[:graph_number]

    require 'json'
    second_filepath = 'graph.json'
    serialized_graphs = File.read(second_filepath)
    json_graphs = JSON.parse(serialized_graphs)

    @graph_info = json_graphs[@graph_number]

    @all_results = json_graphs
    # Récupérer les filtres
    @level_nb = params["level"].to_i
    @is_dashboard = params["dashboard"]
    @name_search = params[:search]
    # Trouver les n° des graphs correspondant
    @array_of_graph_numbers = []
    @level_array_of_graph_numbers = []
    @dashboard_array_of_graph_numbers = []
    @search_array_of_graph_numbers = []


    @all_results.each do |result|
      # ne prendre que les niveaux
      if @level_nb != 0 && @level_nb != nil && @name_search.nil?
        @graph_level_nb = find_level(result[1]["level"])
        if @graph_level_nb != nil && @graph_level_nb <= @level_nb
          @level_array_of_graph_numbers << result[0]
        end
      end
      # ne prendre que les dashboard
      if !@is_dashboard.nil? && @name_search.nil?
        @graph_dashboard = result[1]["dashboard"]
        if @graph_dashboard.to_s == @is_dashboard.to_s
          @dashboard_array_of_graph_numbers << result[0]
        end
      end
      #trouver search name
      if !@name_search.nil?
        @name_search = @name_search.downcase
        @graph_name = result[1]["name"].downcase
        if @graph_name.include? @name_search
          @search_array_of_graph_numbers << result[0]
        end
      end
      # garder que les éléments en commun
      if @level_nb == 0 && @is_dashboard.nil? && @name_search.nil?
        @array_of_graph_numbers << result[0]
      end
    end

    if @level_nb != 0 && @level_nb != nil &&  !@is_dashboard.nil? && @name_search.nil?
      @array_results = @dashboard_array_of_graph_numbers & @level_array_of_graph_numbers
    elsif @level_nb > 0 && @is_dashboard.nil? && @name_search.nil?
      @array_results = @level_array_of_graph_numbers && @name_search.nil?
    elsif @level_nb == 0 && !@is_dashboard.nil? && @name_search.nil?
      @array_results = @dashboard_array_of_graph_numbers
    elsif @level_nb == 0 && @is_dashboard.nil? && @name_search.nil?
      @array_results = @array_of_graph_numbers
    elsif !@name_search.nil?
      @array_results = @search_array_of_graph_numbers
    end
    # trouver les attributs
    @results = before_results(@array_results)
  end


  private

  def find_level(level)
    if level == "Beginner" || level == "beginner"
      return 1
    elsif level == "Intermediate" || level == "intermediate"
      return 2
    elsif level == "Advanced" || level == "advanced"
      return 3
    elsif level == "Expert" || level == "expert"
      return 4
    else
      return nil
    end
  end

  def before_results(array_of_graph_numbers)
    require 'json'
    second_filepath = 'graph.json'
    serialized_graphs = File.read(second_filepath)
    json_graphs = JSON.parse(serialized_graphs)

    @results = []

    array_of_graph_numbers.each do |nb_graph|
      graph_info = json_graphs[nb_graph]
      @results << {nb_graph => graph_info}
    end
    return @results
  end

end
