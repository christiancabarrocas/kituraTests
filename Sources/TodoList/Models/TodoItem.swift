struct TodoItem {
    var id:String = ""
    var order:Int = 0
    var title:String = ""
    var completed:Bool = false
    var url:String = ""
    
    func serialize() -> JSONDictionary {
        var result = JSONDictionary()
        result["id"] = id
        result["order"] = order
        result["title"] = title
        result["completed"] = completed
        result["url"] = url
        return result
    }
}