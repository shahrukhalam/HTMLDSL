//
//  Color.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 15/11/20.
//

import Foundation

enum Color: CustomStringConvertible {
    case html(HTMLColor)
    case rgba(red: Int, green: Int, blue: Int, alpha: Float)
    case hexWithHash(String)

    var description: String {
        switch self {
        case .html(let color):
            return color.rawValue
        case let .rgba(red, green, blue, alpha):
            return "rgba(\(red), \(green), \(blue), \(alpha))"
        case .hexWithHash(let value):
            return value
        }
    }
}

extension Color {
    static var TableBackgroundColor: Color {
        return .rgba(red: 240, green: 240, blue: 240, alpha: 1.0) // #F0F0F0
    }
}

// Color Names Supported by All Browsers: https://www.w3schools.com/colors/colors_names.asp
enum HTMLColor: String {
    case AliceBlue
    case AntiqueWhite
    case Aqua
    case Aquamarine
    case Azure
    case Beige
    case Bisque
    case Black
    case BlanchedAlmond
    case Blue
    case BlueViolet
    case Brown
    case BurlyWood
    case CadetBlue
    case Chartreuse
    case Chocolate
    case Coral
    case CornflowerBlue
    case Cornsilk
    case Crimson
    case Cyan
    case DarkBlue
    case DarkCyan
    case DarkGoldenRod
    case DarkGray
    case DarkGrey
    case DarkGreen
    case DarkKhaki
    case DarkMagenta
    case DarkOliveGreen
    case DarkOrange
    case DarkOrchid
    case DarkRed
    case DarkSalmon
    case DarkSeaGreen
    case DarkSlateBlue
    case DarkSlateGray
    case DarkSlateGrey
    case DarkTurquoise
    case DarkViolet
    case DeepPink
    case DeepSkyBlue
    case DimGray
    case DimGrey
    case DodgerBlue
    case FireBrick
    case FloralWhite
    case ForestGreen
    case Fuchsia
    case Gainsboro
    case GhostWhite
    case Gold
    case GoldenRod
    case Gray
    case Grey
    case Green
    case GreenYellow
    case HoneyDew
    case HotPink
    case IndianRed
    case Indigo
    case Ivory
    case Khaki
    case Lavender
    case LavenderBlush
    case LawnGreen
    case LemonChiffon
    case LightBlue
    case LightCoral
    case LightCyan
    case LightGoldenRodYellow
    case LightGray
    case LightGrey
    case LightGreen
    case LightPink
    case LightSalmon
    case LightSeaGreen
    case LightSkyBlue
    case LightSlateGray
    case LightSlateGrey
    case LightSteelBlue
    case LightYellow
    case Lime
    case LimeGreen
    case Linen
    case Magenta
    case Maroon
    case MediumAquaMarine
    case MediumBlue
    case MediumOrchid
    case MediumPurple
    case MediumSeaGreen
    case MediumSlateBlue
    case MediumSpringGreen
    case MediumTurquoise
    case MediumVioletRed
    case MidnightBlue
    case MintCream
    case MistyRose
    case Moccasin
    case NavajoWhite
    case Navy
    case OldLace
    case Olive
    case OliveDrab
    case Orange
    case OrangeRed
    case Orchid
    case PaleGoldenRod
    case PaleGreen
    case PaleTurquoise
    case PaleVioletRed
    case PapayaWhip
    case PeachPuff
    case Peru
    case Pink
    case Plum
    case PowderBlue
    case Purple
    case RebeccaPurple
    case Red
    case RosyBrown
    case RoyalBlue
    case SaddleBrown
    case Salmon
    case SandyBrown
    case SeaGreen
    case SeaShell
    case Sienna
    case Silver
    case SkyBlue
    case SlateBlue
    case SlateGray
    case SlateGrey
    case Snow
    case SpringGreen
    case SteelBlue
    case Tan
    case Teal
    case Thistle
    case Tomato
    case Turquoise
    case Violet
    case Wheat
    case White
    case WhiteSmoke
    case Yellow
    case YellowGreen
}
