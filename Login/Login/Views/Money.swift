import SwiftUI
struct Money: View{
    @State var selection: String = "1"
    @AppStorage("T3") var tasbeh2 = 0
    @State var isAleart2 = false
    
    var total1 : CGFloat{
        return CGFloat(tasbeh2)
    }// end function total
    
    var body: some View {
        ZStack{
            Color("offWhite").edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName:"dollarsign.arrow.circlepath")
                    .resizable()
                    .scaledToFit()
                    .frame(width:150,height: 150)
                    .fontWeight(.light)
                    .foregroundColor(.accentColor)
                
                HStack {
                    VStack(spacing:0) {
                        Text("Goal :")
                            .bold()
                            .font(.system(size:60))
                            .padding()
                        HStack{
                            Text(selection)
                            Text("SAR")
                        }
                    }
                    VStack{
                        Picker(
                            selection: $selection,
                            label:Text("Picher"), content: {
                                ForEach(1..<10000){ number in
                                    
                                    Text("\(number)")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .tag("\(number)")
                                }
                            }).tint(.black)
                            .background(Color.gray.opacity(0.3))
                    }
                }
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color("offWhite") , Color("offWhite")]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 10.0)
                                .foregroundColor(.black)
                                .frame(width: 200, height: 200)
                                .opacity(0.3)
                                .padding()
                            
                            Circle()
                                .trim(from: 0.0 , to: total1 / 100)
                                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                                .frame(width: 200, height: 200)
                                .foregroundColor(Color("purple_dark"))
                            
                            Text("\(Int(total1)) %")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                            
                        }.padding(.top, 45).padding(.leading, -1).padding(.bottom, 10)// end zstack
                        
                        Text("In progress")
                            .font(.system(size: 24))
                            .foregroundColor(Color("purple_dark")).padding(.all, -15).padding(.top, 10)
                        
                        Button(action: { tasbeh2 += 10
                            chack()
                            
                        }) {
                            Text("+").dynamicTypeSize(.accessibility4)
                        }.disabled(tasbeh2 >= 110)
                            .frame(width:18, height: 15)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("AccentColor"))
                            .cornerRadius(10)
                            .padding(.leading, 200).padding(.top, 10)
                    }.padding(.bottom, 20)//end Vstack
                }
            }.padding(.vertical,50)
        }
        
    }//end body
    
    func chack(){
        if (tasbeh2) >= 110{
            tasbeh2 = 0
            isAleart2.toggle()
        }
    }//end func check
}// end View

struct Money_Previews: PreviewProvider {
    static var previews: some View {
        Money()
    }
}
