import SwiftUI

struct friendView: View {
    @State var textFieldText: String = ""
    @StateObject var viewModel = FriendViewModel()
    var body: some View {
        NavigationView{
            VStack{
                    friendOld(viewModel: viewModel)
                        .navigationTitle("Friends")
                        .navigationBarItems(trailing: NavigationLink(
                            destination: friendRequest(viewModel: viewModel),
                            label: {
                                Image(systemName: "person.crop.circle.badge.plus")
                            })
                        )
            }
        }
        }
}
struct mainPage_Previews: PreviewProvider {
    static var previews: some View {
            friendView()
        }
    }
