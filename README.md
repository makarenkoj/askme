***ASKME***
===========
Это приложение аналог [ask.fm](https://ask.fm/), социальная сеть разработаная в обучающих целях.

Любой может создать учётную запись и задать свой вопрос или отвечать на вопросы 

других пользователей. 

Для запуска на локаоьной сети  вам понадобится:
===========
Ruby 2.6.3,

Rails 5.2.3,

SQLite3,

скачать или клонировать репозиторий,

открыть терминал или командную строку,

ввести:
```
                      $ cd путь к папке с приложением/askme
```

в папке с игрой ввести:

```
                       $ bundle install --without production

                       $ bundle exec race db:migrate
                       
                       $ bundle exec rails s
                       
   ```                    
                       
 в брузе перейти на страницу http://localhost:3000.
 
 Это приложение настроено для работы на [Heroku](https://aaaaask.herokuapp.com/).
 
