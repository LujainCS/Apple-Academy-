import SwiftUI
struct SelectRoutine: View {
    
    var layout: [GridItem] = [GridItem(), GridItem()]
    @ObservedObject var viewModel = RoutineViewModel()

  @State var routines: [RoutineModel] = []
    @State var NextPage = false
    
    var body: some View {
        VStack {
            Text("Welcome                                           choose 3 topics or more ")
                .font(.system(size:24))
                .padding(10)
                .ignoresSafeArea()
            
            LazyVGrid(columns: layout, content: {
                ForEach(0..<viewModel.routines.count, id: \.self) { index in
                    Button {
                        viewModel.selectRoutine(at: index)
                    } label: {
                        ZStack {
                            Image(viewModel.routines[index].image1)
                                .resizable()
                                .frame(width: 150, height: 100)
                                .cornerRadius(20)
                                .shadow(radius: 50)
                            
                            Text(viewModel.routines[index].title)
                                .foregroundColor(viewModel.routines[index].choice ? .white : .black)
                                .font(.largeTitle)
                                .bold()
                        }
                    }
                }
            })
            .padding()
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .foregroundColor(Color(#colorLiteral(red: 0.9625381827, green: 0.9526085258, blue: 0.9182474613, alpha: 1)))
                        .frame(width: 180, height: 50)
                    Button(action: {
                        viewModel.deselectNewRoutines()
                    }) {
                        Text("Cancel")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                ZStack {
                    RoundedRectangle (cornerRadius: 25, style: .continuous)
                        .foregroundColor(Color(#colorLiteral(red: 0.9625381827, green: 0.9526085258, blue: 0.9182474613, alpha: 1)))
                        .frame( width: 180,height: 50)
                    
                    Button("Next", action: {
                        NextPage = true
                    })
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .bold()
                }
            }
        }.fullScreenCover(isPresented: $NextPage, content: {
            
            MainView()
            
        }).alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Duplicate Routine"),
                    message: Text("This routine has already been added."),
                    dismissButton: .default(Text("Close!"))
                )
            })

    } 
}

struct SelectRoutine_Previews: PreviewProvider {
    static var previews: some View {
        SelectRoutine(routines: RoutineData)
    }
}
