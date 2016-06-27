//
//  TWAlbumTableViewController.m
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 11.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import "TWAlbumTableViewController.h"
#import "Album+CoreDataProperties.h"
//#import "Album.h"
#import "TWCoreDataHelper.h"
#include "TWPhotosCollectionViewController.h"


@interface TWAlbumTableViewController ()

@end

@implementation TWAlbumTableViewController

-(NSMutableArray *)albums
{
    if(!_albums) _albums = [[NSMutableArray alloc] init];
    return _albums;
}

#pragma mark - IBActions

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender
{
    
    //AlertController
    UIAlertController *newAlbumAlert = [UIAlertController
                                        alertControllerWithTitle:@"Enter new album name"
                                        message:nil
                                        preferredStyle:UIAlertControllerStyleAlert];
    [newAlbumAlert addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder =NSLocalizedString(@"Album Name",@"albumNamePlaceholder");
     }];
    
    
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                                   NSString *albumName = newAlbumAlert.textFields.firstObject.text;
                                   NSLog(@"%@",albumName);
                                   
                                   [self.albums addObject:[self albumWithName:albumName]];
                                   [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[self.albums count] -1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
                                   
                                   
                                   //Dluzsza wersja powyzszych dwoch linijek
                                   //                                    Album *newAlbum = [self albumWithName:albumName];
                                   //                                    [self.albums addObject:newAlbum];
                                   //                                    [self.tableView reloadData];
                                   
                               }];
    
    [newAlbumAlert addAction:cancelAction];
    [newAlbumAlert addAction:okAction];
    [self presentViewController:newAlbumAlert animated:YES completion:nil];
    
    
}

#pragma mark - Helper Methods

-(Album *)albumWithName:(NSString *)name
{
    
    NSManagedObjectContext *context = [TWCoreDataHelper managedObjectContext];
    
    Album *album = [NSEntityDescription
                    insertNewObjectForEntityForName:@"Album"
                    inManagedObjectContext:context];
    album.name = name;
    album.date = [NSDate date];
    
    NSError *error = nil;
    if(![context save:&error])
    {
        //we have an error
        NSLog(@"%@",error);
    }
    
    return album;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//Aktulizacja Core Data
- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Album"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
    
    NSError *error = nil;
    NSArray *fetchedAlbums = [[TWCoreDataHelper managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    self.albums = [fetchedAlbums mutableCopy];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#
    return [self.albums count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    Album *selectedAlbum = self.albums[indexPath.row];
    cell.textLabel.text = selectedAlbum.name;
    
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Album Chosen"])
    {
        if ([segue.destinationViewController isKindOfClass:[TWPhotosCollectionViewController class]])
        {
            NSIndexPath *path = [self.tableView indexPathForSelectedRow];
            
            TWPhotosCollectionViewController *targetViewController = segue.destinationViewController;
            targetViewController.album = self.albums[path.row];
            
        }
    }
}



@end
