//
//  TestView.swift
//  Learning
//
//  Created by Khayrul on 2/21/22.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var selectedAnswerIndex: Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        
        if model.currentQuestion != nil {
            
            VStack {
                // Question Number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                //Answer
                ScrollView {
                    VStack {
                        ForEach(0..<model.currentQuestion!.answers.count){ index in
                            
                            if index < model.currentQuestion!.answers.count {
                                Button {
                                    // TODO
                                    selectedAnswerIndex = index
                                    
                                } label: {
                                    ZStack {
                                        // Answer is not submitted
                                        if submitted == false {
                                            RectangleCard(color: index == selectedAnswerIndex ?.gray : .white)
                                                .frame(height: 48)
                                        }
                                        else {
                                            // Anser has been submitted
                                            
                                            if ((index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex) || (index == model.currentQuestion!.correctIndex)){
                                                
                                                // show a green background
                                                // User has selected Right anser
                                                RectangleCard(color: Color.green)
                                                    .frame(height: 48)
                                            }
                                            
                                            else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                                
                                                // User has selected the wrong anser
                                                // Show a red background
                                                
                                                RectangleCard(color: Color.red)
                                                    .frame(height: 48)
                                                
                                            }
                                            else {
                                                RectangleCard(color: Color.white)
                                                    .frame(height: 48)
                                            }
                                             
                                        }
                                       
                                        if index < model.currentQuestion!.answers.count {
                                            
                                            Text(model.currentQuestion!.answers[index])
                                        }
                                        else {
                                            Text("Nai")
                                        }
                                        
                                        
                                    }
                                }
                                .disabled(submitted == true)
                            }
                            else {
                                
                            }
                            
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                //Submit Button
                Button {
                    
                    // Check if answer has been submittedd
                    
                    if submitted == true {
                        // Ansswer has already been submitted, move to next question
                        model.nextQuestion()
                        
                        // Reset properties
                        submitted = false
                        selectedAnswerIndex = nil
                    }
                    else {
                        // Submit the answer
                        
                        // Change submitted state to true
                        submitted = true
                                                
                        // Check the anser and increment the counter if correctd
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                    
                    }
                
                    
                } label: {
                    ZStack {
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        Text(buttonText)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .disabled(selectedAnswerIndex == nil)
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            Text("Question is over")
        }
        
       
    }
    
    var buttonText: String {
        // Check if answer has been submitted
        if submitted == true {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                // This is the last question
                return "Finish"
            }
            else {
                return "Next"
            }
        }
        else {
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
        
    }
}
