<p align="center"><img width=60% src="https://github.com/SKOx0/Emity/blob/master/Images/logo.png"></p>

<div align="center">
  <!-- Language -->
  <a href="https://img.shields.io/badge/Swift-4.2-yellow.svg?style=flat-square">
    <img src="https://img.shields.io/badge/Swift-4.2-yellow.svg?style=flat-square"
      alt="Swift" />
  </a>
  <!-- Dependencies -->
  <a href="https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg?style=flat-square">
    <img src="https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg?style=flat-square"
      alt="Dependencies" />
  </a>
  <!-- Issues -->
  <a href="https://github.com/SKOx0/Emity/issues">
    <img src="https://img.shields.io/github/issues/SKOx0/Emity.svg?style=flat-square"
      alt="Issues" />
  </a>
  <!-- License -->
  <a href="https://img.shields.io/github/license/SKOx0/Emity.svg?style=flat-square">
    <img src="https://img.shields.io/github/license/SKOx0/Emity.svg?style=flat-square"
      alt="License" />
  </a>
</div>

## Table of Contents
- [Example](#example)
- [Installation](#installation)
- [Support](#support)

## Example

### Basic usage
```swift
import Emity

class MyClass {
    let eventEmitter = Emity()

    override func viewDidLoad(){
        super.viewDidLoad()

        eventEmitter.on('complete', {
            debugPrint("Hey!! I completed my work!")
        })
    }

    func completeMyWork(){
        eventEmitter.emit('complete')
    }
}
```

### Passing data to listener
```swift
import Emity

class MyClass {
    let eventEmitter = Emity()

    override func viewDidLoad(){
        super.viewDidLoad()

        eventEmitter.on('complete', { data in
            debugPrint("Hey!! I completed my work!")
            debugPrint("\(data) World!!!")
        })
    }

    func completeMyWork(){
        eventEmitter.emit('complete', data: "Hello")
    }
}
```