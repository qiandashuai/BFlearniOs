//
//  BFLearnIGListDynamicCollectionViewCell.swift
//  BFLearnIOS
//
//  Created by blackstone jericho on 2021/3/25.
//  Copyright © 2021 blackstone jericho. All rights reserved.
//

import UIKit
import SnapKit

final class BFLearnIGListDynamicCollectionViewCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    @objc var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        contentView.backgroundColor = .white
        label.textColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = ceil(size.width)
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
    
}
