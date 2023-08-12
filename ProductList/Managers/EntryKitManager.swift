//
//  EntryKitManager.swift
//  ProductList
//
//  Created by Cevher Şirin on 12.08.2023.
//

import SwiftEntryKit

class EntryKitManager {
    
    public static func showBottomMessage(title: String,
                                         desc: String,
                                         textColor: EKColor,
                                         imageName: String? = nil) {
        let displayMode = EKAttributes.DisplayMode.inferred
        
        var attributes = EKAttributes.bottomFloat
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 20, offset: .zero))
        attributes.entryBackground = .color(color: EKColor(light: UIColorConstants.shared.bottomMessageColor ?? .blue,
                                                           dark: UIColorConstants.shared.bottomMessageColor ?? .blue))
        attributes.displayDuration = .pi
        
        let title = EKProperty.LabelContent(
            text: title,
            style: .init(
                font: .boldSystemFont(ofSize: 16),
                color: textColor,
                displayMode: displayMode
            ),
            accessibilityIdentifier: "title"
        )
        let description = EKProperty.LabelContent(
            text: desc,
            style: .init(
                font: .systemFont(ofSize: 14),
                color: textColor,
                displayMode: displayMode
            ),
            accessibilityIdentifier: "description"
        )
        var image: EKProperty.ImageContent?
        if let imageName = imageName {
            image = EKProperty.ImageContent(
                image: UIImage(named: imageName)!.withRenderingMode(.alwaysTemplate),
                displayMode: displayMode,
                size: CGSize(width: 35, height: 35),
                tint: textColor,
                accessibilityIdentifier: "thumbnail"
            )
        }
        let simpleMessage = EKSimpleMessage(
            image: image,
            title: title,
            description: description
        )
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
}
