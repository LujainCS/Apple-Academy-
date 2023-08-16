import SwiftUI

    
struct TextfieldBootcamp: View {
    @State var textFieldText: String = ""
    
    
    
    
    var body: some View {
        NavigationView{
            
            
            
            TextField("Type something here...", text: $textFieldText)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .padding()
                .navigationTitle("Note")
            
        }
    }
}
        

           
            struct TextfieldBootcamp_Previews: PreviewProvider {
                static var previews: some View {
                    TextfieldBootcamp()
                }
            }
        
