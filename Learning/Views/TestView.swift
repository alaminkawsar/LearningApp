//
//  TestView.swift
//  Learning
//
//  Created by Khayrul on 2/21/22.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        
        if model.currentQuestion != nil {
            
            VStack {
                // Question Number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                // Question
                
                
                //Answer
                
                // Button
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
