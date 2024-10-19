import { hilog } from '@kit.PerformanceAnalysisKit';

const hilog_domain: number = 0x0001;

class Dialogue {
  private name: string = '';
  private message: string = '';
  private color: Color = 0;

  constructor(name: string, message: string, color: Color) {
    this.name = name;
    this.message = message;
    this.color = color;
  }

  getName(): string {
    return this.name;
  }

  getMessage(): string {
    return this.message;
  }

  getColor(): Color {
    return this.color;
  }
}

@Entry
@Component
struct Root {
  @StorageProp('status_bar_height')
  status_bar_height: number = 0;
  @StorageProp('navigate_bar_height')
  navigate_bar_height: number = 0;
  @State stick_dialogues: Array<Dialogue> =
    [new Dialogue('Reginald', 'ok~', Color.Green), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink)];
  @State dialogues: Array<Dialogue> =
    [new Dialogue('Reginald', 'ok~', Color.Green), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink)];

  build() {
    List() {
      ListItem() {
        Column() {
          Blank(this.status_bar_height)
        }
        .width('100%')
      }

      ListItemGroup() {
        ForEach(this.stick_dialogues, (dialogue: Dialogue) => {
          ListItem() {
            Column() {
              Text(dialogue.getName())
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
              Text(dialogue.getMessage())
                .fontSize(16)
            }
          }
          .width('100%')
          .height(64)

          // .backgroundColor(dialogue.getColor())
        })
      }
      .margin({
        top: 8,
        bottom: 8,
        left: 16,
        right: 16
      })
      .border({ radius: 16 })
      .backgroundColor(0xFFFFFF)
      .shadow(ShadowStyle.OUTER_DEFAULT_SM)
      .divider({
        strokeWidth: 1,
        color: 0xDDDDDD,
        startMargin: 50,
        endMargin: 50
      })

      ListItemGroup() {
        ForEach(this.dialogues, (dialogue: Dialogue) => {
          ListItem() {
            Column() {
              Text(dialogue.getName())
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
              Text(dialogue.getMessage())
                .fontSize(16)
            }
          }
          .width('100%')
          .height(64)
        })
      }
      .margin({
        top: 8,
        bottom: 8,
        left: 16,
        right: 16
      })
      .border({ radius: 16 })
      .backgroundColor(0xFFFFFF)
      .shadow(ShadowStyle.OUTER_DEFAULT_SM)
      .divider({
        strokeWidth: 1,
        color: 0xDDDDDD,
        startMargin: 50,
        endMargin: 50
      })

      ListItem() {
        Column() {
          Blank(this.navigate_bar_height)
        }
        .width('100%')
      }
    }
    .size({ width: '100%', height: '100%' })
    .backgroundColor(0xEEEEEE)
    .scrollBar(BarState.Off)
  }

  aboutToAppear(): void {
    hilog.debug(hilog_domain, 'root', '%{public}s', 'aboutToAppear');
  }

  onDidBuild(): void {
    hilog.debug(hilog_domain, 'root', '%{public}s', 'onDidBuild');
  }

  onPageShow(): void {
    hilog.debug(hilog_domain, 'root', '%{public}s', 'onPageShow');
  }

  onBackPress(): boolean | void {
    hilog.debug(hilog_domain, 'root', '%{public}s', 'onBackPress');
  }

  onPageHide(): void {
    hilog.debug(hilog_domain, 'root', '%{public}s', 'onPageHide');
  }

  aboutToDisappear(): void {
    hilog.debug(hilog_domain, 'root', '%{public}s', 'aboutToDisappear');
  }
}