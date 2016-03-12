import KituraRouter
import KituraNet
import LoggerAPI
import SwiftyJSON


class AllRemoteOriginMiddleware: RouterMiddleware {
    func handle(request: RouterRequest, response: RouterResponse, next: () -> Void) {
        response.setHeader("Access-Control-Allow-Origin", value: "*")
        response.setHeader("Access-Control-Allow-Headers", value: "accept, content-type")
        response.setHeader("Access-Control-Allow-Methods", value: "GET,HEAD,POST,DELETE,OPTIONS,PUT")
        next()
    }
}

router.use("/*", middleware: AllRemoteOriginMiddleware())
setupRoutes(router, todos:todos)