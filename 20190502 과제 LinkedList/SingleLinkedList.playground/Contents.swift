import UIKit

protocol LinkedListStack {
    var size: Int { get }     // 전체 개수
    var isEmpty: Bool { get } // 노드가 있는지 여부
    var head: Node? { get }   // 링크드 리스트 시작 지점
    func push(node: Node)     // 데이터 삽입
    func pop() -> String?     // 데이터 추출
    func peek() -> String?    // 마지막 데이터 확인
}
class Node {
    var prev: Node?
    let value: String
    var next: Node?
    
    init(value: String) {
        self.value = value
    }
}
class SingleLinkedList: LinkedListStack {
    var size: Int = 0
    
    var head: Node? = nil
    
    var isEmpty: Bool { return head == nil }
    
    var lastNode: Node? {
        guard var node = head else { return nil }
        while let nextNode = node.next {
            node = nextNode
        }
        return node
    }
    
    func push(node newNode: Node) {
        size += 1
        guard let node = lastNode else { return head = newNode }
        node.next = newNode
    }
    
    func insert(_ idx: Int, node newNode: Node) {
        guard var node = head  else { return }
        for _ in 1..<idx {
            guard let nextNode = node.next else { return }
            node = nextNode
        }
        newNode.next = node.next
        node.next = newNode
        size += 1
    }
    
    func pop() -> String? {
        size = size > 0 ? size - 1 : 0
        guard var node = head  else { return nil }
        guard node.next != nil else {
            head = nil
            return node.value
        }
        
        while let nextNode = node.next {
            guard nextNode.next != nil else {
                node.next = nil
                return nextNode.value
            }
            node = nextNode
        }
        return node.value
    }
    
    func peek() -> String? {
        guard let node = lastNode else { return nil }
        return node.value
    }
}

/***************************************************
 더블 링크드 리스트
 
 [ 프로퍼티 ]
 private var head: Node?
 private weak var tail: Node?
 var isEmpty: Bool
 var first: Node?
 var last: Node?
 var count: Int
 
 [ 메서드 ]
 scanValues()  - 현재 저장된 모든 노드의 값 출력
 removeAll()   - 모든 노드 제거
 removeNode(by value: String) -> Bool      - 밸류를 이용해 노드 제거 후 성공 여부
 removeNode(at index: Int) -> String?      - 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
 node(by value: String) -> Node?           - 지정한 값을 지닌 노드를 찾아 반환
 insert(node newNode: Node, at index: Int) - 특정 위치에 노드 삽입
 append(node: Node)                        - 마지막 부분에 노드 삽입
 ***************************************************/

protocol Property {
    var isEmpty: Bool {get}
    var first: Node? {get}
    var count: Int {get}
    func scanValues()                              //- 현재 저장된 모든 노드의 값 출력
    func removeAll()                               //- 모든 노드 제거
    func removeNode(by value: String) -> Bool      //- 밸류를 이용해 노드 제거 후 성공 여부
    func removeNode(at index: Int) -> String?      //- 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
    func node(by value: String) -> Node?           //- 지정한 값을 지닌 노드를 찾아 반환
    func insert(node newNode: Node, at index: Int) //- 특정 위치에 노드 삽입
    func append(newNode: Node)
}

class DualLinked: Property {
    var isEmpty: Bool { return first == nil }
    private var head: Node?
//    private weak var tail: Node?
    var first: Node?
    var count: Int = 0
    var last: Node? {
        guard var node = first else { return nil }
        while let nextNode = node.next {
            node = nextNode
        }
        return node
    }
    
    func scanValues() {
        guard var node = first else { print("nil")
            return }
        print(node.value, terminator: " ")
        while let nextNode = node.next {
            print(nextNode.value, terminator: " ")
            node = nextNode
        }
    }
    
    func removeAll() {
        guard var node = last else {
            return }
        while let prevNode = node.prev {
            guard node.prev == nil else {
                head?.next = nil
                first = nil
                return
            }
            node.next = nil
            prevNode.next = nil
            node.prev = nil
            node = prevNode
        }
        head?.next = nil
        first = nil
        count = 0
    }
    
