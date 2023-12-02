//
//  CaptionableImageView.swift
//  Eulerity
//
//  Created by DJC on 7/5/23.
//

import UIKit

@IBDesignable class CaptionableImageView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var createdOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    
    
    var image: UIImage? {
        get { return imageOutlet.image }
        set { imageOutlet.image = newValue }
    }
    
    var title: String? {
        get { return titleOutlet?.text }
        set { titleOutlet.text = newValue }
    }
    
    var descript: String? {
        get { return descriptionOutlet?.text }
        set { descriptionOutlet.text = newValue }
    }
    
    var created: String? {
        get { return createdOutlet?.text }
        set { createdOutlet.text = newValue }
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "CaptionableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
