//
//  ModelController.swift
//  Task
//
//  Created by  on 1/27/19.
//

import UIKit

class DataManager: UIPageViewControllerDataSource {



//    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
//        // Return the data view controller for the given index.
//        if (self.pageData.count == 0) || (index >= self.pageData.count) {
//            return nil
//        }
//
//        // Create a new view controller and pass suitable data.
//        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
//        dataViewController.dataObject = self.pageData[index]
//        return dataViewController
//    }

//    func indexOfViewController(_ viewController: DataViewController) -> Int {
//        // Return the index of the given data view controller.
//        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
//        return pageData.index(of: viewController.dataObject) ?? NSNotFound
//    }

    // MARK: - Page View Controller Data Source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        var index = self.indexOfViewController(viewController as! DataViewController)
//        if (index == 0) || (index == NSNotFound) {
//            return nil
//        }
//
//        index -= 1
//        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        var index = self.indexOfViewController(viewController as! DataViewController)
//        if index == NSNotFound {
//            return nil
//        }
//
//        index += 1
//        if index == self.pageData.count {
//            return nil
//        }
//        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.darkGray
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }

}

