#import "CKViewController.h"
#import "CKCalendarView.h"

@interface CKViewController ()

@end

@implementation CKViewController

- (id)init {
    self = [super init];
    if (self) {
        CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
//        calendar.frame = CGRectMake(10, 10, 300, 470);
        
        // set CKCalendarView Delegate
        calendar.delegate = self;
        
        // init model & dateSource
        lunarModel = [[LunarCalendar alloc] init];
        calendar.dataSource = lunarModel;
        
        [self.view addSubview:calendar];

        self.view.backgroundColor = [UIColor grayColor];
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
    [lunarModel initWithDate:date];
    NSLog(@"LunarDate is %@ %@ %@ %@\n", NSLocalizedString([lunarModel YearHeavenlyStem], nil), NSLocalizedString([lunarModel MonthLunar], nil), NSLocalizedString([lunarModel DayLunar], nil), NSLocalizedString([lunarModel SolarTermTitle], nil));
}

@end
