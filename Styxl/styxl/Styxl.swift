//
//  Styxl.swift
//  Styxl
//
//  Created by Kevin Jenkins on 7/30/14.
//  Copyright (c) 2014 somethingPointless. All rights reserved.
//

import Foundation
import UIKit

var palettes    : [Palette] = []
var maps        : [String: PaletteMap] = [:]
var styles      : [String: UIColor] = [:]

class Styxl : NSObject {

    init()  {

    }
}

class PaletteMap : NSObject {

    var mapping : [String: Int]
    var palette : Palette

    init()  {

        mapping = [:]
        palette = Palette()
    }

    func colorFor(name: String) -> UIColor {

        var color = self.palette.colors[self.mapping[name]!]
        return  color == nil ? UIColor.whiteColor() : color
    }

}

class Palette : NSObject {

    var colors  : [UIColor] = []
    var name    : String

    init() {
        name = "aPalette"
        colors = [];
    }

    init(name: String, colors: [UIColor]) {
        self.name = name
        self.colors = []
    }

    func addColor(color: UIColor) {

        self.colors.append(color)
    }

    func removeColor(colorToRemove :UIColor) {

        colors = colors.filter( {(color: UIColor) -> Bool in return color != colorToRemove })
    }
}