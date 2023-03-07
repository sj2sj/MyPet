//
//  ViewController.swift
//  MyPet
//
//  Created by 뜌딩 on 2023/03/01.
//

import UIKit

class ViewController: UIViewController {
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  @IBAction func goPetVC(_ sender: UIButton) {
     
    guard let petVC = storyboard?.instantiateViewController(withIdentifier: "PetViewController") as? PetViewController else { return }

    // Pet 분기
    switch sender.currentTitle! {
    case "댕":
      petVC.myPet = Dog()
    case "냥":
      petVC.myPet = Cat()
    case "짹":
      petVC.myPet = Bird()
    default:
      return
    }

    
//    guard let petVC2 = storyboard?.instantiateViewController(identifier: "PetViewController") else { return }
    
    //화면 넘어가기
    navigationController?.pushViewController(petVC, animated: true)
  }
  

  
  

}

