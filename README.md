# CarServiceInfo
<h1>Описание приложения</h1>
<p>Делаем приложение в первую очередь ориентированное на собственника бизнеса. Чтобы ему оно понравилось, а не пользавателям. По тому что деньги нам будет платить он, а не пользователи.</p>
<p>При первом входе в приложение отображается короткое слайд шоу с описанием функционала и кнопкой "мне все понятно" в конце</p>
<p>Приложение состоит из следующих пользовательских экранов:</p>
<ul>
<li>Основной экран (по центру) - список услуг автосервиса(offline Core Data. возможность обновления при подключении к сети)</li>
<li>Личный кабинет(скидки) и можно заполнить информацию о себе, перейдя в следующее окно по нажатию кнопки</li>
<li>Информация об организации (Жесткий вид с кнопкой позвонить)</li>
<li>Карта, где находится организация</li>
<li>Диалоговое окно: Задать вопрос, записаться, запросить обратный звонок</li>
</ul>
<h1>Документация по проекту</h1>
<p><strong>Проблема, которую должно решить наше приложение:</strong> Информация об организации, скидки, накопление бонусов, обмен текстовыми сообщениями</p>

<h2>Взаимодействие комадны с проектом</h2>

<h2>Функциональные требования:</h2>
<pre>
1. Ввод данных:
 -текст (максимальная длинна сообщения 1024 символа)
 -место положения (GPS)
2. Внешние коммуникационные интерфейсы
 -HTTP запросы формат Json
 -HTTP ответы формат Json
 -При отсутствии связи с сервером, оповестить пользователя  (Пример Youtube)
3. Задачи
 -Получение и отображение информации об организации с сервера
 -Отображение конфигурируемого с сервера списка интерактивных элементов (далее - Элементов)
 -Обмен сообщениями
 -Отображение напоминаний и ответа с сервера на заблокированном устройстве
4. Требования
 -Сохранять сложность приложения Низкой. Должны иметь возможность портировать приложение на андроид за неделю.
 -Время соединения с сервером не более 5 секунд
</pre>

<h2>Архитектура приложения</h2>
<pre>
1. Паттерны проектирования 
 -MVC
2. Локализация
 -Русский
3. Организация хранения данных
 Данные хранятся на устройстве и на сервере, при подключении к серверу
 происходит сверка и обновление.
4. Безопасность
 Сервер принимает взаимодействует лишь с iOS приложениями.
 TODO: Придумать, как это реализовать
5. Тесты: Самостоятельно пишем модульные тесты на разрабатываемую функциональность.
</pre>
<h2>TODO:</h2>
<pre>
1. Индикатор загрузки во время ожидания данных с сервера.
2. Поправить внешний вид экрана выбора группы услуг
3. Прикрутить-таки Coredata
</pre>
