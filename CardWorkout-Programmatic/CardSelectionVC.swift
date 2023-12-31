//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Pranav Choudhary on 01/07/23.
//
import UIKit

class CardSelectionVC: UIViewController {

    let cardImageView = UIImageView()
    let stopButton    = CWButton(backgroundColor: .red,title: "Stop", systemImageName: "stop.circle")
    let restartButton = CWButton(backgroundColor: .green,title: "Restart", systemImageName: "arrow.clockwise.circle")
    let rulesButton   = CWButton(backgroundColor: .blue,title: "Rules", systemImageName: "list.bullet")
    let allCards      = Card.allValues
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
        
    }
    
    // Set up a timer to periodically call the `showRandomImage` method
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,selector: #selector(showRandomImage),userInfo: nil,repeats: true)
    }
    
    // Display a random card image in the cardImageView
    @objc func showRandomImage(){
        cardImageView.image = allCards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
        
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = allCards.randomElement()
    
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton(){
        view.addSubview(stopButton)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
        
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
    }
    
    func configureRestartButton(){
        view.addSubview(restartButton)
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 30)
        ])
        
        restartButton.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
        
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 30)
        ])
    }
    
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
    }
    
    @objc func stopButtonTapped(){
        timer.invalidate()
    }
    
    @objc func restartButtonTapped(){
        timer.invalidate()
        startTimer()
    }
    
    
    
    
    

}
