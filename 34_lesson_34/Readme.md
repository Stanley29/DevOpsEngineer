
Основний проєкт

Візьмемо простий Java-проєкт на основі Maven. Використовуйте репозиторій Spring Boot Example Application.

1. Форкніть проєкт:
  * Зайдіть у репозиторій gs-spring-boot і форкніть його у свій GitHub-акаунт
  * Клонувати локально не обов’язково — Jenkins автоматично звантажить репозиторій під час виконання завдань
   
   ![secrets](images/01_Jenkins_git.jpg)

📌 Завдання 1: Деплой Jenkins

Запустіть Jenkins на вашому локальному сервері або в Docker:

1. Додайте плагіни:
  * Git Plugin
  * Pipeline Plugin
  * Telegram Notification Plugin (для завдання з нотифікаціями)
  
    ![secrets](images/02_Jenkins_git_plugin.jpg)
	
	![secrets](images/03_Jenkins_pipeline_plugin.jpg)
	
	![secrets](images/04_Jenkins_telegram_plugin.jpg)
	
📌 Завдання 2: Налаштувати EC2

1. Створіть інстанс Amazon EC2 (Amazon Linux 2 або Ubuntu).
	
   ![secrets](images/05_Jenkins_EC2.jpg)
	 
	 Налаштуйте SSH-доступ і встановіть Java та переконайтеся, що ваш Jenkins може підключатися до EC2 через SSH.
	 
	 SSH-доступ і Java встановлено успішно
	 
	 ![secrets](images/06_Jenkins_EC2.jpg)
	 
	 ![secrets](images/07_Jenkins_EC2_java.jpg)
	 
	 В іншому я переконався, що дженкінс не здатний виконувати навіть базові команди консолі, які успішно проходять коли їх запускають в консолі.
	 Тому, я не зміг рухатися далі.
	 ![secrets](images/08_Jenkins_not_successful.jpg)
	 