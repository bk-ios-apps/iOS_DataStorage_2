//
//  XYZFirstViewController.m
//  DataStorage
//
//  Created by bipul on 5/18/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "XYZFirstViewController.h"

@interface XYZFirstViewController ()

@end

@implementation XYZFirstViewController
@synthesize bookName, bookAuthor, bookDescription, bookPublishedName, bookISBN, message;
@synthesize dbPath = _dbPath;
@synthesize bookDB = _bookDB;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _dbPath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:@"bookstore.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:_dbPath ] == NO)
    {
        const char *dbpath = [_dbPath UTF8String];
        
        if (sqlite3_open(dbpath, &_bookDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS BOOKS (ID INTEGER PRIMARY KEY AUTOINCREMENT, BOOKNAME TEXT, AUTHOR TEXT, DESCRIPTION TEXT, PUBLISHEDNAME TEXT, ISBN TEXT)";
            
            if (sqlite3_exec(_bookDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                message.text = @"create table - failed";
            }
            sqlite3_close(_bookDB);
        } else {
            message.text = @"open or create db error";
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveSQLite:(id)sender
{
    sqlite3_stmt  *statement;
    const char *dbpath = [_dbPath UTF8String];
    
    if (sqlite3_open(dbpath, &_bookDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO BOOKS (BOOKNAME, AUTHOR, DESCRIPTION, PUBLISHEDNAME, ISBN) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",bookName.text, bookAuthor.text, bookDescription.text, bookPublishedName.text, bookISBN.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_bookDB, insert_stmt,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            message.text = @"data entry is successful";
            
        } else {
            message.text = @"data entry failed";
        }
        sqlite3_finalize(statement);
        sqlite3_close(_bookDB);
    }

}

- (void)clearForm:(id)sender
{
    bookName.text = @"";
    bookAuthor.text = @"";
    bookDescription.text = @"";
    bookPublishedName.text = @"";
    bookISBN.text = @"";
}

-(void)backgroundTouchedHideKeyboard:(id)sender
{
    [bookName resignFirstResponder];
    [bookAuthor resignFirstResponder];
    [bookDescription resignFirstResponder];
    [bookPublishedName resignFirstResponder];
    [bookISBN resignFirstResponder];
}


@end
