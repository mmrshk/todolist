

# Group Comments


## Comments [/comments]


### Get comments [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `1` (number, required)
    + task_id: `1` (number, required)

+ Request gets list of comments
**GET**&nbsp;&nbsp;`/api/v1/projects/1/tasks/1/comments`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "text": "Comment text 1",
                "file": {
                  "url": null
                },
                "created_at": "2019-02-19T05:40:11.444Z",
                "updated_at": "2019-02-19T05:40:11.444Z",
                "task_id": 1
              },
              {
                "id": 2,
                "text": "Comment text 2",
                "file": {
                  "url": null
                },
                "created_at": "2019-02-19T05:40:11.449Z",
                "updated_at": "2019-02-19T05:40:11.449Z",
                "task_id": 1
              },
              {
                "id": 3,
                "text": "Comment text 3",
                "file": {
                  "url": null
                },
                "created_at": "2019-02-19T05:40:11.453Z",
                "updated_at": "2019-02-19T05:40:11.453Z",
                "task_id": 1
              }
            ]

### Create comment [POST /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `2` (number, required)
    + task_id: `2` (number, required)

+ Request creates new comment
**POST**&nbsp;&nbsp;`/api/v1/projects/2/tasks/2/comments`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text=Comment+text+4

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 4,
              "text": "Comment text 4",
              "file": {
                "url": null
              },
              "created_at": "2019-02-19T05:40:11.523Z",
              "updated_at": "2019-02-19T05:40:11.523Z",
              "task_id": 2
            }

### Edit comment [PUT /api/v1/comments/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request update existed comment
**PUT**&nbsp;&nbsp;`/api/v1/comments/5`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            text=Edited+comment

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 5,
              "task_id": 3,
              "text": "Edited comment",
              "file": {
                "url": null
              },
              "created_at": "2019-02-19T05:40:11.549Z",
              "updated_at": "2019-02-19T05:40:11.562Z"
            }

### Get comment [GET /api/v1/comments/{id}]

+ Parameters
    + id: `6` (number, required)

+ Request get existed comment
**GET**&nbsp;&nbsp;`/api/v1/comments/6?text=Comment text 7`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 6,
              "text": "Comment text 6",
              "file": {
                "url": null
              },
              "created_at": "2019-02-19T05:40:11.585Z",
              "updated_at": "2019-02-19T05:40:11.585Z",
              "task_id": 4
            }

### Delete comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request delete comments
**DELETE**&nbsp;&nbsp;`/api/v1/comments/7`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 204

# Group Projects


## Projects [/projects]


### Get projects [GET /api/v1/projects]


+ Request gets list of projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 6,
                "name": "Project 6",
                "created_at": "2019-02-19T05:40:11.735Z",
                "updated_at": "2019-02-19T05:40:11.735Z",
                "user_id": 6
              },
              {
                "id": 7,
                "name": "Project 7",
                "created_at": "2019-02-19T05:40:11.740Z",
                "updated_at": "2019-02-19T05:40:11.740Z",
                "user_id": 6
              },
              {
                "id": 8,
                "name": "Project 8",
                "created_at": "2019-02-19T05:40:11.745Z",
                "updated_at": "2019-02-19T05:40:11.745Z",
                "user_id": 6
              }
            ]

### Create project [POST /api/v1/projects]


+ Request creates new project
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Project+9

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 9,
              "name": "Project 9",
              "created_at": "2019-02-19T05:40:11.774Z",
              "updated_at": "2019-02-19T05:40:11.774Z",
              "user_id": 7
            }

### Edit project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `10` (number, required)

+ Request edit existed project
**PUT**&nbsp;&nbsp;`/api/v1/projects/10`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=edited+name

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "user_id": 8,
              "id": 10,
              "name": "edited name",
              "created_at": "2019-02-19T05:40:11.790Z",
              "updated_at": "2019-02-19T05:40:11.802Z"
            }

