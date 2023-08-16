import SwiftUI

struct FriendRow: View {
    @ObservedObject var viewModel : FriendViewModel
    @Environment(\.dismiss) var dismiss
    
    var friend:Friend
    var body: some View {
            HStack{
                Image(friend.avatar)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .clipped().clipShape(Circle( ))
                    .frame(width:80, height:80)
                
                VStack(alignment:.leading, spacing: 10){
                    Text(friend.name)
                        .foregroundColor(.primary)
                    HStack{
                        Button(action: {
                            viewModel.addUser(friend)
                            viewModel.removeFriend(friend)
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height:35)
                                    .foregroundColor(.blue)

                                Text("Add Friend")
                                    .font(.system(size:13))
                                    .foregroundColor(.white)
                            }
                        })
                        Button(action: {
                            viewModel.removeFriend(friend)
                        }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height:35)
                                    .foregroundColor(.gray)
                                Text("Remove")
                                    .font(.system(size:13))
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                    }
                }
                
            }
        }
    }
