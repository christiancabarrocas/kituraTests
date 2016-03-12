import KituraSys
import LoggerAPI
import SwiftyJSON
import Foundation

class TodoCollectionArray: TodoCollection {

    private var _collection = [String:TodoItem]()
    
    let writingQueue = Queue(type: .SERIAL, label:"Writing Queue")
    
    func add(title:String, order:Int, completed:Bool) -> TodoItem {
        
        var original = String(self.idCounter)
        let newItem = TodoItem(id:original, order:order, title:title, completed:false, url: self.baseURL + "/" + original)
        
        writingQueue.queueSync() {
            self.idCounter += 1
            self._collection[original] = newItem
        }
        
        Log.info("Added \(title)")
        return newItem
    }
    
    func delete(id:String) {
        writingQueue.queueSync() {
            self._collection.removeValueForKey(id)
        }
    }
    
    static func serialize(items:[TodoItem] -> [JSONDicitonary]) {
        return items.map {$0.serialize()}
    }
}
