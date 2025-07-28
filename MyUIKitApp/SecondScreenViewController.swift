//
//  SecondScreenViewController.swift
//  MyUIKitApp
//
//  Created by Liam Murphy on 2025/06/30.
//

import UIKit

class SecondScreenViewController: UIViewController {
    var imageView: UIImageView!
    var renderer: UIGraphicsImageRenderer!

    override func viewDidLoad() {
        super.viewDidLoad()
        renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        // add UIImage View

        imageView = UIImageView(frame: view.bounds)
        imageView.center = view.center
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
        renderLoop()
    }

    func drawTriangle(pos: CGPoint = .zero) async {
        let image = renderer.image { ctx in
            let rect = CGRect(x: pos.x, y: pos.y, width: 200, height: 200)
            ctx.cgContext.setFillColor(UIColor.blue.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.blue.cgColor)
            ctx.cgContext.setLineDash(phase: 0, lengths: [])

            ctx.cgContext.addRect(rect)
            ctx.cgContext.drawPath(using: .fillStroke)

        }

        imageView.image = image
    }


    func renderLoop() {
        Task {
            var pos: CGPoint = .zero
            while true {
                pos.x += 1
                pos.y += 1

                await self.drawTriangle(pos: pos)
                try? await Task.sleep(nanoseconds: 16_666_667) // ~60 FPS
            }
        }

    }
}
