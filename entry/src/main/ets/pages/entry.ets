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
  @State dialogues: Array<Dialogue> =
    [new Dialogue('Reginald', 'ok~', Color.Green), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink), new Dialogue('Mark', 'let\' go!', Color.Orange),
      new Dialogue('Alen', 'sounds good!', Color.Pink), new Dialogue('Mark', 'let\' go!', Color.Orange),
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
        .backgroundColor(dialogue.getColor())
      })
      ListItem() {
        Column() {
          Blank(this.navigate_bar_height)
        }
        .width('100%')
      }
    }
    .size({ width: '100%', height: '100%' })
    .backgroundColor(Color.Grey)
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