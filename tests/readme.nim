import starlight
import prologue/middlewares/utils

proc hello(ctx: Context) {.async,
  get("/hello", [debugRequestMiddleware()])
  .} =
  resp "Hello world"

app.run()
