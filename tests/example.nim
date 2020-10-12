import ../src/starlight except loginPage
import logging
import utils


var app = newApp(newSettings())

proc hello*(ctx: Context) {.async,
  get(app, "/"),
  post(app, "/"),
  get(app, "/hello")
  .} =
  logging.debug "hello"
  resp "<h1>Hello, Prologue!</h1>"

proc home*(ctx: Context) {.async, route(app, "/home", HttpGet).} =
  logging.debug "home"
  resp "<h1>Home</h1>"

proc helloName*(ctx: Context) {.async, get(app, "/hello/{name}").} =
  logging.debug "helloname"
  resp "<h1>Hello, " & ctx.getPathParams("name", "Prologue!") & "</h1>"

proc redirectHome*(ctx: Context) {.async, route(app, "/redirect").} =
  logging.debug "redirectHome"
  resp redirect("/home")

proc loginGet*(ctx: Context) {.async, route(app, "/loginget").} =
  logging.debug "login get"
  resp loginGetPage()

proc doLoginGet*(ctx: Context) {.async, route(app, "/loginpage", [HttpGet, HttpPost]).} =
  logging.debug "doLogin get"
  resp redirect("/hello/Nim")

proc login*(ctx: Context) {.async, get(app, "/login").} =
  logging.debug "log post"
  resp loginPage()

proc doLogin*(ctx: Context) {.async, post(app, "/login").} =
  logging.debug "doLogin post"
  resp redirect("/hello/Nim")


app.run()
