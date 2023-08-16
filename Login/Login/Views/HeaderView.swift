import SwiftUI
struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(background)
                
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width,
        height: 350)
        .offset(y: -190)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title",
                   subtitle: "suptitle",
                   background: .blue)
    }
}
