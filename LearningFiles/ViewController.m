//
//  ViewController.m
//  LearningFiles
//
//  Created by Hackeru Hackeru on 8/7/14.
//  Copyright (c) 2014 Hackeru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)NSString *tempDirectory;
@property (nonatomic, strong)NSString *destinationPath;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    // NSArray *urls = [fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask];
    
    if([urls count]>0){
        NSURL *folder = urls[0];
        NSLog(@"%@",folder);
    }else{
        NSLog(@"could not find caches folder");
    }
    self.tempDirectory = NSTemporaryDirectory();
    NSLog(@"Temp Directory: %@",self.tempDirectory);
    
    NSString *someText = @"Hello, how are you today?";
    self.destinationPath = [self.tempDirectory stringByAppendingPathComponent:@"MyFile.txt"];
    
    NSError *error = nil;
    /* BOOL succeeded = [someText writeToFile:destinationPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
     if (succeeded) {
     NSLog(@"Successfully store the file at: %@",destinationPath);
     }else{
     NSLog(@"Failed to store the file. Error: %@",error);
     }
     error = nil;
     NSString *contentOfFile = [[NSString alloc]initWithContentsOfFile:destinationPath encoding:NSUTF8StringEncoding error:&error];
     if ([contentOfFile length]>0) {
     NSLog(@"Text read from file: %@", contentOfFile);
     }else{
     NSLog(@"Failed to read text from disc. Error: %@",error);
     }*/
    NSArray *arrayOfNames = @[@"Ido",@"Naor",@"Dror"];
    if ([arrayOfNames writeToFile:self.destinationPath atomically:YES]) {
        NSLog(@"Succeeded to write NSArray");
        NSArray *readArray = [[NSArray alloc]initWithContentsOfFile:self.destinationPath];
        
        NSLog(@"number of objects read from file: %i",[readArray count]);
        int numberOfObjects = [readArray count];
        for (int i=0; i<numberOfObjects; i++) {
            NSLog(@"%@",[readArray objectAtIndex:i]);
        }
    }
    [self dictionary];
}

-(void)dictionary
{
    self.tempDirectory = NSTemporaryDirectory();
    self.destinationPath = [self.tempDirectory stringByAppendingPathComponent:@"MyFile.txt"];
    NSDictionary *myDictionary = [NSDictionary dictionaryWithObjects:@[@"Dror",@"Naor",@"Ido"] forKeys:@[@"name1",@"name2",@"name3"]];
    
    //write to file
    if([myDictionary writeToFile:self.destinationPath atomically:YES])
        NSLog(@"Successfully save dictionary to file");
    
    //read from file
    NSDictionary *studentsNameDictionary = [NSDictionary dictionaryWithContentsOfFile:self.destinationPath];
    NSLog(@"%@",studentsNameDictionary);

    NSLog(@"Successfully read dictionary from file");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
