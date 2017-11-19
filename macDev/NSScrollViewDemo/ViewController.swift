//
//  ViewController.swift
//  NSScrollViewDemo
//
//  Created by ADDICE on 2017/11/16.
//  Copyright © 2017年 ADDICE. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    lazy var bgScrollView: NSScrollView = {
        let scrollView = NSScrollView()
        
        // scrollerStyle。overlay / legacy。 overlay 的效果，则是 scroller 背景透明，而 legacy 则是 独立出 scroller 的区域，看起来比较丑～～个人觉得😂
        scrollView.scrollerStyle = .overlay
        
        // 滚动条的显示。用 IB 创建 scrollview 时，以下两个参数均为 true。但是 code 创建 scrollview 时，以下两个参数默认均为 false。很奇怪的设计。
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
        
        // 滚动条的样式：light、 dark、default。default 的话，其实就是 dark
        scrollView.scrollerKnobStyle = .dark
        
        //  bounce 的效果。elasticity 是弹性的含义。automatic\allowed\none。
        scrollView.horizontalScrollElasticity = .automatic
        scrollView.verticalScrollElasticity = .automatic
        
        scrollView.contentInsets = NSEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        scrollView.scrollerInsets = NSEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgScrollView)
        let contentView = NSView(frame: NSRect(x: 0, y: 0, width: 1000, height: 1000))
        contentView.backgroundColor = .yellow
        
        bgScrollView.documentView = contentView
        
        // 因为 坐标系起点 是在 左下角。因此想要让内容 起点 在左上角。可以选择进行 滚动 到底部，即 scrollview.documentView?.scroll(xxx)。为此，扩展一个方法。
        bgScrollView.scrollToTop()
        
    }
    
    override func viewWillLayout() {
        super.viewWillLayout()
        bgScrollView.frame = view.bounds
    }

}

