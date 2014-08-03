//
//  SearchViewController.m
//  BeaconGuide
//
//  Created by ; An on 8/2/14.
//  Copyright (c) 2014 Beacon_Guide. All rights reserved.
//

#import "SearchViewController.h"
#import "categoryTableViewCell.h"
#import "GoogleMaps/GoogleMaps.h"
#import "NavViewController.h"
#import "MapViewController.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UITableView *selectionTableView;
@property (strong, nonatomic) NSArray *locations;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UIButton *displayMapViewController;

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                    style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;

    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                   style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    self.title = @"Indoor Map Category";
    
    self.displayMapViewController = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.displayMapViewController setTitle:@"Display indoor Map" forState:UIControlStateNormal];
    
    [self.displayMapViewController sizeToFit];
    self.displayMapViewController.center = self.view.center;
    
    [self.displayMapViewController addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.displayMapViewController];
//    
////    self.ScrollView.contentSize = self.selectionTableView.frame.size;
//    
//    //search bar as header
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    self.selectionTableView.tableHeaderView= searchBar;
//    //UITableView *selectionView;
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
//    [self.view addGestureRecognizer:tap];
//    
//    //set each table view photo
////    UINib *nib = [UINib nibWithNibName:@"categoryTableViewCell" bundle:nil];
////    [self.selectionTableView registerNib:nib forCellReuseIdentifier:@"categoryTableViewCell"];
//    
//    self.title = NSLocalizedString(@"Beacon Guide", @"Beacon Guide");
//    
//   // self.selectionTableView.rowHeight = 320;
//    self.selectionTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    self.selectionTableView.delegate = self;
//    // self.selectionTableView.dataSource = self;

    
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goNext {
    MapViewController *mapViewController = [[MapViewController alloc]initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:mapViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self performSelector:@selector(goBack) withObject:nil afterDelay:5.0f];
}

- (void) dismissKeyBoard
{
    [self.searchBar resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *sectionArray = self.arrayOfSections[section];
    return sectionArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    categoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryTableViewCell"];
    cell.textLabel.text = [[NSString alloc]initWithFormat:@"Cell %ld", (long)indexPath.row];
    NSMutableArray *sectionArray = self.arrayOfSections[indexPath.section];
    cell.textLabel.text = sectionArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSMutableArray *) newSectionWithIndex:(NSUInteger)paramIndex cellCount:(NSUInteger)paramCellCount{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSUInteger counter=0;
    for(counter = 0;
        counter < paramCellCount;
        counter++){
        [result addObject:[[NSString alloc]initWithFormat:@"",(unsigned long)paramIndex,(unsigned long)counter+1]];
    }
    return result;
}

- (NSMutableArray *) arrayOfSections{
    
    if(_arrayOfSections == nil){
        
        NSMutableArray *s1 = [self newSectionWithIndex:1 cellCount:3];
        NSMutableArray *s2 = [self newSectionWithIndex:2 cellCount:3];
        NSMutableArray *s3 = [self newSectionWithIndex:3 cellCount:3];
        
        _arrayOfSections = [[NSMutableArray alloc]initWithArray:@[s1,s2,s3]];
    }
    
    return _arrayOfSections;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrayOfSections.count;
}
@end
