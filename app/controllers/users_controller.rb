class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Yurii',
        username: 'makarenkoj',
        avatar_url: 'https://super-avatara.ru/images/trueimg/pictures/69/F2546A44EA1E-69.gif'
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
      avatar_url: 'https://super-avatara.ru/images/trueimg/pictures/69/F2546A44EA1E-69.gif'
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

    @new_question = Question.new
  end
end
