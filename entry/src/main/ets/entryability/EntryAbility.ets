import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

const hilog_domain: number = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(hilog_domain, 'EntryAbility', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(hilog_domain, 'EntryAbility', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(hilog_domain, 'EntryAbility', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/entry', (err) => {
      if (err.code) {
        hilog.error(hilog_domain, 'EntryAbility', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(hilog_domain, 'EntryAbility', 'Succeeded in loading the content.');

      // 1.全屏布局
      let windowClass: window.Window = windowStage.getMainWindowSync();
      windowClass.setWindowLayoutFullScreen(true).then(() => {
        console.info('Succeeded in setting the window layout to full-screen mode.');
      }).catch((err: BusinessError) => {
        console.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
      });

      // 2.获取避让数据
      AppStorage.setOrCreate('status_bar_height', this.context.resourceManager.getNumber($r('app.integer.status_bar_height').id));
      AppStorage.setOrCreate('navigate_bar_height', this.context.resourceManager.getNumber($r('app.integer.navigate_bar_height').id));
      // hilog.info(hilog_domain, 'EntryAbility', '%{public}s : %{public}s', 'topRectHeight',
      //   JSON.stringify(windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)));
      // AppStorage.setOrCreate('topRectHeight',
      //   windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height); //以状态栏避让为例，获取状态栏区域高度
      //
      // hilog.info(hilog_domain, 'EntryAbility', '%{public}s : %{public}s', 'bottomRectHeight',
      //   JSON.stringify(windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)));
      // AppStorage.setOrCreate('bottomRectHeight',
      //   windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height); // 以导航条避让为例，获取到导航条区域的高度
      //
      // hilog.info(hilog_domain, 'EntryAbility', '%{public}s : %{public}s', 'gesture',
      //   JSON.stringify(windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE)));

      // 3. 注册监听函数，动态获取避让区域数据
      // windowClass.on('avoidAreaChange', (data) => {
      //   if (data.type === window.AvoidAreaType.TYPE_SYSTEM) {
      //     hilog.info(hilog_domain, 'EntryAbility', '%{public}s = %{public}d', 'topRectHeight',
      //       data.area.topRect.height);
      //     AppStorage.setOrCreate('topRectHeight', data.area.topRect.height);
      //   } else if (data.type == window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR) {
      //     hilog.info(hilog_domain, 'EntryAbility', '%{public}s = %{public}d', 'bottomRectHeight',
      //       data.area.bottomRect.height);
      //     AppStorage.setOrCreate('bottomRectHeight', data.area.bottomRect.height);
      //   }
      // });
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(hilog_domain, 'EntryAbility', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(hilog_domain, 'EntryAbility', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(hilog_domain, 'EntryAbility', '%{public}s', 'Ability onBackground');
  }
}
