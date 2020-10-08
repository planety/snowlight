import starlight

proc hello(ctx: Context) {.async, get("/hello").} =
  resp "Hello world"

app.run()
