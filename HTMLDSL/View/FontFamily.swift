//
//  FontFamily.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

enum FontFamily {
    case serif([Serif])
    case sansSerif([SansSerif])
    case monospace([Monospace])

    var description: String {
        switch self {
        case .serif(let fonts):
            return fonts.map { $0.rawValue }.joined(separator: ", ")
        case .sansSerif(let fonts):
            return fonts.map { $0.rawValue }.joined(separator: ", ")
        case .monospace(let fonts):
            return fonts.map { $0.rawValue }.joined(separator: ", ")
        }
    }

    enum Serif: String {
        case serif
        case Georgia
        case Palatino
        case PalatinoLinotype = "Palatino Linotype"
        case BookAntiqua = "Book Antiqua"
        case Times
        case TimesNewRoman = "Times New Roman"
    }

    enum SansSerif: String {
        case sansSerif = "sans-serif"
        case SFProDisplay = "SF Pro Display"
        case SFProIcons = "SF Pro Icons"
        case Arial
        case Helvetica
        case HelveticaNeue = "Helvetica Neue"
        case ArialBlack = "Arial Black"
        case Gadget
        case ComicSansMS = "Comic Sans MS"
        case cursive
        case Impact
        case Charcoal
        case LucidaSansUnicode = "Lucida Sans Unicode"
        case LucidaGrande = "Lucida Grande"
        case Tahoma
        case Geneva
        case TrebuchetMS = "Trebuchet MS"
        case Verdana
    }

    enum Monospace: String {
        case monospace
        case Courier
        case CourierNew = "Courier New"
        case LucidaConsole = "Lucida Console"
        case Monaco
    }
}
