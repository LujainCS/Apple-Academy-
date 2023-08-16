import SwiftUI
struct RoutinetCard: View {
    
    @ObservedObject var viewModel: RoutineViewModel
    
    var rotine: RoutineModel
    var onRemove: () -> Void
    
    @ViewBuilder var view: some View {

        switch(rotine.title){
        case "Read":
            Read()
        case "Food":
            Food()
        case "Water":
            Water()
        case "Sleep":
            Sleep()
        case "Money":
            Money()
        case "Exercise":
            Exercise()
        case "Study":
            Study()
        case "Self Care":
            SelfCare()
        default:
            SelfCare()
        }

    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(rotine.image1)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                HStack {
                    (rotine.image2).padding(.leading, 8)
                    Text(rotine.title).bold()
                }
                .padding()
                .frame(width: 180,alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            // button remove
            Button(action: onRemove) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.white)
                    .cornerRadius(50)
                    .padding().padding(.horizontal, -5)
            }
            
            HStack {
                NavigationLink {
                    view
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color.black)
                        .foregroundColor(.black)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.white)
                        .cornerRadius(50)
                        .padding().padding(.horizontal, -5)
                }
            }.padding(.top, 195)
        }
    }//end body
}//end View
