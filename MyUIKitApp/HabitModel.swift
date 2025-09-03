//
//  HabitModel.swift
//  MyUIKitApp
//
//  Created by Liam Murphy on 2025/07/28.
//
import Foundation

enum HabitFrequency: String {
    case daily
    case weekendly
    case weekdaily
    case weekly
}

struct HabitModel: Hashable {
    var userHabitName: String
    var habitFrequency: HabitFrequency
    var habitCreationDate: Date
    var completionDate: Date? = nil
}

class Day {
    var habitsCompleted: [HabitModel : Bool] = [:]
    var date: Date // Needs to be indexable by this date...?
    var editable: Bool = false
    var isFuture: Bool

    init(habitsCompleted: [HabitModel : Bool], date: Date) {
        self.habitsCompleted = habitsCompleted
        self.date = date
        let calendar = Calendar.current

        if calendar.isDate(self.date, inSameDayAs: Date()) {
            editable = true
        }

        let todaysDay = calendar.startOfDay(for: Date())
        let dateDay = calendar.startOfDay(for: date)
        if todaysDay > dateDay {
            isFuture = false
        }else {
            isFuture = true
        }
    }

    func toggleHabitCompletion(for habit: HabitModel) {
        habitsCompleted[habit] = !(habitsCompleted[habit] ?? false)
    }
}
