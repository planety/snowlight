import std/macros

import prologue
export prologue


template setupRoute(body: NimNode): NimNode =
  var `handler`: NimNode
  if body[3].kind == nnkHiddenStdConv:
    `handler` = body[3][1]
  else:
    `handler` = body[0]
  `handler`

macro route*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    app.addRoute(`path`, `handler`)

macro route*(app: Prologue, path: string, httpMethod: HttpMethod, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`)

macro route*(app: Prologue, path: string, httpMethod: HttpMethod, middlewares: openArray[HandlerAsync], 
             body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, middlewares = `middlewares`)

macro route*(app: Prologue, path: string, httpMethod: HttpMethod,
             middlewares: openArray[HandlerAsync], name: string,
             body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, `name`, `middlewares`)

macro route*(app: Prologue, path: string, httpMethod: openArray[HttpMethod], body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`)

macro route*(app: Prologue, path: string, httpMethod: openArray[HttpMethod], middlewares: openArray[HandlerAsync], 
             body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, middlewares = `middlewares`)

macro route*(app: Prologue, path: string, httpMethod: openArray[HttpMethod],
             middlewares: openArray[HandlerAsync], name: string,
             body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    app.addRoute(`path`, `handler`, `httpMethod`, `name`, `middlewares`)

# macro get*(app: Prologue, path: string, body: untyped) =  
#   let `handler` = body[0].name

#   result = quote do:
#     prologue.get(app, path, `handler`)

macro get*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.get(app, `path`, `handler`)

macro get*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
           body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.get(app, `path`, `handler`, middlewares = `middlewares`)

macro get*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
           name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.get(app, `path`, `handler`, `name`, `middlewares`)

macro post*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.post(app, `path`, `handler`)

macro post*(path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.post(app, path, `handler`, middlewares = middlewares)

macro post*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.post(app, `path`, `handler`, `name`, `middlewares`)

macro put*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.put(app, path, `handler`)

macro put*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.put(app, `path`, `handler`, middlewares = `middlewares`)

macro put*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.put(app, `path`, `handler`, `name`, `middlewares`)

macro delete*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.delete(app, `path`, `handler`)

macro delete*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.delete(app, `path`, `handler`, middlewares = `middlewares`)

macro delete*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.delete(app, `path`, `handler`, `name`, `middlewares`)

macro trace*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.trace(app, `path`, `handler`)

macro trace*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.trace(app, `path`, `handler`, middlewares = `middlewares`)

macro trace*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.trace(app, `path`, `handler`, `name`, `middlewares`)

macro options*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.options(app, `path`, `handler`)

macro options*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.options(app, `path`, `handler`, middlewares = `middlewares`)

macro options*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.options(app, `path`, `handler`, `name`, `middlewares`)

macro connect*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.connect(app, `path`, `handler`)

macro connect*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.connect(app, `path`, `handler`, middlewares = `middlewares`)

macro connect*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.connect(app, `path`, `handler`, `name`, `middlewares`)

macro patch*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.patch(app, `path`, `handler`)

macro patch*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.patch(app, `path`, `handler`, middlewares = `middlewares`)

macro patch*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.patch(app, `path`, `handler`, `name`, `middlewares`)

macro all*(app: Prologue, path: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.all(app, `path`, `handler`)

macro all*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.all(app, `path`, `handler`, middlewares = `middlewares`)

macro all*(app: Prologue, path: string, middlewares: openArray[HandlerAsync], 
            name: string, body: untyped) =
  let handler = setupRoute(body)

  result = quote do:
    prologue.all(app, `path`, `handler`, `name`, `middlewares`)

# Group API

# macro route*(group: Group, path: string, body: untyped) =
#   result = quote do:
#     let (path, allMiddlewares) = getAllInfos(`group`, `path`, @[])
#     route(group.app, `path`, `body`)

# macro route*(group: Group, path: string, httpMethod: HttpMethod, body: untyped) =
#   result = quote do:
#     let (path, middlewares) = getAllInfos(`group`, `path`, @[])
#     route(group.app, path, `body`, `httpMethod`)

# macro route*(group: Group, path: string, httpMethod: HttpMethod, middlewares: openArray[HandlerAsync], 
#              body: untyped) =
#   result = quote do:
#     let (path, middlewares) = getAllInfos(`group`, `path`, @[])
#     route(group.app, path, `body`, `httpMethod`, middlewares)

# macro route*(group: Group, path: string, httpMethod: HttpMethod,
#              middlewares: openArray[HandlerAsync], name: string,
#              body: untyped) =
#   result = quote do:
#     let (path, middlewares) = getAllInfos(`group`, `path`, @[])
#     route(group.app, `path`, `body`)

# macro route*(group: Group, path: string, httpMethod: openArray[HttpMethod], body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     app.addRoute(path, `handler`, `httpMethod`)

# macro route*(group: Group, path: string, httpMethod: openArray[HttpMethod], middlewares: openArray[HandlerAsync], 
#              body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     app.addRoute(path, `handler`, `httpMethod`, middlewares = `middlewares`)

# macro route*(group: Group, path: string, httpMethod: openArray[HttpMethod],
#              middlewares: openArray[HandlerAsync], name: string,
#              body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     app.addRoute(path, `handler`, `httpMethod`, `name`, `middlewares`)

# macro get*(group: Group, path: string, body: untyped) =  
#   let `handler` = body[0].name

#   result = quote do:
#     prologue.get(app, path, `handler`)

# macro get*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#            body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.get(app, path, `handler`, middlewares = middlewares)

# macro get*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#            name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.get(app, path, `handler`, name, middlewares)

# macro post*(group: Group, path: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.post(app, `path`, `handler`)

# macro post*(group: Group,path: string, middlewares: openArray[HandlerAsync], 
#             body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.post(app, `path`, `handler`, middlewares = `middlewares`)

# macro post*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.post(app, path, `handler`, name, middlewares)

# macro put*(group: Group, path: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.put(app, path, `handler`)

# macro put*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.put(app, path, `handler`, middlewares = middlewares)

# macro put*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.put(app, path, `handler`, name, middlewares)

# macro delete*(group: Group, path: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.delete(app, path, `handler`)

# macro delete*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.delete(app, path, `handler`, middlewares = middlewares)

# macro delete*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.delete(app, path, `handler`, name, middlewares)

# macro trace*(group: Group, path: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.trace(app, path, `handler`)

# macro trace*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.trace(app, path, `handler`, middlewares = middlewares)

# macro trace*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.trace(app, path, `handler`, name, middlewares)

# macro options*(group: Group, path: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.options(app, path, `handler`)

# macro options*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.options(app, path, `handler`, middlewares = middlewares)

# macro options*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.options(app, path, `handler`, name, middlewares)

# macro connect*(group: Group, path: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.connect(app, path, `handler`)

# macro connect*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.connect(app, path, `handler`, middlewares = middlewares)

# macro connect*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.connect(app, path, `handler`, name, middlewares)

# macro patch*(group: Group, path: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.patch(app, path, `handler`)

# macro patch*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.patch(app, path, `handler`, middlewares = middlewares)

# macro patch*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.patch(app, path, `handler`, name, middlewares)

# macro all*(group: Group, path: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.all(app, path, `handler`)

# macro all*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.all(app, path, `handler`, middlewares = middlewares)

# macro all*(group: Group, path: string, middlewares: openArray[HandlerAsync], 
#             name: string, body: untyped) =
#   let handler = setupRoute(body)

#   result = quote do:
#     prologue.all(app, path, `handler`, name, middlewares)
