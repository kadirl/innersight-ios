//
//  NameView.swift
//  InnerSight
//
//  Created by Kadir on 01.08.2023.
//

import SwiftUI


struct GoalsView: View {
    
    @ObservedObject var SignUpVM: SignupViewModel
    
    @State var text: String = ""
    @State var showingAlert: Bool = false
    
    @State private var isNextViewActive = false
    
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .bottom) {
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("What do you want to improve in yourself?")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 24.0)
                        
                        VStack (spacing: 8) {
                            ForEach (SignUpVM.goals, id: \.name) {goal in
                                GoalView(goal: goal)
                            }
                        }
                        .padding(.bottom, 80)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        StarsBackground(starsOpacity: 0.5, colorOpacity: 1)
                            .offset(x: 0, y: -96),
                        alignment: .top
                    )
                }
                
                
                VStack {
                    Button {
                        if SignUpVM.areGoalsValid() {
                            SignUpVM.signUp()
                            isNextViewActive = true
                        } else {
                            showingAlert = true
                        }
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                    }
                    .alert("You must select at least 1 goal.", isPresented: $showingAlert) {
                        Button("OK") { }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .tint(.indigo)
                    .foregroundColor(.white)
                    .padding()
                }
                .background(Material.bar)
//                .background(.black)
            }
            
            NavigationLink(
                destination: ContentView(hasSignedUp: true).navigationBarBackButtonHidden(true),
                isActive: $isNextViewActive,
                label: { EmptyView() }
            )
            .hidden()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                PageControl(currentPageIndex: 2, numberOfPages: 3)
                    .padding(10)
                    .disabled(true)
                    .frame(width: 64)
            }
        }
    }
}


struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView(SignUpVM: SignupViewModel())
            .preferredColorScheme(.dark)
    }
}
