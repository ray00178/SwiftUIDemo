//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Ray on 2022/2/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                // A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn’t have the environmentObject(_:) modifier.
                .environmentObject(ModelData())
        }
    }
}
