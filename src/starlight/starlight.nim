import std/macros

import prologue

export prologue except addRoute, head, get, put, post, delete, traces, options, connect, patch, all


var app* = newApp(newSettings())


macro route*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`)

macro route*(path: string, httpMethod: HttpMethod, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`)

macro route*(path: string, httpMethod: HttpMethod, middlewares: openArray[HandlerAsync], 
             body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, middlewares = `middlewares`)

macro route*(path: string, httpMethod: HttpMethod,
             middlewares: openArray[HandlerAsync], name: string,
             body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, `name`, `middlewares`)

macro route*(path: string, httpMethod: HttpMethod,
            middlewares: openArray[HandlerAsync], name: string,
            settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, `name`, `middlewares`, `settings`)

macro route*(path: string, httpMethod: openArray[HttpMethod], body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`)

macro route*(path: string, httpMethod: openArray[HttpMethod], middlewares: openArray[HandlerAsync], 
             body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, middlewares = `middlewares`)

macro route*(path: string, httpMethod: openArray[HttpMethod],
             middlewares: openArray[HandlerAsync], name: string,
             body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, `name`, `middlewares`)

macro route*(path: string, httpMethod: openArray[HttpMethod],
            middlewares: openArray[HandlerAsync], name: string,
            settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, `name`, `middlewares`, `settings`)

macro get*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.get(`path`, `handler`)

macro get*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.get(`path`, `handler`, middlewares = `middlewares`)

macro get*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.get(`path`, `handler`, get, `middlewares`)

macro get*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.get(`path`, `handler`, get, `middlewares`, `settings`)

macro post*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.post(`path`, `handler`)

macro post*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.post(`path`, `handler`, middlewares = `middlewares`)

macro post*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.post(`path`, `handler`, post, `middlewares`)

macro post*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.post(`path`, `handler`, post, `middlewares`, `settings`)

macro put*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.put(`path`, `handler`)

macro put*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.put(`path`, `handler`, middlewares = `middlewares`)

macro put*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.put(`path`, `handler`, put, `middlewares`)

macro put*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.put(`path`, `handler`, put, `middlewares`, `settings`)

macro delete*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.delete(`path`, `handler`)

macro delete*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.delete(`path`, `handler`, middlewares = `middlewares`)

macro delete*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.delete(`path`, `handler`, delete, `middlewares`)

macro delete*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.delete(`path`, `handler`, delete, `middlewares`, `settings`)

macro trace*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.trace(`path`, `handler`)

macro trace*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.trace(`path`, `handler`, middlewares = `middlewares`)

macro trace*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.trace(`path`, `handler`, trace, `middlewares`)

macro trace*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.trace(`path`, `handler`, trace, `middlewares`, `settings`)

macro options*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.options(`path`, `handler`)

macro options*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.options(`path`, `handler`, middlewares = `middlewares`)

macro options*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.options(`path`, `handler`, options, `middlewares`)

macro options*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.options(`path`, `handler`, options, `middlewares`, `settings`)

macro connect*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.connect(`path`, `handler`)

macro connect*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.connect(`path`, `handler`, middlewares = `middlewares`)

macro connect*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.connect(`path`, `handler`, connect, `middlewares`)

macro connect*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.connect(`path`, `handler`, connect, `middlewares`, `settings`)

macro patch*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.patch(`path`, `handler`)

macro patch*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.patch(`path`, `handler`, middlewares = `middlewares`)

macro patch*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.patch(`path`, `handler`, patch, `middlewares`)

macro patch*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.patch(`path`, `handler`, patch, `middlewares`, `settings`)

macro all*(path: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.all(`path`, `handler`)

macro all*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.all(`path`, `handler`, middlewares = `middlewares`)

macro all*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = body[0]

  result = quote do:
    app.all(`path`, `handler`, all, `middlewares`)

macro all*(path: string, middlewares: openArray[HandlerAsync], 
            name: string, settings: LocalSettings,
            body: untyped) =
  let handler = body[0]

  result = quote do:
    app.all(`path`, `handler`, all, `middlewares`, `settings`)

proc registerApp*(
  app: Prologue,
  settings: Settings, 
  middlewares: openArray[HandlerAsync] = @[],
  startup: openArray[Event] = @[], 
  shutdown: openArray[Event] = @[],
  errorHandlerTable = newErrorHandlerTable({Http404: default404Handler, Http500: default500Handler}),
  appData = newStringTable(mode = modeCaseSensitive)
) =
  app.gscope.settings = settings
  app.middlewares = @middlewares
  app.startup = @startup
  app.shutdown = @shutdown
  app.errorHandlerTable = errorHandlerTable
  app.gscope.appData = appData
