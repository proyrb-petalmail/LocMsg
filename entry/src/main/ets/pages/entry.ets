import { hilog } from '@kit.PerformanceAnalysisKit';

const hilog_domain: number = 0x0001;

@Entry
@Component
struct Root {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }

  aboutToAppear(): void {
    hilog.debug(hilog_domain, 'Root', '%{public}s', 'aboutToAppear');
  }

  onDidBuild(): void {
    hilog.debug(hilog_domain, 'Root', '%{public}s', 'onDidBuild');
  }

  onPageShow(): void {
    hilog.debug(hilog_domain, 'Root', '%{public}s', 'onPageShow');
  }

  onBackPress(): boolean | void {
    hilog.debug(hilog_domain, 'Root', '%{public}s', 'onBackPress');
  }

  onPageHide(): void {
    hilog.debug(hilog_domain, 'Root', '%{public}s', 'onPageHide');
  }

  aboutToDisappear(): void {
    hilog.debug(hilog_domain, 'Root', '%{public}s', 'aboutToDisappear');
  }
}