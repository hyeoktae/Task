import Foundation

class User {
  let name: String
  let profileImageName: String
  let password: String
  
  init(name: String, profileImageName: String, password: String) {
    self.name = name
    self.profileImageName = profileImageName
    self.password = password
  }
}
