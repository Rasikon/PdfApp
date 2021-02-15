//
//  ViewController.swift
//  PdfApp
//
//  Created by Rasikon on 15.02.2021.
//

import UIKit
import SimplePDF

class ViewController: UIViewController {
    
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var fourthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let a4PaperSize = CGSize(width: 595, height: 842)
        let pdf = SimplePDF(pageSize: a4PaperSize)
        
        pdf.setContentAlignment(.center)
        pdf.addText(firstLabel.text ?? "")
        pdf.addLineSpace(30)
        
        pdf.setContentAlignment(.center)
        pdf.addText(secondLabel.text ?? "")
        pdf.addLineSeparator()
        pdf.addLineSpace(20.0)
        
        pdf.setContentAlignment(.center)
        pdf.addText(thirdLabel.text ?? "")
        pdf.addLineSpace(20.0)
        
        let documentsFileName = "sample1.pdf"
        let dst = URL(fileURLWithPath: NSTemporaryDirectory().appending(documentsFileName))
        
        let pdfData = pdf.generatePDFdata()
        
        do{
            try pdfData.write(to: dst, options: .atomic)
                print(NSTemporaryDirectory())
                print("\nThe generated pdf can be found at:")
                print("\n\t\(documentsFileName)\n")
            }catch{
                print(error)
            }
    }
}

