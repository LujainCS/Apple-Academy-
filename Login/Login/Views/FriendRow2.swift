import SwiftUI
struct FriendRow2: View {
    var friend:Friend
    @ObservedObject var viewModel : FriendViewModel
    @State private var selectedEmoji = "😍"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    Color(#colorLiteral(red: 0.8054981828, green: 0.9010003805, blue: 0.9551108479, alpha: 1))
                )
                .frame(width:380, height:100)
                .padding()
            
            HStack(){
                Image(friend.avatar)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .clipped().clipShape(Circle( ))
                    .frame(width:90, height:90)
                
                Text(friend.name)
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.3228411973, green: 0.3579655886, blue: 0.4761579633, alpha: 1)))
                    .frame(width:110, height:50)
                    .font(.system(size: 20))
                
                Picker(selection:$selectedEmoji,
                       label:Image(systemName:"face.dashed.fill"),
                       content:{
                    Text ("😍").tag("😍")
                    Text ("🔥").tag("🔥")
                    Text ("👍").tag("👍")
                    Text ("❤️").tag("❤️")
                }
                )
                .pickerStyle(MenuPickerStyle())
                Circle()
                    .stroke(Color(.gray),
                                    style: StrokeStyle(
                                        lineWidth: 5,
                                        lineCap: .butt,
                                        lineJoin: .miter,
                                        miterLimit: 0,
                                        dash: [20, 10],
                                        dashPhase: 0))
                            .padding(20)
                            .frame(width:90)
                
            }
           
        }
    }
}
