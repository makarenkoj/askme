class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Yurii',
        username: 'makarenkoj',
        avatar_url: 'https://super-avatara.ru/images/trueimg/pictures/16/835B7844D4EC-16.gif'
        ),
      User.new(
        id: 2,
        name: 'Misha',
        username: 'aristofun'
        ),
      User.new(
        id: 3,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/71269686e0f757ddb4f73614f43ae445?s=100'
        )
    ]
  end

  def new
  end

  def edit
  end

  def show
  	@user = User.new(
  		name: 'Yurii',
  		username: 'makarenkoj',
      avatar_url: 'https://super-avatara.ru/images/trueimg/pictures/16/835B7844D4EC-16.gif'
  		)

    @questions = [
      Question.new(
        text: 'Как дела?', created_at: Date.parse('19.10.2019')
        ),
      Question.new(
        text: 'В чем смысл жизни?', created_at: Date.parse('19.10.2019')
      ),
       Question.new(
        text: 'Почём опиум для народа?', created_at: Date.parse('19.10.2019')
      )
    ]
    @questions_count = @questions.count
    @new_question = Question.new
    @answers_count = @questions_count
    @unanswered_count = @questions_count
  end
end
