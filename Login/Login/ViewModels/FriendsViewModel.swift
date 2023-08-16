import Foundation

struct Friend: Identifiable, Equatable{
    var id:UUID = UUID()
    var name : String
    var avatar : String
    var poster : String
     
}

struct FriendModel{
    private(set) var oldFriends :[Friend] = [ ]
    
    private(set) var friendRequests :[Friend] = [Friend (name: "Sarah Abdullah", avatar: "sarah", poster: "blue"),
                                                 Friend (name: "Yara Alkhelaiwi", avatar: "yara", poster: "pink"),
                                                 Friend (name: "Dina Abdullah", avatar: "dina", poster: "purple"),
                                                 Friend (name: "Lujain Almogren", avatar: "lujain", poster: "yellow"),
                                                 Friend (name: "Mona Suliman", avatar: "mona", poster: "green")
    ]
    
    mutating func addFriend(_ user: Friend){
        oldFriends.append(user)
    }
    
    mutating func removeFriend(_ user: Friend){
        friendRequests.remove(at:0)
    }

}

class FriendViewModel: ObservableObject{
    @Published private var userModel =  FriendModel()
    
    var oldFriends: [Friend] {
        return userModel.oldFriends
    }
    
    var friendRequests: [Friend] {
        return userModel.friendRequests
    }
    
    func addUser(_ user: Friend){
        userModel.addFriend(user)
        
    }
    
    func removeFriend(_ user: Friend){
        userModel.removeFriend(user)
    }
}
