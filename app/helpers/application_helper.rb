# В этом файле мы можем писать вспомогательные методы (хелперы) для
# шаблонов (view) нашего приложения.
module ApplicationHelper
  # Этот метод возвращает ссылку на автарку пользователя, если она у него есть.
  # Или ссылку на дефолтную аватарку, которая лежит в app/assets/images
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  #хелпер склонения существительных
  def sklonenie(number, vopros, voprosa, voprosov)
    return voprosov if (number % 100).between?(11, 14)

    case number % 10
    when 1 then
      vopros
    when 2..4 then
      voprosa
    else
      voprosov
    end
  end
end
