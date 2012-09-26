#import <UIKit/UIKit.h>
#import "CKViewDelegate.h"
#import "LunarCalendar.h"

@interface CKViewController : UIViewController <CKViewDelegate>
{
    LunarCalendar* lunarModel;
}

@end