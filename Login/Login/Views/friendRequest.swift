import SwiftUI

struct friendRequest: View {
    @State var search: String = ""
    @ObservedObject var viewModel : FriendViewModel

    var body: some View {
            ScrollView{
                ForEach(viewModel.friendRequests, id: \.id){ friend in
                    FriendRow(viewModel: viewModel, friend:friend).padding()
                }
            }.navigationBarTitle("Friend Request")
            .navigationBarItems(trailing: NavigationLink(
                destination: Search(),
                label: {
                    Image(systemName: "magnifyingglass")
                })
            )
    }
}
