//
//  StyxlView.swift
//  Styxl
//
//  Created by Kevin Jenkins on 7/30/14.
//  Copyright (c) 2014 somethingPointless. All rights reserved.
//

import UIKit

class StyxlView : UIView {

    var colorSelectorViews  : [UIView] = []
    var styxl               : Styxl

    init(coder aDecoder: NSCoder!) {

        colorSelectorViews  = []
        styxl               = Styxl()
        super.init(coder: aDecoder)
    }

    init(frame: CGRect)  {

        colorSelectorViews  = []
        styxl               = Styxl()
        super.init(frame: frame)
    }

    func setStyxl(styxl: Styxl) {

    }

    func updateSelectorViews() {

    }

    func selectorView(style: String, palette: Palette) -> UIView {

        var view = UIView()
        view.frame = CGRectMake(0.0, 0.0, 320.0, 40.0)

        var styleLabel = UILabel()
        styleLabel.frame = CGRectMake(10.0, 10.0, 100.0, 20.0)
        styleLabel.text = style

        var textField = UITextField()
        textField.frame = CGRectMake(110.0, 10.0, 170.0, 20.0)

        var swatch = UIView(frame: CGRectMake(280.0, 10.0, 30.0, 30.0))
        swatch.backgroundColor = palette.colors[0]

        view.addSubview(styleLabel)
        view.addSubview(textField)
        view.addSubview(swatch)

        return view
    }

}
