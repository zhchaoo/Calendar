#import <UIKit/UIKit.h>
#import "CKViewDelegate.h"
#import "LunarCalendar.h"
#import "AlmanacCalendar.h"

@interface CKViewController : UIViewController <CKViewDelegate>
{
    LunarCalendar* lunarModel;
    AlmanacCalendar* almanacModel;
}

@end