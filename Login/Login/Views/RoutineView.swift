import SwiftUI
struct RoutineView: View {
    
    @State var Edit = "Edit profile"
    @State var Progress = 0
    @State var activeTab = 3
    @State var Name = "There"
    
    @Binding var add: [RoutineModel]
    @State var add_routine = false
    @ObservedObject var viewModel: RoutineViewModel
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Image(systemName:"person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                        .frame(width: 130.0,
                               height: 110.0,
                               alignment: .center)
                        .clipShape(Circle()).padding(.leading, -120).padding(.vertical, -40)
                        .foregroundColor(.gray)
                    Text("   Hello \(Name)")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("purple_dark"))
                        .bold()
                        .padding(.trailing).padding(.bottom, -200).padding(.vertical, -30)
                }.padding(.bottom, -5).padding(.top, 35)

                NavigationLink(destination: ProfileView(),label: {Text("Edit Profile").fontWeight(.regular).foregroundColor(.white)
                    
                }).padding(.leading).buttonStyle(.borderedProminent).padding(.top, -20)

                
                HStack {
                    Text("My progress                              ").font(.body).foregroundColor(Color("purple_dark")).padding(.horizontal, 10).padding(.top, 30)
                    
                    Text("             \(Progress)%").foregroundColor(Color("purple_dark")).padding(.leading).padding(.horizontal, 10).padding(.top, 30)
                }.padding(.bottom, -20)
                
                ProgressView(value: Float(Progress)/100).padding()
                
                HStack {
                    Text("My Routine").font(.body).foregroundColor(Color("purple_dark")).padding(.horizontal, 25).padding(.leading, -55)
                    
                    Button(action:{
                        add_routine.toggle()
                        
                    }, label: { Text("+Add").fontWeight(.regular).foregroundColor(.white)} ).padding(.leading).buttonStyle(.borderedProminent).padding(.top).padding(.horizontal,-50).padding(.leading, 200)
                    
                }
            
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        if !(add.isEmpty) {
                            ForEach(add, id: \.id) { routine in
                                RoutinetCard(viewModel: viewModel, rotine: routine, onRemove: {
                                    if let index = add.firstIndex(where: { $0.id == routine.id }) {
                                        add.remove(at: index)
                                        
                                        let encoder = JSONEncoder()
                                        if let encodedData = try? encoder.encode(add) {
                                            UserDefaults.standard.set(encodedData, forKey: "SelectedRoutines")
                                        }
                                    }
                                })
                            }
                        }
                    }.padding()
                }
                
            }.fullScreenCover(isPresented: $add_routine, content: {SelectRoutine(viewModel: viewModel).environmentObject(viewModel) })
        }.navigationViewStyle(StackNavigationViewStyle())
        
    } // end body
}// end class
