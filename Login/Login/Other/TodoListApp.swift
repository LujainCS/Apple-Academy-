import FirebaseCore
import SwiftUI

@main
struct ListApp: App {
    
    init() {
        FirebaseApp.configure()
    }

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()

                }
            

            .environmentObject(listViewModel)

        }
    }
}
