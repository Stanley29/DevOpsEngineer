1. Створення бази даних та колекцій:

```

use gymDatabase

db.createCollection("clients")
db.createCollection("memberships")
db.createCollection("workouts")
db.createCollection("trainers")

```

![collections](images/01_MongoDb_training_db_view.jpg)

2. Визначення схеми документів: Here's how the documents might look:

Clients:

```

{
    "client_id": 1,
    "name": "John Doe",
    "age": 35,
    "email": "johndoe@example.com"
}

```
![db_clients](images/02_MongoDb_training_db_clients.jpg)


Memberships:

```

{
    "membership_id": 1,
    "client_id": 1,
    "start_date": "2024-01-01",
    "end_date": "2024-12-31",
    "type": "Annual"
}

```
![db_membership](images/03_MongoDb_training_db_membership.jpg)


Workouts:

```

{
    "workout_id": 1,
    "description": "Cardio Blast",
    "difficulty": "Medium"
}

```
![db_workouts](images/05_MongoDb_training_db_workouts.jpg)


Trainers:

```

{
    "trainer_id": 1,
    "name": "Jane Smith",
    "specialization": "Cardio"
}

```
![db_trainers](images/04_MongoDb_training_db_trainers.jpg)


3. Заповнення колекцій даними: Add some sample data to your collections:

```

db.clients.insertMany([
    { "client_id": 1, "name": "John Doe", "age": 35, "email": "johndoe@example.com" },
    { "client_id": 2, "name": "Jane Roe", "age": 28, "email": "janeroe@example.com" }
])

db.memberships.insertMany([
    { "membership_id": 1, "client_id": 1, "start_date": "2024-01-01", "end_date": "2024-12-31", "type": "Annual" },
    { "membership_id": 2, "client_id": 2, "start_date": "2024-02-01", "end_date": "2024-08-01", "type": "Semi-Annual" }
])

db.workouts.insertMany([
    { "workout_id": 1, "description": "Cardio Blast", "difficulty": "Medium" },
    { "workout_id": 2, "description": "Strength Training", "difficulty": "Hard" }
])

db.trainers.insertMany([
    { "trainer_id": 1, "name": "Jane Smith", "specialization": "Cardio" },
    { "trainer_id": 2, "name": "Bob Johnson", "specialization": "Strength" }
])

```

![db_fill_all](images/06_MongoDb_training_db_fill_all.jpg)

![db_clients_filled](images/07_MongoDb_training_db_clients_filled.jpg)

![db_membership_filled](images/08_MongoDb_training_db_membership_filled.jpg)

![db_trainers_filled](images/09_MongoDb_training_db_trainers_filled.jpg)

![db_workouts_filled](images/10_MongoDb_training_db_workouts_filled.jpg)



4. Запити:

Знайдіть всіх клієнтів віком понад 30 років:

```

db.clients.find({ "age": { $gt: 30 } })

```
![db_clients_over30](images/11_MongoDb_training_db_clients_over30.jpg)


Перелічіть тренування із середньою складністю:

```

db.workouts.find({ "difficulty": "Medium" })

```
![db_workouts_medium](images/12_MongoDb_training_db_workouts_medium.jpg)


Покажіть інформацію про членство клієнта з певним client_id:

```

db.memberships.find({ "client_id": 1 })
There you go! If you need more help or want to add some complex queries, let me know.

```
![db_membership_find_by_id](images/13_MongoDb_training_db_membership_find_by_id.jpg)

