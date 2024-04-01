//
//  ContentView.swift
//  NgsMobile
//
//  Created by Adriana Alvarado on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("NgsBlue")
                    .ignoresSafeArea(.all)
                
                VStack{
                    
//                    Text("Welcome Nghiem")
//                        .foregroundColor(Color("off-white"))
//                        .font(.title)
//                        .fontWeight(.bold)
//                    
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding()
                    
                    PhotoView()
                        .zIndex(0)
                    
                    ScrollView {
                        GeometryReader { geometry in
                            Color.clear.preference(key: ViewOffsetKey.self, value: geometry.frame(in: .named("scrollView")).minY)
                        }
                        .frame(height: 0)
                        
                        EventCardView(image: Image(decorative: "Event1"))
                    }
                    .coordinateSpace(name: "scrollView")
                   
                }
            }
        }
        .navigationTitle("Hello Nghiem")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct EventCardView: View {
    let image: Image
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 195, height: 200)
                .background(
                    image
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 195, height: 200)
                        .clipped()
                )
                .cornerRadius(10)
                .padding(.bottom, 8)
            
            
            VStack {
                Text("Fall Open House")
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(" October 12, 5:00pm")
                    .font(.footnote)
                    .fontWeight(.regular)
                
                Text("Ngs Scholar House")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .frame(width: 195, alignment: .leading)
        }
        .frame(width: 195)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}


struct PhotoView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 393, height: 244)
                .background(
                    Image("SA 23")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                )
                .roundedCorner(25, corners: [.topRight, .topLeft])
            
            Text("Next Generation \nScholars")
                .font(.system(size: 34, weight: .heavy, design: .serif))
                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                .multilineTextAlignment(.center)
            
            Button {
                print("navigate forward")
            } label: {
                Image(systemName: "arrow.forward")
                    .fontWeight(.semibold)
                    .padding(.all, 8)
            }
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .clipShape(Circle())
            .foregroundColor(Color("NgsBlue"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.all, 15)
        }
    }
}

// This is used to track the scroll view's offset
struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct ExploreView: View {
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading){
                HStack{
                    Text("Explore")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        print("View Events")
                    } label: {
                        Text("View More")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(0 ..< 4) { index in
                            EventCardView(image: Image("event_\(index + 1)"))
                        }
                        .padding(.trailing)
                    }
                    .padding(.leading)
                }
                
                HStack{
                    Text("Meet the Cohorts")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        print("View cohorts")
                    } label: {
                        Text("View More")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(0 ..< 4) { index in
                            EventCardView(image: Image("event_\(index + 1)"))
                        }
                        .padding(.trailing)
                    }
                    .padding(.leading)
                }
                
                HStack{
                    Text("Meet the Team")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        print("View staff")
                    } label: {
                        Text("View More")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(0 ..< 4) { index in
                            EventCardView(image: Image("event_\(index + 1)"))
                        }
                        .padding(.trailing)
                    }
                    .padding(.leading)
                }
            }
            .padding()
            .background(Color("off-white"))
        .roundedCorner(40, corners: [.topLeft, .topRight])
        }
    }
}