    func removeNode(by value: String) -> Bool {
        guard var node = first else { return true }
        while let nextNode = node.next {
            if node.value == value {
                count -= 1
                node.prev?.next = nextNode
                nextNode.prev = node.prev
                break
            }
            node = nextNode
        }
        guard node.next == nil else {
            return true
        }
        return false
    }
    
    func removeNode(at index: Int) -> String? {
        var text: String?
        guard var node = first  else { return text }
        if index == 1 {
            first = node.next
            head?.next = node.next
            text = node.value
            node.next?.prev = nil
            node.next = nil
            count -= 1
            return text
        }
        for _ in 1..<index {
            guard let nextNode = node.next else { return text }
            node = nextNode
        }
        text = node.value
        node.prev?.next = node.next
        node.next?.prev = node.prev
        count -= 1
        return text
    }
    
    func node(by value: String) -> Node? {
        guard var node = first else { return nil }
        while let nextNode = node.next {
            if node.value == value {
                break
            }
            node = nextNode
        }
        return node.value == value ? node : nil
    }
    
    func insert(node newNode: Node, at index: Int) {
        guard var node = first  else { return }
        if index == 1 {
            count += 1
            newNode.next = node
            newNode.prev = nil
            node.prev = newNode
            first = newNode
            head?.next = newNode
            return
        }
        for _ in 1..<index {
            guard let nextNode = node.next else {
                append(newNode: newNode)
                return
            }
            node = nextNode
        }
        count += 1
        newNode.next = node
        newNode.prev = node.prev
        node.prev?.next = newNode
        node.prev = newNode
    }
    
    func append(newNode: Node) {
        count += 1
        guard let node = last else {
            head?.next = newNode
            return first = newNode
        }
        node.next = newNode
        newNode.prev = node
    }
}

let dualLinked = DualLinked()
dualLinked.append(newNode: Node(value: "a"))
dualLinked.append(newNode: Node(value: "b"))
dualLinked.append(newNode: Node(value: "c"))
dualLinked.append(newNode: Node(value: "d"))
dualLinked.append(newNode: Node(value: "e"))
dualLinked.append(newNode: Node(value: "f"))
dualLinked.append(newNode: Node(value: "g"))
dualLinked.insert(node: Node(value: "3"), at: 1)
dualLinked.insert(node: Node(value: "4"), at: 3)
dualLinked.insert(node: Node(value: "5"), at: 11)
dualLinked.scanValues()
print("")
dualLinked.append(newNode: Node(value: "last"))
dualLinked.scanValues()
print("")
dualLinked.removeNode(at: 5)
dualLinked.scanValues()
print("")
dualLinked.node(by: "c")?.value
dualLinked.node(by: "b")?.value
dualLinked.removeNode(by: "b")
dualLinked.scanValues()
print("")
dualLinked.count
dualLinked.first?.value
dualLinked.last?.value
dualLinked.isEmpty
dualLinked.removeAll()
print("after removeAll")
dualLinked.scanValues()
dualLinked.isEmpty







//let linkedList = SingleLinkedList()
//linkedList.isEmpty
//
//linkedList.push(node: Node(value: "A"))
//linkedList.push(node: Node(value: "B"))
//linkedList.peek()
//linkedList.size
//
//linkedList.isEmpty
//linkedList.pop()
//linkedList.push(node: Node(value: "C"))
//linkedList.size
//
//linkedList.pop()
//linkedList.pop()
//linkedList.pop()
//linkedList.size
//linkedList.isEmpty
//
//linkedList.push(node: Node(value: "a"))
//linkedList.push(node: Node(value: "b"))
//linkedList.push(node: Node(value: "c"))
//linkedList.push(node: Node(value: "d"))
//linkedList.push(node: Node(value: "e"))
//linkedList.peek()
//linkedList.size
//linkedList.insert(3, node: Node(value: "1"))
//linkedList.size
//linkedList.pop()
//linkedList.pop()
//linkedList.pop()
//linkedList.pop()
//linkedList.pop()
//linkedList.pop()
//linkedList.pop()
//linkedList.isEmpty
