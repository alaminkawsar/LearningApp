//
//  ContentView.swift
//  Learning
//
//  Created by Khayrul on 2/18/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                            
                            VStack (spacing: 20){
                                // Learning Card
                                NavigationLink(
                                    destination: ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                            print(String(module.id) + "Learning Card Module ID")
                                        }),
                                    
                                    tag: module.id,
                                    selection: $model.currentContentSelected) {
                                        
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                        
                                    }
                                
            
                                // Test Card
                                NavigationLink (
                                    destination:
                                        TestView()
                                        .onAppear(perform: {
                                            model.beginTest(module.id)
                                            print(module.id)
                                        }),
                                    tag: module.id,
                                    selection: $model.currentTestSelected) {
                                        HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                                    }
                                
                                NavigationLink(destination: EmptyView()) {
                                    EmptyView()
                                }
                    
                            }
                            
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
