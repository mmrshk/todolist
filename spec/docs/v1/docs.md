

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
                "id": 1,
                "name": "Project 1",
                "created_at": "2019-02-19T05:20:27.820Z",
                "updated_at": "2019-02-19T05:20:27.820Z",
                "user_id": 1
              },
              {
                "id": 2,
                "name": "Project 2",
                "created_at": "2019-02-19T05:20:27.826Z",
                "updated_at": "2019-02-19T05:20:27.826Z",
                "user_id": 1
              },
              {
                "id": 3,
                "name": "Project 3",
                "created_at": "2019-02-19T05:20:27.833Z",
                "updated_at": "2019-02-19T05:20:27.833Z",
                "user_id": 1
              }
            ]

### Create project [POST /api/v1/projects]


+ Request creates new project
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Project+4

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 4,
              "name": "Project 4",
              "created_at": "2019-02-19T05:20:27.890Z",
              "updated_at": "2019-02-19T05:20:27.890Z",
              "user_id": 2
            }

### Edit project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request edit existed project
**PUT**&nbsp;&nbsp;`/api/v1/projects/5`

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
              "user_id": 3,
              "id": 5,
              "name": "edited name",
              "created_at": "2019-02-19T05:20:27.905Z",
              "updated_at": "2019-02-19T05:20:27.918Z"
            }

### Delete project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `6` (number, required)

+ Request delete project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/6`

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
    + project_id: `7` (number, required)

+ Request gets list of tasks
**GET**&nbsp;&nbsp;`/api/v1/projects/7/tasks`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "name": "Task 1",
                "completed": false,
                "position": 1,
                "deadline": null,
                "created_at": "2019-02-19T05:20:27.982Z",
                "updated_at": "2019-02-19T05:20:27.982Z",
                "project_id": 7
              },
              {
                "id": 2,
                "name": "Task 2",
                "completed": false,
                "position": 2,
                "deadline": null,
                "created_at": "2019-02-19T05:20:27.988Z",
                "updated_at": "2019-02-19T05:20:27.988Z",
                "project_id": 7
              },
              {
                "id": 3,
                "name": "Task 3",
                "completed": false,
                "position": 3,
                "deadline": null,
                "created_at": "2019-02-19T05:20:27.993Z",
                "updated_at": "2019-02-19T05:20:27.993Z",
                "project_id": 7
              }
            ]

### Create task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `8` (number, required)

+ Request creates new task
**POST**&nbsp;&nbsp;`/api/v1/projects/8/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=Task+4&completed=false

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 4,
              "name": "Task 4",
              "completed": false,
              "position": 1,
              "deadline": null,
              "created_at": "2019-02-19T05:20:28.043Z",
              "updated_at": "2019-02-19T05:20:28.043Z",
              "project_id": 8
            }

### Edit task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request update tasks
**PUT**&nbsp;&nbsp;`/api/v1/tasks/5`

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
              "id": 5,
              "project_id": 9,
              "deadline": null,
              "name": "edited name",
              "completed": false,
              "position": 1,
              "created_at": "2019-02-19T05:20:28.067Z",
              "updated_at": "2019-02-19T05:20:28.082Z"
            }

### Delete task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `6` (number, required)

+ Request delete tasks
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/6`

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

            username=username9&password=password&password_confirmation=password

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 9,
              "username": "username9",
              "password_digest": "$2a$04$byxRJtx5m/pssnvholpAx.X.pjPE4pDGUq/H3PCIzNgHDPUyrA2hO",
              "created_at": "2019-02-19T05:20:28.195Z",
              "updated_at": "2019-02-19T05:20:28.195Z"
            }

### Login user [POST /api/v1/auth/login]


+ Request log in user
**POST**&nbsp;&nbsp;`/api/v1/auth/login`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=username10&password=password

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMCwiZXhwIjoxNTUwNjQwMDI4fQ.d3ZP14uizqAy0lyFyt_LzsvHA-vzIaXEk5gw_tTABWo",
              "exp": "02-20-2019 07:20",
              "username": "username10",
              "message": "You are successfully logged in!"
            }
