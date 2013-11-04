/*
 * JBoss, Home of Professional Open Source.
 * Copyright Red Hat, Inc., and individual contributors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "AGAddPasswordViewController.h"
#import "AGInformation.h"

@interface AGAddPasswordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation AGAddPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DLog(@"AGAddPasswordViewController viewDidLoad");
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    DLog(@"AGAddPasswordViewController viewDidUnLoad");
}

- (IBAction)cancel:(id)sender {
    [self.delegate addPasswordViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {    
    AGInformation *entry = [[AGInformation alloc] init];
    entry.name = self.name.text;
    entry.username = self.username.text;
    entry.password = self.password.text;
    
    [self.delegate addPasswordViewController:self didAddInformation:entry];
}

#pragma mark - UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    // circle through textfields after clicking 'Next' on keyboard
    // tag is used to determine next
    NSInteger nextTag = textField.tag + 1;

    UIResponder* nextResponder = [self.view viewWithTag:nextTag];
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return NO;
}

@end