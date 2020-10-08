# starlight
Flask like web framework written in Nim.

## Simple example

```nim
import starlight
import prologue/middlewares/utils

proc hello(ctx: Context) {.async,
  get("/hello", [debugRequestMiddleware()])
  } =
  resp "Hello world"

app.run()
```


## Complex example

```nim
import starlight except loginPage
import logging
import htmlgen


func loginPage*(): string =
  return html(form(action = "/login",
      `method` = "post",
      "Username: ", input(name = "username", `type` = "text"),
      "Password: ", input(name = "password", `type` = "password"),
      input(value = "login", `type` = "submit")),
      xmlns = "http://www.w3.org/1999/xhtml")

proc home*(ctx: Context) {.async, route(
  "/home",
  HttpGet)
  } =
  logging.debug "home"
  resp "<h1>Home</h1>"

proc helloName*(ctx: Context) {.async, 
  get("/hello/{name}")
  } =
  logging.debug "helloname"
  resp "<h1>Hello, " & ctx.getPathParams("name", "Prologue!") & "</h1>"

proc redirectHome*(ctx: Context) {.async,
  route("/redirect")
  } =
  logging.debug "redirectHome"
  resp redirect("/home")

proc loginGet*(ctx: Context) {.async, 
  route("/loginget")
  } =
  logging.debug "login get"
  resp loginGetPage()

proc doLoginGet*(ctx: Context) {.async, 
  route("/loginpage", [HttpGet, HttpPost])
  } =
  logging.debug "doLogin get"
  resp redirect("/hello/Nim")

proc login*(ctx: Context) {.async, 
  post("/login")
  } =
  logging.debug "log post"
  resp loginPage()

proc doLogin*(ctx: Context) {.async, 
  post("/login")
  } =
  logging.debug "doLogin post"
  resp redirect("/hello/Nim")


let settings = newSettings(appName = "Prologue", debug = false, port = Port(8080))
app.registerApp(settings)
app.run()
```
