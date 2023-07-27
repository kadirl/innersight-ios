//
//  ContentView.swift
//  InnerSight
//
//  Created by Kadir on 19.07.2023.
//

import SwiftUI
import Charts

struct MountPrice: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
}

struct ContentView: View {
    let data: [MountPrice] = [
        MountPrice(mount: "jan/22", value: 5),
        MountPrice(mount: "feb/22", value: 4),
        MountPrice(mount: "mar/22", value: 7),
        MountPrice(mount: "apr/22", value: 15),
        MountPrice(mount: "may/22", value: 14),
        MountPrice(mount: "jun/22", value: 27),
        MountPrice(mount: "jul/22", value: 27)
    ]
    
    @State private var textInput: String = ""
    @State private var isTipsVisible: Bool = true
    
    var body: some View {
            TabView {
                MainView()
                    .tabItem {
                        Label("Main", systemImage: "house.fill")
                            .foregroundColor(Color.purple)
                    }
                ChatView()
                    .tabItem {
                        Label("Chat", systemImage: "message.fill")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
            }
        }
    }


struct MainView: View {
    let data: [MountPrice] = [
        MountPrice(mount: "jan/22", value: 5),
        MountPrice(mount: "feb/22", value: 4),
        MountPrice(mount: "mar/22", value: 7),
        MountPrice(mount: "apr/22", value: 15),
        MountPrice(mount: "may/22", value: 14),
        MountPrice(mount: "jun/22", value: 27),
        MountPrice(mount: "jul/22", value: 27)
    ]
    
    @State private var textInput: String = ""
    @State private var isTipsVisible: Bool = true
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Hello, Kadir!")
                .bold()
                .font(.largeTitle)
                .padding(.bottom, 16)
            Chart(data) {
                LineMark(
                    x: .value("Mount", $0.mount),
                    y: .value("Value", $0.value)
                )
                PointMark(
                    x: .value("Mount", $0.mount),
                    y: .value("Value", $0.value)
                )
            }
            .foregroundColor(Color.purple)
            .frame(height: 250)
            .padding(16)
            .background(Color(red: 0.11, green: 0.11, blue: 0.12))
            .cornerRadius(16)
            .padding(.bottom, 16)
            
            
            VStack(alignment: .leading, spacing: 12) {
                if isTipsVisible {
                    // Headline/Regular
                    Text("Tip for today")
                        .font(
                            .headline
                        )
                        .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.96).opacity(0.6))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        // Title2/Emphasized
                        Text("Eat more fruits & vegetables")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        // Body/Regular
                        Text("This would help you naturally lover your stress level")
                            .font(Font.custom("SF Pro", size: 17))
                            .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.96).opacity(0.6))
                            .frame(width: 326, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    Button("Hide tips") {
                        isTipsVisible.toggle()
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(Color.purple)
                }}
            .padding(16)
            .background(Color(red: 0.11, green: 0.11, blue: 0.12))
            .cornerRadius(16)
            Spacer()        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
    }
}


struct ChatView: View {
    
    @State private var areMessagesVisible: Bool = false
    @State private var textInput: String = ""
    @State private var immutableText: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Chat")
                .font(.largeTitle)
                .bold()
            HStack(alignment: .top, spacing: 20) {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 32, height: 32)
                  .background(
                    Image("img")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 32, height: 32)
                      .clipped()
                  )
                  .cornerRadius(99)
                VStack(alignment: .leading, spacing: 4) {
                    // Body/Emphasized
                    Text("Assistant")
                      .font(.body)
                      .bold()
                      .foregroundColor(.white)
                    // Body/Regular
                    Text("Welcome to the virtual therapy, a safe and supportive space where you can explore your thoughts, emotions, and experiences. I am InnerSight Bot, your virtual psychologist, here to listen without judgment and provide you with empathetic support. Whether you're facing challenges, seeking personal growth, or simply need someone to talk to, I am here to assist you on your journey towards understanding and healing.")
                      .font(Font.custom("SF Pro", size: 17))
                      .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.96).opacity(0.6))
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(16)
            .frame(width: 390, alignment: .topLeading)
            Divider()
            
            HStack(alignment: .top, spacing: 20) {
                if areMessagesVisible {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 32, height: 32)
                        .background(
                            Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 32, height: 32)
                                .clipped()
                        )
                        .cornerRadius(99)
                    VStack(alignment: .leading, spacing: 4) {
                        // Body/Emphasized
                        Text("You")
                            .font(.body)
                            .bold()
                            .foregroundColor(.white)
                        // Body/Regular
                        Text(immutableText)
                            .font(Font.custom("SF Pro", size: 17))
                            .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.96).opacity(0.6))
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
            }
            .padding(16)
            .frame(width: 390, alignment: .topLeading)
            Divider()
            
            HStack(alignment: .top, spacing: 20) {
                if areMessagesVisible {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 32, height: 32)
                  .background(
                    Image("img")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 32, height: 32)
                      .clipped()
                  )
                  .cornerRadius(99)
                    
                VStack(alignment: .leading, spacing: 4) {
                    // Body/Emphasized
                    Text("Assistant")
                      .font(.body)
                      .bold()
                      .foregroundColor(.white)
                    // Body/Regular
                    Text("I am very sad for your sadness. May you please explain why you feel this way? I am going to help out on this. Feel free to express your emotions ☺️")
                      .font(Font.custom("SF Pro", size: 17))
                      .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.96).opacity(0.6))
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                }
            }
            .padding(16)
            .frame(width: 390, alignment: .topLeading)
            Divider()
            
            Spacer()
            HStack {
                TextField("Enter text here", text: $textInput)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    immutableText = String(textInput)
                    textInput = ""
                    areMessagesVisible.toggle()
                }) {
                    Image(systemName: "paperplane.fill") // Replace "heart.fill" with the SF Symbol name of your desired icon
                        .imageScale(.large) // Adjust the image scale as needed
                }
                .padding() // Add padding to the button for spacing
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
    }
}

struct SettingsView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Settings")
                .bold()
                .font(.largeTitle)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
