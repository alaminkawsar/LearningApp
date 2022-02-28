//
//  TestResultView.swift
//  Learning
//
//  Created by Khayrul on 3/1/22.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var numCorrect: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(resultHeading)
                .font(.title)
            
            Spacer()
            
            Text("You got \(numCorrect) of \(model.currentModule?.test.questions.count ?? 0)")
            
            Spacer()
            
            Button{
                
                model.currentTestSelected = nil
                
            } label: {
                ZStack {
                    RectangleCard(color: Color.green)
                        .frame(height: 48)
                    Text("Completed")
                        .bold()
                }
            }
            .padding()
            
            Spacer()
        }
    }
    
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            return ""
        }
        
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome!"
        }
        else if pct > 0.2 {
            return "Doing great!"
            
        }
        else {
            return "Keep Learning"
        }
    }
    
}

