#import "CKViewController.h"
#import "CKCalendarView.h"
#import "DateInfoView.h"
#import "LayoutStyle.h"

@interface CKViewController ()

@property(nonatomic, retain) DateInfoView* dateinfo;
@property(nonatomic, retain) CKCalendarView* calendar;

@end

@implementation CKViewController

@synthesize dateinfo;
@synthesize calendar;

- (id)init {
    self = [super init];
    if (self) {
        // setView style
        self.view.backgroundColor = [UIColor grayColor];
        
        // init calendar view;
        calendar = [[CKCalendarView alloc] initWithStartDay:startMonday frame:CGRectMake(0, 0, 320, 320)];
//        calendar.frame = CGRectMake(10, 10, 300, 470);
        
        // set CKCalendarView Delegate
        calendar.delegate = self;
        
        [self.view addSubview:calendar];
        
        // init dateinfo view;
        dateinfo = [[DateInfoView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxX(calendar.frame) + VIEW_GALLAP , 320, 120)];
        
        [self.view addSubview:dateinfo];
        
        // init model & dateSource
        lunarModel = [[LunarCalendar alloc] init];
        calendar.dataSource = lunarModel;
        almanacModel = [[AlmanacCalendar alloc] init];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark CKViewDelegate Methods

- (void)didSelectDate:(NSDate *)date
{
    [lunarModel loadDate:date];
    [almanacModel loadDate:date];
    
    NSLog(@"LunarDate is %@ %@ %@ %@\n", NSLocalizedString([lunarModel YearHeavenlyStem], nil), NSLocalizedString([lunarModel MonthLunar], nil), NSLocalizedString([lunarModel DayLunar], nil), NSLocalizedString([lunarModel SolarTermTitle], nil));
    
    NSLog(@"CalmanacDate is %@ %@\n", [almanacModel compatibility], [almanacModel incompatibility]);
    
    // set date info
    dateinfo.yilabel.text = [almanacModel compatibility];
    dateinfo.jilabel.text = [almanacModel incompatibility];
}

@end
