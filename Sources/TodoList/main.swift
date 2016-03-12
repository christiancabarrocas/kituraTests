import KituraRouter
import KituraNet
import KituraSys
import LoggerAPI
import SwiftyJSON

let router = Router()
let todos: TodoCollection = TodoCollectionArray()

router.use("/*", middleware:BodyParser())
router.get("/") {
    request, response, next in
    let json = JSON(TodoCollectionArray.serialize(todos.getAll()))
    reponse.status(HttpStatusCode.OK).sendJson(json)
    next()
}

router.post("/") {
    request, response, next in
    if let body = request.body {
        if let json = body.asJson() {
            let title = json["title"].stringValue
            let order = json["order"].intValue
            let completed = json["completed"].boolValue
            
            let newItem = todos.add(title, order:order, completed:completed)
            let result = JSON(newItem.serialize())
            
            response.status(HttpStatusCode.OK).sendJson(result)
        }
    } else {
        Log.warning("No body")
        response.status(HttpStatusCode.BAD_REQUEST)
    }
}


let server = HttpServer.listen(8090, delegate: router)
Server.run()