### Get project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `11` (number, required)

+ Request get existed project
**GET**&nbsp;&nbsp;`/api/v1/projects/11?name=Project 12`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 11,
              "name": "Project 11",
              "created_at": "2019-02-19T05:40:11.817Z",
              "updated_at": "2019-02-19T05:40:11.817Z",
              "user_id": 9
            }

### Delete project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `12` (number, required)

+ Request delete project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/12`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json

# Group Tasks


## Tasks [/tasks]


### Get tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `13` (number, required)

+ Request gets list of tasks
**GET**&nbsp;&nbsp;`/api/v1/projects/13/tasks`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 6,
                "name": "Task 6",
                "completed": false,
                "position": 1,
                "deadline": null,
                "created_at": "2019-02-19T05:40:11.867Z",
                "updated_at": "2019-02-19T05:40:11.867Z",
                "project_id": 13
              },
              {
                "id": 7,
                "name": "Task 7",
                "completed": false,
                "position": 2,
                "deadline": null,
                "created_at": "2019-02-19T05:40:11.872Z",
                "updated_at": "2019-02-19T05:40:11.872Z",
                "project_id": 13
              },
              {
                "id": 8,
                "name": "Task 8",
                "completed": false,
                "position": 3,
                "deadline": null,
                "created_at": "2019-02-19T05:40:11.878Z",
                "updated_at": "2019-02-19T05:40:11.878Z",
                "project_id": 13
              }
            ]

### Create task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `14` (number, required)

+ Request creates new task
**POST**&nbsp;&nbsp;`/api/v1/projects/14/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Task+9&completed=false

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 9,
              "name": "Task 9",
              "completed": false,
              "position": 1,
              "deadline": null,
              "created_at": "2019-02-19T05:40:11.919Z",
              "updated_at": "2019-02-19T05:40:11.919Z",
              "project_id": 14
            }

### Edit task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `10` (number, required)

+ Request update tasks
**PUT**&nbsp;&nbsp;`/api/v1/tasks/10`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=edited+name&completed=false

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 10,
              "project_id": 15,
              "deadline": null,
              "name": "edited name",
              "completed": false,
              "position": 1,
              "created_at": "2019-02-19T05:40:11.939Z",
              "updated_at": "2019-02-19T05:40:11.951Z"
            }

### Get task [GET /api/v1/tasks/{id}]

+ Parameters
    + id: `11` (number, required)

+ Request get task
**GET**&nbsp;&nbsp;`/api/v1/tasks/11?completed=false&name=Task 12`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 11,
              "name": "Task 11",
              "completed": false,
              "position": 1,
              "deadline": null,
              "created_at": "2019-02-19T05:40:11.970Z",
              "updated_at": "2019-02-19T05:40:11.970Z",
              "project_id": 16
            }

### Delete task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `12` (number, required)

+ Request delete tasks
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/12`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json

# Group Users


## Users [/api/v1/auth/users]


### Create user [POST /api/v1/auth/users]


+ Request register new user
**POST**&nbsp;&nbsp;`/api/v1/auth/users`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=username16&password=password&password_confirmation=password

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 16,
              "username": "username16",
              "password_digest": "$2a$04$RcGpA9vwC/kFtkAmxkbUDuYAs70lD5WxxYPSkhgRE0mde30/H.h3i",
              "created_at": "2019-02-19T05:40:12.029Z",
              "updated_at": "2019-02-19T05:40:12.029Z"
            }

### Login user [POST /api/v1/auth/login]


+ Request log in user
**POST**&nbsp;&nbsp;`/api/v1/auth/login`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=username17&password=password

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiZXhwIjoxNTUwNjQxMjEyfQ.AEwflUjcEePiuYNn365Ylb3vLNHvMU_vkVLHbGCYjT0",
              "exp": "02-20-2019 07:40",
              "username": "username17",
              "message": "You are successfully logged in!"
            }
