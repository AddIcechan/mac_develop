//
//  UIScrollView + Extension.swift
//  macDev
//
//  Created by ADDICE on 2017/11/16.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

import Cocoa

extension NSScrollView {
    
    /// Scroll to the ducument view top. 
    public
    func scrollToTop() {
        if let documentView = self.documentView {
            if documentView.isFlipped {
                documentView.scroll(.zero)
            } else {
                let maxHeight = max(bounds.height, documentView.bounds.height)
                documentView.scroll(NSPoint(x: 0, y: maxHeight))
            }
        }
    }
    
}
