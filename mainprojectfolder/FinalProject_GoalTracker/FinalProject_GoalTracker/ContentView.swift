//
//  ContentView.swift
//  FinalProject_GoalTracker
//
//  Created by student on 10/25/26.
//
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \GoalCard.id) private var goalFrontList: [GoalCard]
    @State private var showView = false

    var body: some View {
        VStack(spacing: 15) {
            header()
            Button("+") {
                showView = !showView
            }
            .buttonStyle(.borderedProminent)
        }
        NavigationStack{
            List{
                ScrollView{
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(goalFrontList){goalTab in NavigationLink(value: goalTab){
                        
                            HStack {
                                Text(goalTab.goal)
                                Text(" || ")
                                Text(goalTab.bulletin)
                                Text(" || ")
                                if goalTab.goalComplete{
                                    Text("✅ Complete")
                                }
                                else{
                                    Text("⏱️ In progress")
                                }
                                Text(">")
                                
                            }
                            .padding(3)
                            .frame(width: 400, height: 50)
                        }
                        }
                    }
                }
                
            }
            .navigationDestination(for: GoalCard.self) { goal in GoalDetailView(goal: goal)
            }
            if showView {
                addGoalEditor()
            }
        }
    }
}

//struct goalCard: Identifiable {
//    let id = UUID()
//    let goal: String
//    let bulletin: String
//    let goalComplete: Bool
//}

//let goals: [GoalCard] = [
//    GoalCard(goal: "Learn Xcode", bulletin: "N/A", goalComplete: true),
//    GoalCard(goal: "Complete Sprint 1", bulletin: "N/A", goalComplete: false),
//    GoalCard(goal: "Learn how to connect to Github", bulletin: "N/A", goalComplete: false),
//    GoalCard(goal: "Show the goal list in contentview", bulletin: "N/A", goalComplete: true)
//]

struct header: View {
    @State private var showView = false
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Goal Tracker")
                .font(.largeTitle)
            Text("Track your goals here!")
                .font(.headline)
        }
    }
}

//struct goalView: View{
//    let GoalTab: GoalCard
//    
//    var body: some View {
//        HStack {
//            Text(GoalTab.goal)
//            Text(" || ")
//            Text(GoalTab.bulletin)
//            Text(" || ")
//            if GoalTab.goalComplete{
//                Text("✅ Complete")
//            }
//            else{
//                Text("⏱️ In progress")
//            }
//            
//        }
//        .padding(3)
//        .frame(width: 400, height: 50)
//        .background(.gray)
//    }
//}

struct addGoalEditor: View {
    @Environment(\.modelContext) private var modelContext
    @State private var goalTitle = ""
    @State private var goalBulletinList = ""
    
    var body: some View {
        Text("Add new goal")
            .font(.headline)
        TextField("Title Of Goal", text: $goalTitle)
            .textFieldStyle(.roundedBorder)
            .frame(width: 300, height: 50)
        TextField("Steps to achieve goal", text: $goalBulletinList)
            .textFieldStyle(.roundedBorder)
            .frame(width: 300, height: 50)
        Button("Add goal"){
            addGoal()
        }
        .buttonStyle(.borderedProminent)
    }
    
    private func addGoal() {
        let trimmed = goalTitle.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else {return}
        let trimmed2 = goalBulletinList.trimmingCharacters(in: .whitespaces)
        guard !trimmed2.isEmpty else {return}
        
        modelContext.insert(GoalCard(goal: trimmed, bulletin: trimmed2, goalComplete: false))
        goalTitle = ""
        goalBulletinList = ""
    }
}



#Preview {
    ContentView()
}
