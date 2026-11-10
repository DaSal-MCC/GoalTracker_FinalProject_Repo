//
//  GoalDetailView.swift
//  FinalProject_GoalTracker
//
//  Created by student on 10/28/26.
//

import SwiftUI
import SwiftData

struct GoalDetailView: View {
    @Bindable var goal: GoalCard
    @State private var popup = false
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \GoalCard.id) private var goalFrontList: [GoalCard]
    //@State private var goalId = \GoalCard.id
    
    var body: some View {
        
        Form {
            TextField("Title Of Goal", text: $goal.goal)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 50)
            
            TextField("Steps to achieve goal", text: $goal.bulletin)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 50)
            Toggle("Goal Achieved?", isOn: $goal.goalComplete)
            Button("Delete Goal", role: .destructive) {
                popup = true
            }
            
            .alert("Delete goal?", isPresented: $popup) {
                Button("Cancel", role: .cancel) {}
                Button("Delete Goal", role: .destructive)
                {
                    deleteGoal()
                }
            } message: {
                Text("Are you sure you want to delete this goal? This action cannot be undone!")
            }
        }
        .navigationTitle("Edit goal")
    }
    
    private func deleteGoal() {
    //private func deleteGoal(at offsets: IndexSet) {

        var hasher = Hasher()
        //(\GoalCard.id).hash(into: &hasher)
        ($goal.id).hash(into: &hasher)
        let intId = hasher.finalize()
        
//        for index in offsets {
//            if index == intId {
//                modelContext.delete(goalFrontList[index])
//            }
//        }
        
        //modelContext.delete(goalFrontList[intId])
        modelContext.delete(goalFrontList[intId])
    }
}
