//
//  Subject.swift
//  iQuiz
//
//  Created by Austin D. Hutchinson on 4/30/17.
//  Copyright © 2017 Austin D. Hutchinson. All rights reserved.
//

import UIKit

class Subject {
    var title: String
    var image: UIImage
    var description: String
    
    init(_ title: String,_ image: UIImage,_ description: String) {
        self.title = title
        self.image = image
        self.description = description
    }
}
