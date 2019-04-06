import UIKit


class User {
    static let shared = User()
    //  private init() {}
    var friends: [Friends] = []
    var blocks: [Friends] = []
}



struct Friends {
    let name: String
}


struct FriendList {
    mutating func addFriend(name: String, class1: User) {
        //    let user = User()
        let friend = Friends(name: name)
        class1.friends.append(friend)
        // "원빈", "장동건", "정우성" 3명을 친구로 추가했을 때
        // 최종적으로 user.friends 에 들어있는 friend 의 숫자는?
        
        //    let user = User.shared
        //    let friend = Friends(name: name)
        //    user.friends.append(friend)
        
        // 위에꺼는 User() 클래스를 새로 만드는데 addFriend 함수가 종료되면 같이 사라지기 때문에, 싱글톤에 넣어주면 사라지지 않는다.
        // 싱글톤으로 만든 user는 힙 에 남아있다. 이유는 데이터영역의 스태틱 shared가 계속 잡아둠.
    }
}



struct BlockList {
    mutating func blockFriend(name: String, class1: User) {
        let friend = Friends(name: name)
        if let index = class1.friends.firstIndex(where: { $0.name == friend.name }) {
            class1.friends.remove(at: index)
        }
        if !class1.blocks.contains(where: { $0.name == friend.name }) {
            class1.blocks.append(friend)
        }
    }
}

let test: User = User()
var friendList = FriendList()
friendList.addFriend(name: "원빈", class1: test)
friendList.addFriend(name: "장동건", class1: test)
friendList.addFriend(name: "정우성", class1: test)
User.shared.friends
test.friends


var blockList = BlockList()
blockList.blockFriend(name: "원빈", class1: test)
User.shared.friends
User.shared.blocks
test.friends

let userInit = User()
userInit.friends
userInit.blocks

let userShared = User.shared
userShared.friends
userShared.blocks

