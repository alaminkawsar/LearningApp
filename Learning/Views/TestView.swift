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
                                        
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex{
                                            
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
                                        
                                        else if index == model.currentQuestion!.correctIndex {
                                            
                                            // This button is the correct answer
                                            // Show a green background
                                            RectangleCard(color: Color.green)
                                                .frame(height: 48)
                                        }
                                        else {
                                            RectangleCard(color: Color.white)
                                                .frame(height: 48)
                                        }
                                         
                                    }
                                     
                                     
                                    
                                    Text(model.currentQuestion!.answers[index])
                                    
                                }
                            }
                            .disabled(submitted == true)
                            
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                //Submit Button
                Button {
                    
                    //Submitted state is true
                    submitted = true
                    
                    // Check the answer and increment the counter if correct
                    
                    if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                        numCorrect += 1
                    }
                
                    
                } label: {
                    ZStack {
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        Text("Submit")
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
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
        
    }
}
