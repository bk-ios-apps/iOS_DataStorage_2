//
//  XYZFirstViewController.h
//  DataStorage
//
//  Created by bipul on 5/18/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
//SQLite View Controller
@interface XYZFirstViewController : UIViewController
/*{
    UITextField *bookName;
    UITextField *bookAuthor;
    UITextField *bookDescription;
    UITextField *bookPublishedName;
    UITextField *bookISBN;
    UILabel *message;
}
*/
@property (strong, nonatomic) IBOutlet UITextField *bookName;
@property (strong, nonatomic) IBOutlet UITextField *bookAuthor;
@property (strong, nonatomic) IBOutlet UITextField *bookDescription;
@property (strong, nonatomic) IBOutlet UITextField *bookPublishedName;
@property (strong, nonatomic) IBOutlet UITextField *bookISBN;
@property (strong, nonatomic) IBOutlet UILabel *message;
@property (strong ,nonatomic) NSString *dbPath;
@property (nonatomic) sqlite3 *bookDB;

- (IBAction)saveSQLite:(id)sender;
- (IBAction)clearForm:(id)sender;
- (IBAction)backgroundTouchedHideKeyboard:(id)sender;

@end
