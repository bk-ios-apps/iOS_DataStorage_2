//
//  XYZSecondViewController.m
//  DataStorage
//
//  Created by bipul on 5/18/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "XYZSecondViewController.h"
#import "XYZAppDelegate.h"

@interface XYZSecondViewController ()
@end

@implementation XYZSecondViewController
@synthesize bookName, bookAuthor, bookDescription, bookPublishedName, bookISBN;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveCoreData:(id)sender
{
    XYZAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =  [appDelegate managedObjectContext];
    
    //Create new managed object
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"BookEntity" inManagedObjectContext:context];
    [newManagedObject setValue:self.bookName.text forKey:@"bookname"];
    [newManagedObject setValue:self.bookAuthor.text forKey:@"bookauthor"];
    [newManagedObject setValue:self.bookDescription.text forKey:@"bookdescription"];
    [newManagedObject setValue:self.bookPublishedName.text forKey:@"publishedname"];
    [newManagedObject setValue:self.bookISBN.text forKey:@"isbn"];
    
    NSError *error  = nil;
    // Save the object to persistent store
    if (![context save:&error])
    {
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clearForm:(id)sender
{
    bookName.text = @"";
    bookAuthor.text = @"";
    bookDescription.text = @"";
    bookPublishedName.text = @"";
    bookISBN.text = @"";
}

- (void)backgroundTouchedHideKeyboard:(id)sender
{
    [bookName resignFirstResponder];
    [bookAuthor resignFirstResponder];
    [bookDescription resignFirstResponder];
    [bookPublishedName resignFirstResponder];
    [bookISBN resignFirstResponder];
}

@end
