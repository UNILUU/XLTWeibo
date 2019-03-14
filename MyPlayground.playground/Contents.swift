//: Playground - noun: a place where people can play

import UIKit


extension UIView {
    func printSubView(){
        printSubViewH(self, "")
    }
    private func printSubViewH(_ view: UIView, _ str: String){
        print(str + view.description)
        let nextstr = str + "   "
        for view in view.subviews{
            printSubViewH(view, nextstr)
        }
    }
}


var view = UIView()
var view2 = UIView()
view.addSubview(view2)
view.addSubview(UITableView())
view.addSubview(UIView())
view.addSubview(UIView())
view.addSubview(UIView())
view.addSubview(UIView())
view2.addSubview(UIView())
view2.addSubview(UITableView())
view2.addSubview(UIView())
view2.addSubview(UIView())
view2.addSubview(UIView())
view2.addSubview(UIView())
view.printSubView()
