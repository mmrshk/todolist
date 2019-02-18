

# Group Projects


## Projects [/projects]


### Get projects [GET /api/v1/projects]


+ Request gets projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Nil JSON web token"
            }

# Group Users


## Users [/api/v1/auth/users]


### Create user [POST /api/v1/auth/users]


+ Request register new user
**POST**&nbsp;&nbsp;`/api/v1/auth/users`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=username1&password=password&password_confirmation=password

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 1,
              "username": "username1",
              "password_digest": "$2a$04$5ZzhgOtPnG4PZoD6hxAlb.c.M2AyzKm4IV75jomkvWALAUYH3yoQ.",
              "created_at": "2019-02-18T17:38:57.788Z",
              "updated_at": "2019-02-18T17:38:57.788Z"
            }

### Login user [POST /api/v1/auth/login]


+ Request log in user
**POST**&nbsp;&nbsp;`/api/v1/auth/login`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=username2&password=password

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NTA1OTc5Mzd9.1c15QjU7gD6PP1J6M5etwfGsuI551g2k-U3ntSBPzu4",
              "exp": "02-19-2019 19:38",
              "username": "username2",
              "message": "You are successfully logged in!"
            }
