//
//  CustomLayoutCollectionViewCell.swift
//  pokedex3
//
//  Created by Richard Rodriguez on 5/4/17.
//
//

import UIKit

class CustomLayoutCollectionViewCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
}
