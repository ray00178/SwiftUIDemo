//
//  LandmarkRow.swift
//  SwiftUIDemo
//
//  Created by Ray on 2022/2/19.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landrk: Landmark
    
    var body: some View {
        HStack {
            landrk.image
                .resizable()
                .frame(width: 50.0, height: 50.0)
            Text(landrk.name)
            
            Spacer()
            
            if landrk.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landrk: landmarks[0])
            LandmarkRow(landrk: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
