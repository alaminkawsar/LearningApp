//
//  ContentDetailView.swift
//  Learning
//
//  Created by Khayrul on 2/20/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
            VStack {
                
                // only show video if we get a valid URL
                if url != nil {
                    if url != nil {
                        VideoPlayer(player: AVPlayer(url: url!))
                            .cornerRadius(10)
                    }
                }
                
                // Description
                CodeTextView()
                
                if model.hasNextLession() {
                // Next lesson button
                    Button(action: {
                        
                        // Advance the lesson
                        model.nextLesson()
                        
                    }, label: {
                        
                        ZStack {
                            RectangleCard(color: Color.green)
                                .frame(height: 48)
                        
                            Text("Next lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    })
                    
                }
                else {
                    // show the complete button instead
                    Button(action: {
                        
                        // Advance the lesson
                        model.currentContentSelected = nil
                        
                    }, label: {
                        
                        ZStack {
                            RectangleCard(color: Color.green)
                                .frame(height: 48)
                        
                            Text("Completed")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    })
                }
        }
            .navigationTitle(lesson?.title ?? "")
            .padding()
    }
}
