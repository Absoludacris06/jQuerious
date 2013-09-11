9.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Lorem.word)
end
users = User.all

test_user = User.create(username: "test", email: "test@dbc.com", password: "password");
jane = User.create(username: "Jane", email: "jane@dbc.com", password: "password");
joe = User.create(username: "Joe", email: "joe@dbc.com", password: "password");
# survey creation
5.times do
  Survey.create(creator: test_user, name: Faker::Lorem.sentence)
end

5.times do
  Survey.create(creator: jane, name: Faker::Lorem.sentence)
end

5.times do
  Survey.create(creator: joe, name: Faker::Lorem.sentence)
end

surveys = Survey.all

surveys.each do |survey|
  10.times do |i|
    survey.questions.create(title: Faker::Lorem.sentence)
  end
end

questions = Question.all

questions.each do |question|
  4.times do |i|
    question.choices.create(option: Faker::Lorem.word, question_id: question.id)
  end
end
