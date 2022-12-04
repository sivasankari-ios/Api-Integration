//
//  DetailPage.swift
//  API Integration
//
//  Created by Abilash  MacBook on 03/12/22.
//

import SwiftUI

struct DetailPage: View {
    @State var ShowPost:Bool = false
    @State var MOvePopUP:Bool = false
    @Binding var gettitle:String
    var body: some View {
        ZStack{
            VStack(spacing:0){
                Image("Thumbnail")
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: UIScreen.main.bounds.width - 5 ,height: UIScreen.main.bounds.height / 4.0)
                    .padding(.top, -8)
                HStack{
                    Text("\(gettitle)")
                        .font(Font.custom("EuphemiaUCAS", size: 18))
                        .minimumScaleFactor(0.2)
                        .bold()
                    Spacer()
                    
                    Button(action: {
                        withAnimation()
                        {
                            self.ShowPost.toggle()
                        }
                    }, label: {
                        HStack(spacing:3){
                            Text("View Post")
                            Image(systemName: "chevron.down")
                        }
                    })
                    
                    
                    .padding(.horizontal,-9)
                    .font(Font.custom("EuphemiaUCAS", size: 13))
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .cornerRadius(5)
                .background( Color.white)
                .cornerRadius(10)
                .shadow(radius: 4)
                Spacer()
                
            }
            VStack{
                Spacer()
                ViewPost(show: $ShowPost)
                    .transition(.scale)
//                    .offset(y: MOvePopUP ? 0 : UIScreen.main.bounds.height / 2)
            }
        }
    }
}

//struct DetailPage_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPage()
//    }
//}
