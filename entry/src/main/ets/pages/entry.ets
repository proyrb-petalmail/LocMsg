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
  @State list_stick_group_menu_is_show: boolean = false;
  @State list_group_menu_is_show: boolean = false;

  // @State bottom_card

  @Builder
  list_stick_group_menu() {
    Menu() {
      MenuItem({ content: '第一项' })
      MenuItem({ content: '第二项' })
      MenuItem({ content: '第三项' })
    }
  }

  @Builder
  list_group_menu() {
    Menu() {
      MenuItem({ content: '第一项' })
      MenuItem({ content: '第二项' })
      MenuItem({ content: '第三项' })
    }
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
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
          })
        }
        .margin({
          top: 8,
          bottom: 8,
          left: 16,
          right: 16
        })
        .border({ radius: $r('app.integer.list_group_radius') })
        .backgroundColor($r('app.color.list_group_background_color'))
        .shadow(ShadowStyle.OUTER_DEFAULT_SM)
        .divider({
          strokeWidth: 1,
          color: $r('app.color.list_divider_color'),
          startMargin: 50,
          endMargin: 50
        })
        .gesture(LongPressGesture().onAction((event: GestureEvent) => {
          hilog.debug(hilog_domain, 'root', '%{public}s', 'LongPressGesture');
          this.getUIContext().getContextMenuController().close();
          this.list_stick_group_menu_is_show = false;
          this.list_stick_group_menu_is_show = true;
        }).onActionEnd((event: GestureEvent) => {
          hilog.debug(hilog_domain, 'root', '%{public}s', 'LongPressGestureEnd');
        }))
        .bindContextMenu(this.list_stick_group_menu_is_show, this.list_stick_group_menu,
          { placement: Placement.BottomRight, enableArrow: true })

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
          bottom: 16,
          left: 16,
          right: 16
        })
        .border({ radius: $r('app.integer.list_group_radius') })
        .backgroundColor($r('app.color.list_group_background_color'))
        .shadow(ShadowStyle.OUTER_DEFAULT_SM)
        .divider({
          strokeWidth: 1,
          color: $r('app.color.list_divider_color'),
          startMargin: 50,
          endMargin: 50
        })
        .gesture(LongPressGesture().onAction((event: GestureEvent) => {
          hilog.debug(hilog_domain, 'root', '%{public}s', 'LongPressGesture');
          this.getUIContext().getContextMenuController().close();
          this.list_group_menu_is_show = false;
          this.list_group_menu_is_show = true;
        }).onActionEnd((event: GestureEvent) => {
          hilog.debug(hilog_domain, 'root', '%{public}s', 'LongPressGestureEnd');
        }))
        .bindContextMenu(this.list_group_menu_is_show, this.list_group_menu, { placement: Placement.TopRight, enableArrow: true })

        ListItem() {
          Column() {
            Blank(this.navigate_bar_height + 21)
          }
          .width('100%')
        }
      }
      .size({ width: '100%', height: '100%' })
      .backgroundColor($r('app.color.list_background_color'))
      .scrollBar(BarState.Off)

      Column() {
        Button() {
          Button()
            .size({ width: '100%', height: 8 })
        }
        .size({ width: 80 })
        .backgroundColor(Color.Transparent)
        .padding(6)

        Blank(this.navigate_bar_height)
      }
      .size({ width: '100%' })
      .border({
        width: {
          left: 0,
          right: 0,
          top: 1,
          bottom: 0
        }, color: $r('app.color.list_divider_color')
      })
      .backgroundColor(Color.Transparent)
      .backdropBlur(30)
      .shadow(ShadowStyle.OUTER_DEFAULT_MD)
    }
    .size({ width: '100%', height: '100%' })
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