//
//  UIView + Extension.swift
//  macDev
//
//  Created by ADDICE on 2017/11/16.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

import Foundation
import Cocoa

extension NSView {
    
    public
    var backgroundColor : NSColor {
        set {
            self.wantsLayer = true
            self.layer?.backgroundColor = newValue.cgColor
        }
        
        get {
            if let color = self.layer?.backgroundColor {
                return NSColor(cgColor: color)!
            } else {
                return NSColor.white
            }
        }
    }
    
    
}
