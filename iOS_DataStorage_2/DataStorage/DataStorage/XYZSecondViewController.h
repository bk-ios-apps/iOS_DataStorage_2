//
//  XYZSecondViewController.h
//  DataStorage
//
//  Created by bipul on 5/18/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZAppDelegate.h"

@interface XYZSecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *bookName;
@property (strong, nonatomic) IBOutlet UITextField *bookAuthor;
@property (strong, nonatomic) IBOutlet UITextField *bookDescription;
@property (strong, nonatomic) IBOutlet UITextField *bookPublishedName;
@property (strong, nonatomic) IBOutlet UITextField *bookISBN;
@property (strong, nonatomic) IBOutlet UILabel *status;

- (IBAction)saveCoreData:(id)sender;
- (IBAction)clearForm:(id)sender;
- (IBAction)backgroundTouchedHideKeyboard:(id)sender;

@end
