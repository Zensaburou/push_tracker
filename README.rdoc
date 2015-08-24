## Endpoints:

* POST `/:name`
  * Creates a new user

* POST `/:user_name/:category`
  * Creates a new category

* POST `/:user_name/:category_name/create`
  * Creates a new event. Responds to JSON formatted according to the [Github-Services](https://github.com/github/github-services) webhook handlers.

  Example:
    ```
    payload={
      "events":[
        {
          "message": "foo"
        },
        {
          "message": "bar"
        }
      ]
    }
    ```
