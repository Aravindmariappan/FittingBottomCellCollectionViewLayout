//
//  ViewController.m
//  CustomCollectionView
//
//  Created by Aravind Mariappan on 28/10/17.
//  Copyright © 2017 Aravind Mariappan. All rights reserved.
//

#import "ViewController.h"
#import "ArrayViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberOfRowsTextField;
@property (weak, nonatomic) IBOutlet UILabel *errorToast;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.errorToast setHidden:YES];
}

#pragma mark -

- (IBAction)showArraybuttonTapped:(id)sender {
    if ([self.numberOfRowsTextField.text intValue] == 0) {
        [self.errorToast setHidden:NO];
    }
    else {
        [self.errorToast setHidden:YES];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destinationVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showArrraySegueIdentifier"]) {
        ArrayViewController *arrayViewController = (ArrayViewController *)destinationVC;
        arrayViewController.totalNumberOfRows = [self.numberOfRowsTextField.text intValue];;
    }
}

@end
