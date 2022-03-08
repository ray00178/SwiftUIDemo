//
//  CircleImageView.swift
//  SwiftUIDemo
//
//  Created by Ray on 2022/2/11.
//

import SwiftUI

struct CircleImageView: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.orange, lineWidth: 4.0)
            }
            .shadow(radius: 10.0)
            
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleImageView(image: Image("large-nasa-taiwan"))
        }
    }
}
