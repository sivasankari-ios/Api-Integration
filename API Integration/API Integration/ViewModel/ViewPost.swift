//
//  ViewPost.swift
//  API Integration
//
//  Created by Abilash  MacBook on 03/12/22.
//

import SwiftUI

struct ViewPost: View {
    @State var text:String = """
Remember to keep comments respectful and to follow our
"""
    @ObservedObject var fetch = FetchToDo()
    @Binding var show:Bool
    var body: some View {
        ZStack{
            if show{
                VStack{
                    Text("")
                    HStack{
                        Text("Comments")
                            .fontWeight(.semibold)
                        Spacer()
                        Button(action: {
                            withAnimation()
                            {
                                self.show = false
                            }
                        }, label: { Image(systemName: "xmark")
                                .foregroundColor(.black)
                        })
                       
                    }
                    .padding(.horizontal)
                    .font(Font.custom("EuphemiaUCAS", size: 20))
                    VStack{
                        Text(text)
                            .font(.system(size: 15))
                        
                        
                    
                            NavigationLink(destination: EmptyView())
                            {
                                HStack{
                                    Text("Community  Guidelines")
                                        .font(.system(size: 15))
                                        .foregroundColor(.blue)
                                    Spacer()
                                }
                            }
                        
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .cornerRadius(5)
                    .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                    Divider()
                    VStack{
                        ScrollView{
                            
                            ForEach(0..<fetch.todos.count,id:\.self){ index in
                                let item  = self.fetch.todos[index]
                                HStack{
                                    Button(action: {}, label: {
                                        Image("Profile")
                                            .resizable()
                                            .frame(width:30 ,height:30)
                                            .cornerRadius(20)
                                            .shadow(radius: 5)
                                    })
                                   
                                    VStack{
                                        HStack{
                                            Text("Userid:\(item.userId)")
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.gray)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("USER TITLE:\n\(item.title)")
                                                .font(.system(size: 18))
                                                .bold()
                                                .minimumScaleFactor(0.2)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("USER BODY:\n\(item.body)")
                                                .font(.system(size: 15))
                                                .minimumScaleFactor(0.2)
                                            Spacer()
                                        }
                                        
                                    }
                                    Spacer()
                                    Spacer()
                                    Button(action: {
                                       
                                    }, label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.black)
                                            .rotationEffect(Angle(degrees: 90), anchor: .bottomLeading)
                                    })
                                }
                                .padding(.horizontal)
                                HStack(spacing: 20){
                                    Button(action: {}, label: {
                                        Image(systemName: "hand.thumbsup")
                                        Text("65")
                                        
                                    })
                                    Button(action: {}, label: {
                                        Image(systemName: "hand.thumbsdown")
                                    })
                                    Button(action: {}, label: {
                                        Image(systemName: "ellipsis.message")
                                    })
                                    Spacer()
                                } .foregroundColor(.black)
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                    .frame(width: UIScreen.main.bounds.width , height:  UIDevice.current.userInterfaceIdiom == .phone ? UIScreen.main.bounds.height / 1.90 : UIScreen.main.bounds.height / 3)
                    .padding(.bottom)
                    .background(Color.white)
                    .CornerRadius(30, corners: [.topLeft,.topRight])
                    .shadow(radius: 5)
            }}
    }
}

struct ViewPost_Previews: PreviewProvider {
    static var previews: some View {
        ViewPost(show: .constant(true))
    }
}
