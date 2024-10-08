//
//  WXScrollActionSheetItemView.swift
//  WXActionSheet
//
//  Created by xushuifeng on 2020/7/23.
//

import UIKit

public protocol WXScrollActionSheetItemViewDelegate: AnyObject {
    
    func scrollActionSheetItemView(_ itemView: WXScrollActionSheetItemView,
                                   didTappedWithItem item: WXScrollActionSheetItem)
    
}

public class WXScrollActionSheetItemView: UIView {
    
    public weak var delegate: WXScrollActionSheetItemViewDelegate?
    
    private let titleLabel: UILabel
    
    private let iconButton: UIButton
    
    public let item: WXScrollActionSheetItem
    
    init(item: WXScrollActionSheetItem) {
        self.item = item
        titleLabel = UILabel()
        titleLabel.text = item.title
        titleLabel.textColor = item.titleColor
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        iconButton = UIButton(type: .custom)
        iconButton.setImage(item.iconImage, for: .normal)
        
        super.init(frame: .zero)
        
        addSubview(titleLabel)
        addSubview(iconButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        iconButton.frame = CGRect(x: (bounds.width - 56.0)/2.0,
                                  y: 0,
                                  width: 56,
                                  height: 56)
        
        titleLabel.frame = CGRect(x: 0,
                                  y: 60,
                                  width: bounds.width,
                                  height: bounds.height - 60)
    }
    
    @objc func onTap() {
        delegate?.scrollActionSheetItemView(self, didTappedWithItem: item)
    }
    
    func reloadData() {
        
    }
}
