import SwiftUI
struct Search: View {
    @State var textFieldText: String = ""
    var body: some View {
        NavigationView{
            ScrollView(){
                
            }.navigationTitle("Search")
                .searchable(text: $textFieldText, prompt:"Search...")
        }.searchable(text: $textFieldText, prompt:"Search...")
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
