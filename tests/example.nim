import starlight except loginPage
import logging
import utils

proc hello*(ctx: Context) {.async, 
  get("/")
  } =
  logging.debug "hello"
  resp "<h1>Hello, Prologue!</h1>"

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
