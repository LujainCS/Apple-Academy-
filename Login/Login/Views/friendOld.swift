import SwiftUI

struct friendOld:View{
    
    @State var textFieldText: String = ""
    @ObservedObject var viewModel : FriendViewModel
    
    var filteredFriends: [Friend]{
        guard !textFieldText.isEmpty else {return viewModel.oldFriends}
        return viewModel.oldFriends.filter{
            $0.name.localizedCaseInsensitiveContains(textFieldText)
        }
    }
    var body: some View {
        ScrollView{
            ForEach(filteredFriends, id: \.id){ friend in
                FriendRow2(friend: friend, viewModel: viewModel)
            }
        }.searchable(text: $textFieldText, prompt:"Search...")
    }
}
