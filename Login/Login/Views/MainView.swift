import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    @StateObject var viewModel2 = RoutineViewModel()
    @State var add: [RoutineModel] = []
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
        } else {
            LoginView()
        }
    }
  
    @ViewBuilder
    var accountView: some View {
        TabView {
            //signed in
            RoutineView(add: $viewModel2.selectedRoutines, viewModel: viewModel2)


                .tabItem{
                    Label("Routine", systemImage: "house")
                }
            
            ListView()
                .tabItem{
                    Label("List", systemImage: "list.bullet.clipboard")
                }
            
            friendView()
                .tabItem{
                    Label("Friends", systemImage: "person.3")
                }
        }.onAppear(){
            self.add = viewModel2.newSelectedRoutines

        }
    }
}

