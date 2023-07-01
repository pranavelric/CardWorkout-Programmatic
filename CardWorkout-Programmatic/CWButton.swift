//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Pranav Choudhary on 01/07/23.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor:UIColor,title:String,systemImageName:String){
        super.init(frame: .zero)
        
        configuration = .tinted()
        configuration?.title = title
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.baseForegroundColor = backgroundColor
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false // use auto layout
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 5
        configuration?.imagePlacement = .leading
    }

}
