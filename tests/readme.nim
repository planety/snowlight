import starlight


var app = newApp(newSettings())

proc hello(ctx: Context) {.async, get(app, "/hello").} =
  resp "Hello world"

app.run()
