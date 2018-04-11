//
//  ChatMessageCell.swift
//  SwiftChat
//
//  Created by Jon Reed on 1/25/18.
//  Copyright © 2018 Jon Reed. All rights reserved.
//

import UIKit

/// Custom syling class for the layout of each chat message cell in the chat view
class ChatMessageCell: UICollectionViewCell {
    
    
    static let blueColor = UIColor(r: 0, g: 137, b: 249)
    
    // Text view and styling
    let textView: UITextView = {
        let text = UITextView()
        text.text = ""
        text.font = UIFont.systemFont(ofSize: 16)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = UIColor.clear
        text.textColor = .white
        text.isEditable = false
        return text
    }()
    
    // Chat bubble styling
    let chatBubbleVIew: UIView = {
        let view = UIView()
        view.backgroundColor = blueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    // Initialize anchors for the chat bubbles
    var bubbleWidthAnchor: NSLayoutConstraint?
    var bubbleViewRightAnchor: NSLayoutConstraint?
    var bubbleViewLeftAnchor: NSLayoutConstraint?

    let chatIMGView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // Initializer function will instantiate this view, set up view constraints and positioning on the screen
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(chatBubbleVIew)
        addSubview(textView)
        addSubview(chatIMGView)
        
        //x,y,w,h
        chatIMGView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        chatIMGView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        chatIMGView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        chatIMGView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        bubbleViewRightAnchor = chatBubbleVIew.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
            
        bubbleViewRightAnchor?.isActive = true
        
        bubbleViewLeftAnchor = chatBubbleVIew.leftAnchor.constraint(equalTo: chatIMGView.rightAnchor, constant: 8)
    
        chatBubbleVIew.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bubbleWidthAnchor = chatBubbleVIew.widthAnchor.constraint(equalToConstant: 200)
        bubbleWidthAnchor?.isActive = true
        chatBubbleVIew.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        

        textView.leftAnchor.constraint(equalTo: chatBubbleVIew.leftAnchor, constant: 8).isActive = true
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: chatBubbleVIew.rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
