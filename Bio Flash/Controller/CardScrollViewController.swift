//
//  CardScrollViewController.swift
//  Bio Flash
//
//  Created by Kristopher Manceaux on 7/31/18.
//  Copyright © 2018 Kristopher Manceaux. All rights reserved.
//

import Foundation
import UIKit

protocol CanReceive {
    func dataRecieved(data : String)
}

class CardScrollViewController : UIViewController{
    
    var delegate : CanReceive?
    
    let stack = CardStack()
    lazy var numOfCards : Int = stack.cards.count
    let labelHieght = 171
    let labelWidth = 337
    let margin = 5
    var offset = 0
    
    
    lazy var scrollView : UIScrollView = {
       
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = CGFloat(176 * numOfCards)
        view.backgroundColor = .white
        
        
        
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(scrollView)
        setupScrollView()
    }
    
    func setupScrollView(){
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let image = UIImage(named: "27300605837_8c634f461d_b")
//        let background = UIImageView(image: image)
//        background.frame = CGRect(x: 0,y: 0,width: self.view.frame.width, height: self.view.frame.height)
        
        self.scrollView.backgroundColor = UIColor(patternImage: image!)
        
        for i in 0...numOfCards-1{
            
            let button = UIButton()
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(String(i), for: UIControlState.normal)
            button.setTitleColor(.white , for: UIControlState.normal)
            button.backgroundColor = .white
            button.addTarget(self, action: #selector(cardSelected(sender:)), for: UIControlEvents.touchUpInside)
            
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.white
            label.text = self.stack.cards[i].question
            
            
            scrollView.addSubview(button)
            scrollView.addSubview(label)
            
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            button.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat(offset)).isActive = true
            button.widthAnchor.constraint(equalToConstant: 337).isActive = true
            button.heightAnchor.constraint(equalToConstant: 171).isActive = true
            
            label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat(offset)).isActive = true
            offset += (labelHieght + margin)
            label.widthAnchor.constraint(equalToConstant: 337).isActive = true
            label.heightAnchor.constraint(equalToConstant: 171).isActive = true
            
        }
        

    }
    
    @objc func cardSelected(sender: UIButton!){
        delegate?.dataRecieved(data: sender.title(for: .normal)!)
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
