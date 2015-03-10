//
//  UPCViewController.swift
//  COSBOX_1.0
//
//  Created by Justin on 3/7/15.
//  Copyright (c) 2015 Justin Bastawrose. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import CoreData
import RSBarcodes

class UPCViewController: RSCodeReaderViewController {
    
//    @IBOutlet var window: UIWindow!
//    @IBOutlet var viewController: UPCViewController!
//    @IBOutlet var toggle: UIButton!
    
    //var delegate: barcodesScannedDelegate?
//    
//    @IBAction func close(sender: AnyObject?) {
//        println("close called.")
//    }
//    
//    @IBAction func toggle(sender: AnyObject?) {
//        self.toggleTorch()
//    }
    
    var vPreviewLayer: AVCaptureVideoPreviewLayer?
//    var highlightView   : UIView = UIView()
    
    var ticker: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Scan Item"
        
        self.focusMarkLayer.strokeColor = UIColor.redColor().CGColor
        self.cornersLayer.strokeColor = UIColor.yellowColor().CGColor
        
        let types = NSMutableArray(array: self.output.availableMetadataObjectTypes)
        types.removeObject(AVMetadataObjectTypeQRCode)
        self.output.metadataObjectTypes = NSArray(array: types)
        
//        // Allow the view to resize freely
//        self.highlightView.autoresizingMask =   UIViewAutoresizing.FlexibleTopMargin |
//            UIViewAutoresizing.FlexibleBottomMargin |
//            UIViewAutoresizing.FlexibleLeftMargin |
//            UIViewAutoresizing.FlexibleRightMargin
//        
//        // Select the color you want for the completed scan reticle
//        self.highlightView.layer.borderColor = UIColor.greenColor().CGColor
//        self.highlightView.layer.borderWidth = 3
//        
//        // Add it to our controller's view as a subview.
//        self.view.addSubview(self.highlightView)
        
        // MARK: NOTE: If you layout views in storyboard, you should these 3 lines
//        for subview in self.view.subviews {
//            self.view.bringSubviewToFront(subview as UIView)
//        }
        
//        if !self.hasTorch() {
//            self.toggle.enabled = false
//        }
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        self.navigationController?.navigationBarHidden = false
//    }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        self.navigationController?.navigationBarHidden = false
//    }
    
    // This is called when we find a known barcode type with the camera.
//    override func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
//        //super.captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!)
//        
//        var highlightViewRect = CGRectZero
//        
//        var barCodeObject : AVMetadataObject!
//        
//        var detectionString : String!
//        
//        let barCodeTypes = [AVMetadataObjectTypeUPCECode,
//            AVMetadataObjectTypeCode39Code,
//            AVMetadataObjectTypeCode39Mod43Code,
//            AVMetadataObjectTypeEAN13Code,
//            AVMetadataObjectTypeEAN8Code,
//            AVMetadataObjectTypeCode93Code,
//            AVMetadataObjectTypeCode128Code,
//            AVMetadataObjectTypePDF417Code,
//            AVMetadataObjectTypeQRCode,
//            AVMetadataObjectTypeAztecCode
//        ]
//        
//        // The scanner is capable of capturing multiple 2-dimensional barcodes in one scan.
//        for metadata in metadataObjects {
//            
//            for barcodeType in barCodeTypes {
//                
//                if metadata.type == barcodeType {
//                    if let l = self.vPreviewLayer {
//                        barCodeObject = l.transformedMetadataObjectForMetadataObject(metadata as AVMetadataMachineReadableCodeObject)
//                        
//                        highlightViewRect = barCodeObject.bounds
//                        
//                        detectionString = (metadata as AVMetadataMachineReadableCodeObject).stringValue
//                        
//                        self.session.stopRunning()
//                        break
//                    }
//                }
//            }
//        }
//        
//        self.highlightView.frame = highlightViewRect
//        self.view.bringSubviewToFront(self.highlightView)
//        
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            println(detectionString)
//            self.navigationController?.popViewControllerAnimated(true)
//        })
//    }
    
    override func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        var barcodeObjects : Array<AVMetadataMachineReadableCodeObject> = []
        var cornersArray : Array<[AnyObject]> = []
        for metadataObject : AnyObject in metadataObjects {
            if let l = self.videoPreviewLayer {
                let transformedMetadataObject = l.transformedMetadataObjectForMetadataObject(metadataObject as AVMetadataObject)
                if transformedMetadataObject.isKindOfClass(AVMetadataMachineReadableCodeObject.self) {
                    let barcodeObject = transformedMetadataObject as AVMetadataMachineReadableCodeObject
                    barcodeObjects.append(barcodeObject)
                    cornersArray.append(barcodeObject.corners)
                    
                    scannedBarcode = barcodeObject.stringValue
                    self.session.stopRunning()
                    break
                }
            }
        }
        
        self.cornersLayer.cornersArray = cornersArray
        
//        if barcodeObjects.count > 0 {
//            if let h = self.barcodesHandler {
//                h(barcodeObjects)
//            }
//        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            if let t = self.ticker {
                t.invalidate()
            }
            self.ticker = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "onTick", userInfo: nil, repeats: true)
            
            println(scannedBarcode)
            self.navigationController?.popViewControllerAnimated(true)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}




