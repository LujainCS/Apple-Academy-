import SwiftUI
struct RegisterView: View {
    @StateObject var ViewModel = RegisterViewViewModel()
   
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start orgnizing todo",
                       background: Color(#colorLiteral(red: 0.3980148733, green: 0.5685611367, blue: 0.6951860785, alpha: 1)))
            
            Form {
                TextField("Full Name", text: $ViewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $ViewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $ViewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create Account",
                    background: .green
                ) {
                    ViewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
