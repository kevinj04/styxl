//
//  StyxlView.swift
//  Styxl
//
//  Created by Kevin Jenkins on 7/30/14.
//  Copyright (c) 2014 somethingPointless. All rights reserved.
//

import UIKit

class StyxlView : UIView {

    var colorSelectorViews : [UIView] = []

    init(coder aDecoder: NSCoder!) {
        colorSelectorViews = []
        super.init(coder: aDecoder)
    }

    init(frame: CGRect)  {
        colorSelectorViews = []
        super.init(frame: frame)
    }

}
