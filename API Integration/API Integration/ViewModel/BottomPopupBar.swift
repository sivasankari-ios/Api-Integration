//
//  BottomPopupBar.swift
//  API Integration
//
//  Created by Abilash  MacBook on 02/12/22.
//

import SwiftUI

struct BottomPopupBar: View {
    struct Imagepopup : Identifiable
    {
        let id = UUID()
        let POPimages: String
        let namess:String
    }
    let popImage = [ Imagepopup(POPimages: "home", namess: "Home"),
                     Imagepopup(POPimages: "film-reel", namess: "Shorts"),
                     Imagepopup(POPimages: "plus", namess: ""),
                     Imagepopup(POPimages: "subscription", namess: "Subscription"),
                     Imagepopup(POPimages: "video-library", namess: "Library")]
    @Binding var show:Bool
    @Binding var MoveTab : Bool
    @State var MoveMenu = false
    var body: some View {
        ZStack(alignment:.bottom)
        {
            ZStack{
//                if show
//                {
//                    Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
//                        .onAppear(perform: {
//                            withAnimation(.linear(duration: 0.5)){
//                                MoveMenu = true
//                            }
//                        })
//                        .onTapGesture {
//                            withAnimation(.linear(duration: 0.5)){
//                                MoveMenu = false
//                            }
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//                                if self.show {
//                                    self.show.toggle()
//                                    withAnimation(.linear(duration: 0.5)){
//                                        MoveTab = true
//                                    }
//                                    //                        print(self.mhzValue)
//                                }
//
//                            })
//                        }
                
                    VStack{
                        Spacer()
                        ZStack{
                            HStack(alignment: .center, spacing: UIDevice.current.userInterfaceIdiom == .pad ? 7 : 3) {
                                ForEach(0..<popImage.count,id:\.self ){ index in
                                    let item = popImage[index]
                                    Button(action: {
                                        
                                    }, label: {
                                        VStack{
                                            
                                            Image("\(item.POPimages)")
                                                .resizable()
                                                .renderingMode(.template)
                                                .aspectRatio( contentMode: .fit)
                                                .padding( index == 2 ? 0 : 12)
                                                .foregroundColor(Color.black)
                                                .frame(width: index == 2 ? UIScreen.main.bounds.width / 7.3 : UIScreen.main.bounds.width / 5.3,height:  index == 2 ? 80 : 60)
                                                .offset(x:0,y: index == 2 ? 25 :  10)
                                            Text("\(item.namess)")
                                                .foregroundColor( Color.black)
                                                .font(Font.custom("KohinoorTelugu-Regular", size: 15))
                                                .fontWeight(.semibold)
                                                .minimumScaleFactor(0.8)
                                                .lineLimit(1)
                                                .frame(width:UIScreen.main.bounds.width / 5.3)
//
                                        }
                                        })
                                }
                            }}
                        .padding(.horizontal,2)
                        
                        .frame(maxWidth:.infinity)
                        .cornerRadius(10)
                        .frame(height:UIScreen.main.bounds.height / 15.0)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.07), radius: 5, x: 0, y: 5)
                       
//                        .offset(y: MoveMenu ? 0 : 180)
                    }
//                }
                
            }}
    }
}

struct BottomPopupBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomPopupBar(show: .constant(true), MoveTab: .constant(true))
    }
}
