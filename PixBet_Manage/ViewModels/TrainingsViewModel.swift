//
//  TainingsViewModel.swift
//  PixBet_Manage
//
//  Created by Роман on 31.10.2024.
//

import Foundation
import CoreData

final class TrainingsViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    //MARK: - Training propertyes
    @Published var trainings: [Training] = []
    @Published var simpleTraining: Training?
    
    @Published var simpleTitle: String = ""
    @Published var simpleDescription: String = ""
    @Published var simpleType = TrainingType.other
    @Published var simpleTypeString = ""
    @Published var simpleComplexity = ComplexityTraining.easy
    
    @Published var chooseTypeTraining = "All"
    @Published var sortTrainings: [Training] = []
    @Published var isEditTraining: Bool = false
    
    //MARK: - Exercises propertyes
    @Published var exercises: [Exercise] = []
    
    @Published var simpleTitleExercise: String = ""
    
    @Published var simpleExercises: [String] = []
    @Published var countTask = 0
    
    init() {
        fetchTrainings()
    }
    
    //MARK: - Edit data
    func completeExercise(exercise: Exercise){
        exercise.complited.toggle()
        saveExercise()
    }
    
    func editTraining(){
        if let trainingEdit = trainings.first(where: {$0.id == simpleTraining?.id}){
            trainingEdit.title = simpleTitle
            trainingEdit.descript = simpleDescription
            trainingEdit.type = simpleTypeString
            trainingEdit.complexity = simpleComplexity.tite
            if let exercise = trainingEdit.exercise?.allObjects as? [Exercise] {
                for ex in exercise {
                    manager.context.delete(ex)
                }
            }
            for exercise in simpleExercises{
                addExercise(training: trainingEdit, exerciseTitle: exercise)
            }
        }
        saveTraining()
        clearExercise()
        clearTraining()
        isEditTraining = false
        
    }
    
    //MARK: - Feel simple data
    func getEditTraining(training: Training){
        simpleTitle = training.title ?? ""
        simpleDescription = training.descript ?? ""
        simpleType = getTypeTraining(stringType: training.type ?? "Other")
        simpleComplexity = getComplexityTraining(complexityString: training.complexity ?? "Hard")
        if let exercises = training.exercise?.allObjects as? [Exercise] {
            simpleExercises = []
            for ex in exercises {
                simpleExercises.append(ex.title ?? "")
            }
        }
        countTask = simpleExercises.count
    }
    
    func getComplexityTraining(complexityString: String) -> ComplexityTraining{
        switch complexityString {
        case "Easy": return ComplexityTraining.easy
        case "Average": return ComplexityTraining.average
        default:
            return ComplexityTraining.hard
        }
    }
    
    func getTypeTraining(stringType: String) -> TrainingType{
        switch stringType {
        case "All": return TrainingType.all
        case "Cardio": return TrainingType.cardio
        case "Specific": return TrainingType.specific
        case "Group classes": return TrainingType.groupClasses
        case "Flexibility and stretching": return TrainingType.flexibilityAndStretching
        case "Endurance": return TrainingType.endurance
        case "Recovery": return TrainingType.recovery
        case "Power": return TrainingType.power
            
        default:
            return TrainingType.other
        }
    }
    
    //MARK: - Delete data
    func deleteTraining(training: Training){
        if let exercise = training.exercise?.allObjects as? [Exercise] {
            for ex in exercise {
                manager.context.delete(ex)
            }
        }
        manager.context.delete(training)
        saveExercise()
        saveTraining()
        clearExercise()
        clearTraining()
    }
    
    //MARK: -   AddOneMoreExerciseCell
    func addCelltask(){
        simpleExercises.append(simpleTitleExercise)
            countTask += 1
    }
    
    //MARK: - Soring trainins
    func filterTrainings(){
        print("filterTrainings: \(chooseTypeTraining)")
        sortTrainings.removeAll()
        for training in trainings {
            if training.type == chooseTypeTraining {
                sortTrainings.append(training)
            }
        }
    }
    
    //MARK: - Add data
    func addExercise(training: Training, exerciseTitle: String){
        let exercise = Exercise(context: manager.context)
        exercise.title = exerciseTitle
        exercise.complited = false
        exercise.training = training
        saveExercise()
        clearExercise()
    }
    
    func addTraining(){
        let training = Training(context: manager.context)
        training.title = simpleTitle
        training.descript = simpleDescription
        training.type = simpleTypeString
        training.complexity = simpleComplexity.tite
        for exercise in simpleExercises{
            addExercise(training: training, exerciseTitle: exercise)
        }
        saveTraining()
        clearTraining()
    }
    
    //MARK: - Save Data
    private func saveExercise(){
        exercises.removeAll()
        manager.save()
        fetchExercises()
    }
    
    private func saveTraining(){
        trainings.removeAll()
        manager.save()
        fetchTrainings()
    }
    
    //MARK: - Fetch data
    private func fetchExercises(){
        let request = NSFetchRequest<Exercise>(entityName: "Exercise")
        do{
            exercises = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching exercises: \(error)")
        }
    }
    
    private func fetchTrainings() {
        let request = NSFetchRequest<Training>(entityName: "Training")
        do{
            trainings = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching trainings: \(error)")
        }
    }
    
    //MARK: Clear data
    private func clearTraining(){
        simpleTitle = ""
        simpleDescription = ""
        simpleType = TrainingType.other
        simpleComplexity = ComplexityTraining.easy
    }
    
    private func clearExercise(){
        simpleTitleExercise = ""
    }
}
