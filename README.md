# HTMLDSL

## What's a DSL:
It stands for Domain Specific Language.

Purpose: DSL solves a particular problem for everyone even for the ones with very little knowledge on a particular domain.  

If you are an Apple Developer, then you would probably know about `Podfile` which is a DSL written in Ruby.  

Here we are trying to build one for HTML in Pure Swift which we all love.

## Features:
✅ Unit Tested

✅ Experience SwiftUI like Syntax  

✅ Type Safety  

✅ Auto Completion  

✅ Compile Time Error  

✅ Easy to Read & Debug  

✅ Create Websites without any knowledge of HTML, in pure Swift

## Currently Supports:

### Elements:
- Document
- HTML
- Head
    - Title
    - Meta
- Body
    - Headings
    - Paragraphs
    - Image
    - Link with Text & Image
### Attributes:
- Background Color
- Foreground Color
- Width
- Height
- Font Sizes
- Web Safe Font Families
- Text Alignment
- Text Formatting
- Target for Links

## Example:
```
let description =
    """
(born 6 February 1992) is a Canadian dancer, model, actress, and singer who is best known for her work in the Indian film industry. She has appeared in Hindi, Telugu, Malayalam and Tamil language films.
She made her film debut in the Bollywood film Roar: Tigers of the Sundarbans. She gained popularity in Telugu cinema by doing item numbers in films like Temper, Baahubali: The Beginning and Kick 2 and has also starred in two Malayalam films, Double Barrel and Kayamkulam Kochunni.
"""

let index = Document {
    HTML {
        Head {
            Title("My Website")
            Meta([.characterSet(.utf8),
                  .name(.author, content: "Shahrukh Alam")])
        }

        Body {
            Headings("Nora Fatehi")
                .foregroundColor(.DeepPink)
                .font(size: .relativeToViewportWidth(4))
            Paragraphs("Nora Fatehi ".bold + description)
                .backgroundColor(.GhostWhite)
                .font(size: .percentage(125),
                      family: .monospace([.CourierNew, .Courier, .monospace]))
                .align(.justify)
            Image("Images/nora.jpg", alternateText: "Nora Fatehi")
                .size(width: .percentage(30))
            Link(text: "Nora Fatehi Instagram Handle",
                 url: "https://www.instagram.com/norafatehi/?hl=en")
                .target(.newWindowOrTab)
        }
    }
}
```
Above code generates below HTML Page:

![Index Page](Pages/Images/index.png)
