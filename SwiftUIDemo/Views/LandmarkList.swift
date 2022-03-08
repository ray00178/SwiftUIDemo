//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by Ray on 2022/2/19.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly: Bool = false
    
    var filterLandmarks: [Landmark] {
        modelData.landmarks.filter {
            (!showFavoritesOnly || $0.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            // Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
            /*List(filterLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landrk: landmark)
                }
            }*/
            
            // Section 3 step 2
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filterLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landrk: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        // 同時間預覽不同裝置
        ForEach(["iPhone SE (2nd generation)", "iPhone 13 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environmentObject(ModelData())
        }
        
    }
}
