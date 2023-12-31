//
//  InfiniteCarouselView.swift
//  InfiniteCarousel (iOS)
//
//  Created by Balaji on 21/09/21.
//

import SwiftUI


struct Tab: Identifiable, Hashable {
    var id = UUID().uuidString
    var icon: String
    var title: String
    var description: String
}


struct InfiniteCarouselView: View{
    // Tabs...
    @Binding var tabs: [Tab]
    @Binding var currentIndex: Int
    
    @State var fakeIndex: Int = 0
    
    @State var offset: CGFloat = 0
    
    @State var genericTabs: [Tab] = []
    
    @State var height: CGFloat = 0
    
    var body: some View{
        
        TabView(selection: $fakeIndex) {
            
            ForEach(genericTabs){tab in
//                GeometryReader { geometry in
                    VStack(alignment: .leading, spacing: 12){
                        Image(systemName: tab.icon)
                            .padding([.top, .leading])
                            .font(.title)
                            .bold()
                            .foregroundColor(.indigo)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(tab.title)
                                .font(.headline.bold())
                                .foregroundColor(.primary)
                            
                            Text(tab.description)
                                .foregroundColor(.secondary)
                        }
                        .padding([.bottom, .leading])
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.thinMaterial)
                    .cornerRadius(13)
                    .padding(16)
                    .overlay(
                        GeometryReader{proxy in
                            Color.clear
                                .preference(key: OffsetKey.self, value: proxy.frame(in: .global).minX)
                                .onPreferenceChange(OffsetKey.self, perform: { offset in
                                    self.offset = (offset.remainder(dividingBy: proxy.size.width))
                                })
                        }
                    )
                    .tag(getIndex(tab: tab))
//                    .onAppear {
//                        height = max(height, CGFloat(Int(geometry.size.height)))
//                        print("HEIGHT: \(height)")
//                    }
//                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: offset) { newValue in
            

//            print(offset,fakeIndex)
            if fakeIndex == 0 && offset == 0{
                // moving to last  - 1..
                fakeIndex = genericTabs.count - 2
            }
            if fakeIndex == genericTabs.count - 1 && offset == 0{
                fakeIndex = 1
            }
        }
        .onAppear {
            
            genericTabs = tabs
            
            // Add first and last extra two items...
            guard var first = genericTabs.first else{
                return
            }
            
            guard var last = genericTabs.last else{
                return
            }
            
            // updating ID else it will create issues in view bcz of same ID...
            
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            genericTabs.append(first)
            genericTabs.insert(last, at: 0)
            
            fakeIndex = 1
        }
        // Updating Real Time...
        .onChange(of: tabs) { newValue in
            
            genericTabs = tabs
            
            // Add first and last extra two items...
            guard var first = genericTabs.first else{
                return
            }
            
            guard var last = genericTabs.last else{
                return
            }
            
            // updating ID else it will create issues in view bcz of same ID...
            
            first.id = UUID().uuidString
            last.id = UUID().uuidString
            
            genericTabs.append(first)
            genericTabs.insert(last, at: 0)
        }
        // Updating CurrentIndex...
        .onChange(of: fakeIndex) { newValue in
            currentIndex = fakeIndex - 1
        }
    }
    
    func getIndex(tab: Tab)->Int{
        let index = genericTabs.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        
        return index
    }
}

struct Home_Previews1: PreviewProvider {
    static var previews: some View {
        StartView()
            .preferredColorScheme(.dark)
    }
}

// Offset Key..
struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

