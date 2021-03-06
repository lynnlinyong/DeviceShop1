//
//  NetworkDeviceViewController.m
//  DeviceShop
//
//  Created by lynn on 13-6-2.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "NetworkDeviceViewController.h"

@interface NetworkDeviceViewController ()

@end

@implementation NetworkDeviceViewController

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
    self.title = @"网络设备";
    
    //初始化UI
    [self initUI];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    networkDevTab.delegate   = nil;
    networkDevTab.dataSource = nil;
    [super viewDidUnload];
}

- (void) dealloc
{
    [devListArray removeAllObjects];
    [devListArray release];
    
    [networkDevTab release];
    [super dealloc];
}

#pragma mark
#pragma mark - Custom Action
- (void) initUI
{
    devListArray  = [[NSMutableArray alloc]init];
    [devListArray addObject:@"网络设备1"];
    [devListArray addObject:@"网络设备2"];
    [devListArray addObject:@"网络设备3"];
    [devListArray addObject:@"网络设备4"];
    [devListArray addObject:@"网络设备5"];
    [devListArray addObject:@"网络设备6"];
    [devListArray addObject:@"网络设备7"];
    
    networkDevTab = [[UITableView alloc]init];
    networkDevTab.delegate   = self;
    networkDevTab.dataSource = self;
    networkDevTab.frame      = [UIView fitCGRect:CGRectMake(0, 0, 320, 420)];
    [self.view addSubview:networkDevTab];
}

#pragma mark 
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return devListArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel  *titleLab  = nil;
    NSString *idString  = @"idString";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:idString];
        titleLab = [[UILabel alloc]init];
        titleLab.frame    = [UIView fitCGRect:CGRectMake(0, 12,
                                                         cell.frame.size.width, 20)];
        titleLab.backgroundColor = [UIColor clearColor];
        titleLab.textAlignment   = UITextAlignmentCenter;
        [cell addSubview:titleLab];
        
    }
    
    NSString *devName = [devListArray objectAtIndex:indexPath.row];
    titleLab.text     = devName;
    [titleLab release];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PortViewController *pVc = [PortViewController createViewController:[PortViewController class]];
    pVc.title = [devListArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:pVc
                                         animated:YES];
}
@end
