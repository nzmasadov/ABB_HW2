import UIKit
import Foundation

// First
class LeakClass {
    var value: (() -> Void)!
}

do {
    let test = LeakClass()
    test.value = {
    }
}

do {
    let test = LeakClass()
    test.value = { [weak test] in
    }
}


// Second


public class Node<T> {
  var value: T
  var next: Node?
  weak var previous: Node?

  public init(value: T) {
    self.value = value
  }
}

public class LinkedList {
    fileprivate var head: Node<Any>?
    private var tail: Node<Any>?

  public var isEmpty: Bool {
    return head == nil
  }

    public var first: Node<Any>? {
    return head
  }

    public var last: Node<Any>? {
    return tail
  }
    
    public func append(value: Any) {
      
      let newNode = Node(value: value)
      
      if let tailNode = tail {
        newNode.previous = tailNode
        tailNode.next = newNode
      }
      else {
        head = newNode
      }
      tail = newNode
    }
    
    public func reverseList() -> Any {
        if let val = self.head?.value as? (any Collection) {
            let arr = val
            return arr.reversed()
        }
        return " "
    }
    
    public func getElementByID(index: Int) -> Any {
        if let val = self.head?.value as? Array<Any>, val.count >= index + 1 {
                return val[index]
            }
        return "Incorrect index"
    }
}

var list = LinkedList()
list.append(value: [1,2,3,4,5])

print(list.reverseList())
print(list.getElementByID(index: 4))
