//
//  FontFamily.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 16/11/20.
//

import Foundation

public enum FontFamily {
    case apple([Apple])
    case serif([Serif])
    case sansSerif([SansSerif])
    case monospace([Monospace])

    public var description: String {
        switch self {
        case .apple(let fonts):
            return fonts.map { $0.rawValue }.joined(separator: ", ")
        case .serif(let fonts):
            return fonts.map { $0.rawValue }.joined(separator: ", ")
        case .sansSerif(let fonts):
            return fonts.map { $0.rawValue }.joined(separator: ", ")
        case .monospace(let fonts):
            return fonts.map { $0.rawValue }.joined(separator: ", ")
        }
    }
    
    public enum Apple: String {
        case SFPro = "system-ui"
        case SFProRounded = "ui-rounded"
        case NewYork = "ui-serif"
        case notion = "ui-sans-serif, -apple-system, BlinkMacSystemFont, \"Segoe UI\", Helvetica, \"Apple Color Emoji\", Arial, sans-serif, \"Segoe UI Emoji\", \"Segoe UI Symbol\""
        case SFMono = "ui-monospace"
    }

    public enum Serif: String {
        case serif
        case Georgia
        case Palatino
        case PalatinoLinotype = "Palatino Linotype"
        case BookAntiqua = "Book Antiqua"
        case Times
        case TimesNewRoman = "Times New Roman"
    }

    public enum SansSerif: String {
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
        case Poppins
    }

    public enum Monospace: String {
        case monospace
        case Courier
        case CourierNew = "Courier New"
        case LucidaConsole = "Lucida Console"
        case Monaco
    }
}
