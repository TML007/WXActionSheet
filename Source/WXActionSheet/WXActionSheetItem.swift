//
//  WXActionSheetItem.swift
//  WXActionSheetDemo
//
//  Created by xu.shuifeng on 2018/12/26.
//  Copyright © 2018 shuifeng.me. All rights reserved.
//

import UIKit

public typealias WXActionSheetHandler = ((WXActionSheet) -> Void)

public class WXActionSheetItem {
    
    public enum ItemType {
        case `default`
        case destructive
        case cancel
    }

    public var title: String?
    
    public var titleEdgeInsets: UIEdgeInsets = .zero
    
    public var titleColor: UIColor? = WXActionSheetStyle.light.appearance.buttonTitleColor
    
    public var font: UIFont = UIFont.systemFont(ofSize: 17)
    
    public var desc: String?
    
    public var descColor: UIColor = UIColor(white: 0, alpha: 0.4)
    
    public var iconImage: UIImage?
    
    public var imageEdgeInsets: UIEdgeInsets = .zero
    
    public var type: ItemType = .default
    
    public var handler: WXActionSheetHandler? = nil
    
    public convenience init(title: String) {
        self.init(title: title, handler: nil, type: .default)
    }
    
    public convenience init(title: String, handler: @escaping WXActionSheetHandler) {
        self.init(title: title, handler: handler, type: .default)
    }
    
    public init(title: String, handler: WXActionSheetHandler?, type: ItemType) {
        self.title = title
        self.handler = handler
        self.type = type
    }
    
    public init(title: String, desc: String, handler: WXActionSheetHandler?, type: ItemType = .default) {
        self.title = title
        self.handler = handler
        self.desc = desc
        self.type = type
    }
}
