//
//  HomeView.swift
//  API Integration
//
//  Created by Abilash  MacBook on 02/12/22.
//

import SwiftUI
import Combine
import Foundation

struct HomeView: View {
    @ObservedObject var fetch = FetchToDo()
    @State var isShowPopup:Bool = true
    //CUSTOMSTICKYHEADAR
    @State var ShowTab =  true
    @State var Offset : CGFloat = 0
    @State var MoveTab = true
    var body: some View {
        ZStack(alignment: .top)
        {
            ScrollViewReader{ Value in
                if(fetch.todos.count != 0)
                {
                
                ZStack(alignment: .top)
                {
                    VStack{
                        HStack{
                            Button(action: {
                                withAnimation()
                                {
                                    Value.scrollTo(0, anchor: .top )
                                }
                            }, label: {
                                Image("youtube")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                Text("Youtube")
                                    .foregroundColor(.black)
                                    .font(.custom("KohinoorDevanagari-Regular", size: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 20))
                                    .bold()
                            })
                            
                            Spacer()
                            HStack(spacing:15){
                                Image("cast")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    
                                Image("bell")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                Image("search")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                            }
                           
                        }
                        .padding(.horizontal,15)
//                        .padding(.bottom)
//                        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
//                        .frame(height: 100)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.07), radius: 5, x: 0, y: 5)
//                        .ignoresSafeArea(.all,edges: .top)
                        .navigationBarHidden(true)
                    }
                    .zIndex(1)
                    .offset( y: ShowTab ?  0  : -180)
                    CustomScrollView(
                        axes: [.vertical],
                        showsIndicators: false,
                        offsetChanged: { value in
                            //                                        print(value)
                            if MoveTab{
                                if Offset  < value.y || value.y == 0{
                                    withAnimation(){
                               isShowPopup = true
                                        ShowTab = true
                                    }
                                }else if Offset > value.y{
                                    withAnimation(){
                                        ShowTab = false
                                    }
                                }
                                Offset = value.y
                            }
                            MoveTab = true
                        }
                    ){
                        VStack{
                            VStack{
                                Text("")
                            }.frame(height: 70)
                                .id(0)
                            ForEach(0..<fetch.todos.count,id:\.self){ index in
                                let item  = self.fetch.todos[index]
//                                ZStack(alignment: .bottomTrailing){
                                    Button(action: {
                                        self.ShowTab = false
                                        self.isShowPopup = true
                                    }, label: {
                                        NavigationLink(destination: DetailPage(gettitle:.constant("\(item.title)")))
                                        {
                                            VStack{
                                                
                                                Image("Thumbnail")
                                                    .resizable()
                                                
                                                    .frame(width: UIScreen.main.bounds.width - 5 ,height: UIScreen.main.bounds.height / 4.0)
                                                    .overlay(
                                                        VStack{
                                                            Spacer()
                                                            HStack{
                                                                Spacer()
                                                                Text("UserID:\(item.userId)")
                                                                    .frame(height: 50)
                                                                    .foregroundColor(.white)
                                                                    .font(Font.custom("EuphemiaUCAS", size: 13))
                                                                    .fontWeight(.semibold)
                                                                Spacer()
                                                            }.background(Color.black.opacity(0.5))
                                                            
                                                        }
                                                    )
                                                
                                                
                                            }
                                        }
                                        
                                    })
//                                }
                                
                            }.id(1)
                            
                            
                            
                        }
                    }
               }
                  
            }
                else
                {
                    Text("loading")
                }
            }
            BottomPopupBar(show: $isShowPopup, MoveTab: $ShowTab)
                .offset( y: ShowTab ?  0  : 180)
            
        }
    }
  }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



class FetchToDo: ObservableObject {
    @Published var todos = [Detailview]()
     
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode([Detailview].self, from: todoData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
