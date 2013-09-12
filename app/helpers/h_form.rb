# what is this file for?

helpers do

  require 'pry'
  def parse_form(data)
    survey = Survey.create(creator_id: current_user.id, name: data["survey"]["name"])
    data["question"].each do |q_key, q_value|
      question = Question.create(survey_id: survey.id, title: q_value["title"])
      data["choice"].each_value do |choice|
        if choice.fetch('question') == q_key
          Choice.create(question_id: question.id, option: choice['option'])
        end
      end
    end
  end




    # binding.pry

    #data.each do |key, value|
      #case key
      #when survey
        #survey.each do |s|        survey[title] = val
          #Survey.create(title: s)
        # end
      #when question
        #question.each do |num|      question[no][title] = val
          # Question.create(title: num[title])
        # end
      #when choice                          choice[no][option] = val
        #choice.each do |num|         choice[no][question] = question id
          #Choice.create(option: num[option], question: num[question])
        # end
      #end
    #end


end
