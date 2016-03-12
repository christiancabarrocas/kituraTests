protocol TodoCollection {
    var count:Int {get}
    func clear()
    func getAll() -> [TodoItem]
    static func serialize(items:[TodoItem] -> [JSONDictionary])
    
    func add(title:String, order:Int, completed:Bool) -> TodoItem
    func update(id:String, title:String?, order:Int?, completed:Bool?) -> TodoItem
    func delete(id:String)
}