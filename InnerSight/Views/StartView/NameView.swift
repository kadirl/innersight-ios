//
//  NameView.swift
//  InnerSight
//
//  Created by Kadir on 01.08.2023.
//

import SwiftUI


struct NameView: View {
    
    @ObservedObject var SignUpVM = SignupViewModel()
    
    @State var currentPageIndex : Int = 0
    @State var text: String = ""
    @State var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                Text("Let’s Introduce!\nWhat is your name?")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 24.0)
                
                HStack {
                    Image(systemName: "person.fill")
                    TextField("Your name", text: $SignUpVM.username)
                        .autocapitalization(.words)
                }
                .padding()
                .background(.ultraThinMaterial)
                .background(Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.5)).blendMode(.luminosity)
                .cornerRadius(12)
                
                Spacer()
                
                Button {
                    if SignUpVM.isNameValid() {
                        // next view logic
                    } else {
                        showingAlert = true
                    }
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                }
                .alert("Your name can't be empty. Please fill the field.", isPresented: $showingAlert) {
                    Button("OK") { }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.indigo)
                .foregroundColor(.white)
                .padding(.bottom, 32)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing])
            .padding(.top, 16)
            .background(
                StarsBackground(starsOpacity: 0.5, colorOpacity: 1),
                alignment: .top
            )
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                PageControl(currentPageIndex: currentPageIndex, numberOfPages: 3)
                    .padding(10)
                    .disabled(true)
                    .frame(width: 64)
            }
        }
    }
}


struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
            .preferredColorScheme(.dark)
    }
}
