//
//  Styxl.swift
//  Styxl
//
//  Created by Kevin Jenkins on 7/30/14.
//  Copyright (c) 2014 somethingPointless. All rights reserved.
//

import Foundation
import UIKit

class PaletteMap : NSObject {

    var mapping : [String: Int]
    var palette : Palette

    init()  {

        mapping = [:]
        palette = Palette()
    }

    init(palette: Palette) {
        mapping = [:]
        self.palette = palette
    }

    init(palette: Palette, names: [String]) {

        self.palette = palette
        self.mapping = [:]
        super.init()
        self.setStyles(names)
    }

    func setStyles(styles: [String]) {
        self.mapping = [:]
        for style in styles {
            self.mapping[style] = 0
        }
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
        self.colors = colors
    }

    func addColor(color: UIColor) {

        self.colors.append(color)
    }

    func removeColor(colorToRemove :UIColor) {

        colors = colors.filter( {(color: UIColor) -> Bool in return color != colorToRemove })
    }
}

class Styxl : NSObject {

    var palettes        : [Palette] = []
    var maps            : [String: PaletteMap] = [:]
    var styles          : [String] = []
    var selectedIndex   : Int = 0

    init()  {

    }

    init(palettes: [Palette], styleNames: [String]) {


        self.palettes   = palettes
        self.styles     = styleNames
        self.maps       = [:]
        super.init()
        self.setStyles(styleNames)
    }

    func colorFor(name: String) -> UIColor? {

        var palatteName = self.currentPaletteName()
        if (palatteName == nil) { return nil; }

        var map = maps[palatteName!]
        return map!.colorFor(name)
    }

    func currentPaletteName() -> String? {
        if (selectedIndex < palettes.count) { return palettes[selectedIndex].name; }
        return nil
    }

    func setStyles(newStyles: [String]) {

        for palette in palettes {
            var map = PaletteMap(palette: palette, names: newStyles)
            maps[palette.name] = map
        }
    }
}