//
//  NameView.swift
//  InnerSight
//
//  Created by Kadir on 01.08.2023.
//

import SwiftUI


struct AgeView: View {
    
    @ObservedObject var SignUpVM: SignupViewModel
    
    @State var text: String = ""
    @State var showingAlert: Bool = false
    
    @State private var isNextViewActive = false
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                Text("How old are you?")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 24.0)
                
                Spacer()
                
                Picker("Please choose your age", selection: $SignUpVM.age) {
                    ForEach(13...99, id: \.self) { age in
                        Text(String(age))
                            .font(.title)
                    }
                }
                .pickerStyle(.wheel)
                .background(.ultraThinMaterial.blendMode(.luminosity))
                .cornerRadius(12)
                
                Spacer()
                
                Button {
                    if SignUpVM.isAgeValid() {
                        isNextViewActive = true
                    } else {
                        showingAlert = true
                    }
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                }
                .alert("You must be 13 years or older.", isPresented: $showingAlert) {
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
            
            NavigationLink(
                destination: GoalsView(SignUpVM: SignUpVM),
                isActive: $isNextViewActive,
                label: { EmptyView() }
            )
            .hidden()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                PageControl(currentPageIndex: 1, numberOfPages: 3)
                    .padding(10)
                    .disabled(true)
                    .frame(width: 64)
            }
        }
    }
}


struct DobView_Previews: PreviewProvider {
    static var previews: some View {
        AgeView(SignUpVM: SignupViewModel())
            .preferredColorScheme(.dark)
    }
}
