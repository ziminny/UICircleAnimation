//
//  File.swift
//  UICircleAnimation
//
//  Created by Vagner Oliveira on 11/01/23.
//

import Foundation

enum ZMStartAngle {
    
    case top
    case left
    case bottom
    case right
    
    var show:CGFloat {
        switch self {
        case .top:
            return -CGFloat.pi / 2
        case .left:
            return CGFloat.pi
        case .bottom:
            return CGFloat.pi / 2
        case .right:
            return 0
        }
    }
}
