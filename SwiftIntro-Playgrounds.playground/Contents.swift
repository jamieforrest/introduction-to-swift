//: # Introduction to Swift
//: ## Playgrounds

import Cocoa

// Let's play with mathematics and an in-line graph
let π = 3.14
let reps = Int(π * 2 * 10)
for count in 0...reps {
    sin(Double(count)/10)
}

// Load a full color image directly from within the playground's Resources folder
let codeAndSupply = NSImage(named: "c_and_s.png")

// Create an Image Filter
let monochromeFilter = CIFilter(name:"CIColorMonochrome")
let inputCIImage = CIImage(data:codeAndSupply?.TIFFRepresentation);

// Set some filter parameters.
monochromeFilter.setValue(inputCIImage, forKey:kCIInputImageKey)
monochromeFilter.setValue(CIColor(red: 0.5, green: 0.5, blue: 0.5), forKey:kCIInputColorKey)
monochromeFilter.setValue(1.0, forKey:kCIInputIntensityKey)

// Use the playground to peek at the image now
let outputCIImage = monochromeFilter.outputImage
