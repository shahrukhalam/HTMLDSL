public enum ContentMode: String {
    case fill
    case aspectFit = "contain"
    case aspectFill = "cover"
    case none
    case aspectFitOrNone = "scale-down"
}
