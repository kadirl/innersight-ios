//
//  GoalsView.swift
//  InnerSight
//
//  Created by Kadir on 05.08.2023.
//

import SwiftUI

struct GoalsSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var SettingsVM: SettingsViewModel = SettingsViewModel()
    
    @State var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .bottom) {
                ScrollView {
                    VStack (alignment: .leading) {
                        VStack (spacing: 8) {
                            ForEach (SettingsVM.goals, id: \.name) {goal in
                                GoalView(goal: goal)
                            }
                        }
                        .padding(.bottom, 80)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        StarsBackground(starsOpacity: 0.5, colorOpacity: 1)
                            .offset(x: 0, y: -144),
                        alignment: .top
                    )
                }.navigationTitle("My Goals")
                
                
                VStack {
                    Button {
                        if SettingsVM.areGoalsValid() {
                            SettingsVM.save()
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            showingAlert = true
                        }
                    } label: {
                        Text("Save")
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
            }
        }
        .toolbar(.hidden, for: .tabBar)
        
    }
}

struct GoalsSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsSettingsView()
            .preferredColorScheme(.dark)
    }
}
