//
//  BadgeBackground.swift
//  SwiftUIDemo
//
//  Created by Ray on 2022/3/7.
//

import SwiftUI

struct BadgeBackground: View {
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width,
                                         geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment))
                )
                
                HexagonParameters.segments.forEach {
                    path.addLine(
                        to: CGPoint(
                            x: width * $0.line.x + xOffset,
                            y: height * $0.line.y)
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * $0.curve.x + xOffset,
                            y: height * $0.curve.y),
                        control: CGPoint(
                            x: width * $0.control.x + xOffset,
                            y: height * $0.control.y)
                    )
                }
                
                
            }
            .fill(.linearGradient(
                colors: [Self.gradientStart, Self.gradientEnd],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)))
        }
        .aspectRatio(1.0, contentMode: .fit)
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BadgeBackground()
        }
        .previewLayout(.fixed(width: 375.0, height: 300.0))
    }
}
