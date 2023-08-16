import SwiftUI
class RoutineViewModel: ObservableObject {
    
    @Published var newSelectedRoutines: [RoutineModel] = []
    @Published var showAlert: Bool = false
    @Published var routines: [RoutineModel] = RoutineData
    
    @Published var selectedRoutines: [RoutineModel] = {
        if let data = UserDefaults.standard.data(forKey: "SelectedRoutines") {
            let decoder = JSONDecoder()
            if let decodedRoutines = try? decoder.decode([RoutineModel].self, from: data) {
                return decodedRoutines
            }
        }
        return []
    }()
    
    func selectRoutine(at index: Int) {
        if let _ = selectedRoutines.firstIndex(where: { $0.id == routines[index].id }) {
            showAlert = true
        } else {
            routines[index].choice = true
            let routine = routines[index]
            
            selectedRoutines.append(routine)
            newSelectedRoutines.append(routine)
     
        }
        saveSelectedRoutines()
    }
    
    func saveSelectedRoutines() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(selectedRoutines) {
            UserDefaults.standard.set(encodedData, forKey: "SelectedRoutines")
        }
    }
    
    func deselectNewRoutines() {
        for routine in newSelectedRoutines {
            if let index = selectedRoutines.firstIndex(where: { $0.id == routine.id }) {
                selectedRoutines.remove(at: index)
            }
            if let index = routines.firstIndex(where: { $0.id == routine.id }) {
                routines[index].choice = false
            }
        }
        newSelectedRoutines.removeAll()
        saveSelectedRoutines()
    }

}// end RoutineViewModel class
