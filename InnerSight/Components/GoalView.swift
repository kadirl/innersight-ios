//
//  GoalView.swift
//  InnerSight
//
//  Created by Kadir on 02.08.2023.
//

import SwiftUI
import Foundation

struct GoalView: View {
    @ObservedObject var goal: Goal
//    var header: String
//    var description: String
//    var icon: String
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: goal.icon)
                .frame(width: 60, alignment: .center)
                .font(.title3)
                .bold()
            
            VStack (alignment: .leading, spacing: 4) {
                Text(goal.name)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(goal.description)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 12.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if goal.selected {
                Image(systemName: "checkmark")
                    .padding(.trailing, 20)
                    .font(.title3)
                    .bold()
                    .transition(.move(edge: goal.selected ? .trailing : .leading))
                    .opacity(goal.selected ? 1 : 0)
            }
        }
        .frame(maxWidth: .infinity)
        .background(.thinMaterial.opacity(goal.selected ? 0 : 1).blendMode(.luminosity))
        .background(.indigo.opacity(goal.selected ? 1 : 0))
        .cornerRadius(10)
        .onTapGesture {
            withAnimation (.easeInOut(duration: 0.15)) {
                goal.selected.toggle()
            }
        }
    }
}


struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(goal: SignupViewModel().goals[0])
            .padding()
            .preferredColorScheme(.dark)
    }
}
