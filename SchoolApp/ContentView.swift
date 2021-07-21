//
//  ContentView.swift
//  FoodApp
//
//  Created by Amit Singh on 21/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            CustomNavigationBar()
            HeadingLabel(title: "Notice board")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    RectangleInfoView(message:"Stars appears to move from \n east to west" )
                    RectangleInfoView(message: "Vertual STEM Clubs for \n Gr 4-9 with...")
                }
                
            }.padding()
            HeadingLabel(title: "Today's Classes")
            List(0 ..< 10) { item in
                if item % 2 == 0 {
                    RoundedClassView(color: "greenColor", image: "study", isLive: true).onTapGesture {
                        debugPrint("Green color Clicked")
                    }.listRowBackground(Color(.clear))
                    .listRowInsets(.none)
                    RoundedClassView(color: "white", image: "study2", isLive: false).onTapGesture {
                        debugPrint("White color Clicked")
                    }.listRowBackground(Color(.clear))
                    .listRowInsets(.none)
                } else {
                    RoundedClassView(color: "white", image: "study2", isLive: false).onTapGesture {
                        debugPrint("White color Clicked")
                    }.listRowBackground(Color(.clear))
                    .listRowInsets(.none)
                    RoundedClassView(color: "greenColor", image: "study", isLive: false).onTapGesture {
                        debugPrint("Green color Clicked")
                    }.listRowBackground(Color(.clear))
                    .listRowInsets(.none)
                }
            }.background(Color(.clear))
            Spacer()
        }
        .background(Color(.systemGray6))
        .ignoresSafeArea()
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CustomNavigationBar: View {
    var body: some View  {
        HStack {
            Image(systemName: "text.justify").onTapGesture {
                debugPrint("Menu Clicked")
            }
            Spacer()
            Image(systemName: "person.crop.circle").onTapGesture {
                debugPrint("Profile Clicked")
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.size.width, height: 100, alignment: .bottom)
        .foregroundColor(.gray)
        .ignoresSafeArea()
        .background(Color(.white))
    }
}

struct HeadingLabel: View {
    @State var title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .padding()
    }
}

struct RectangleInfoView: View {
    @State var message: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.size.width - 30, height: 150, alignment: .center)
            HStack {
                VStack(alignment:.leading, spacing: 5) {
                    Text(message)
                        .bold()
                        .padding(.bottom)
                    Text("Read More").font(.caption2)
                        .foregroundColor(.blue).onTapGesture {
                            debugPrint("Read More clicked")
                        }
                }
                .padding()
                Image("firstImage")
                    .resizable()
                    .frame(width:70, height: 70, alignment: .center)
                
            }
        }
    }
}

struct RoundedClassView: View {
    @State var color: String
    @State var image: String
    @State var isLive: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(Color(color))
                .frame(width: UIScreen.main.bounds.size.width/2 - 20, height: 200, alignment: .center)
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                if isLive {
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 5, height: 5, alignment: .trailing)
                        Text("Live")
                            .font(.caption2)
                    }
                }
                
            }
            
        }
    }
}
