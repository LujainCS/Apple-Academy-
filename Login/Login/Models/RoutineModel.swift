import SwiftUI

struct RoutineModel: Identifiable, Codable {
    var id = UUID()
    var title: String
    var image1: String
    var image: String
    var choice: Bool = false
    var image2: Image {
        Image(systemName: image)
    }
}

var RoutineData =
[
    RoutineModel(title: "Food", image1: "Food", image: "fork.knife"),
    RoutineModel(title: "Self Care", image1: "SelfCare", image: "shower"),
    RoutineModel(title: "Water", image1: "Water", image:"drop.fill"),
    RoutineModel(title: "Read", image1: "Read", image:"book"),
    RoutineModel(title: "Sleep", image1: "Sleep", image:"bed.double"),
    RoutineModel(title: "Money", image1: "Money", image: "dollarsign.arrow.circlepath"),
    RoutineModel(title: "Exercise", image1: "Exercise", image:"dumbbell"),
    RoutineModel(title: "Study", image1: "Study", image: "studentdesk")
 ]
