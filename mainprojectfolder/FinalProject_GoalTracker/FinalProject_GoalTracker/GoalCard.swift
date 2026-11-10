//
//  GoalCard.swift
//  FinalProject_GoalTracker
//
//  Created by student on 10/27/26.
//
import Foundation
import SwiftData

@Model
final class GoalCard {
    var id = UUID()
    var goal: String
    var bulletin: String
    var goalComplete: Bool
    
    init(goal: String, bulletin: String, goalComplete: Bool = false) {
        self.goal = goal
        self.bulletin = bulletin
        self.goalComplete = goalComplete
    }
}
