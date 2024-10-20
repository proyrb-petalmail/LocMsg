import { hilog } from '@kit.PerformanceAnalysisKit';
import { curves } from '@kit.ArkUI';

const hilog_domain: number = 0x0001;
const bottom_bar_button_height_vp: number = 7;
const bottom_bar_opened_height_vp: number = 400;

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
  @StorageProp('topRectHeight')
  topRectHeight: number = 0;
  @StorageProp('bottomRectHeight')
  bottomRectHeight: number = 0;
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
  @State bottom_bar_height_px: number = this.bottomRectHeight + vp2px(bottom_bar_button_height_vp * 3 + 1);
  @State bottom_bar_blur: number = 30;
  @State bottom_bar_color: Color = Color.Transparent;
  @State bottom_bar_is_open: boolean = false;
  private bottom_bar_button_transition_effect: TransitionEffect = TransitionEffect.opacity(0).animation({ curve: Curve.Linear });

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
          Column().size({ width: '100%', height: `${this.topRectHeight}px` })
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
          Column().size({ width: '100%', height: `${this.bottomRectHeight + vp2px(bottom_bar_button_height_vp * 3 + 1)}px` })
        }
      }
      .size({ width: '100%', height: '100%' })
      .backgroundColor($r('app.color.list_background_color'))
      .scrollBar(BarState.Off)

      Column() {
        Button() {
          Button()
            .size({ width: '100%', height: bottom_bar_button_height_vp })
        }
        .size({ width: 80 })
        .backgroundColor(Color.Transparent)
        .padding(bottom_bar_button_height_vp)
        .onClick((event: ClickEvent) => {
          if (this.bottom_bar_is_open) {
            this.bottom_bar_height_px -= vp2px(bottom_bar_opened_height_vp);
            this.bottom_bar_blur = 30;
            this.bottom_bar_color = Color.Transparent;
            this.bottom_bar_is_open = false;
          } else {
            this.bottom_bar_height_px += vp2px(bottom_bar_opened_height_vp);
            this.bottom_bar_blur = 0;
            this.bottom_bar_color = Color.White;
            this.bottom_bar_is_open = true;
          }
        })

        // if (this.bottom_bar_is_open) {
        //   Column() {
        //     Text('Test')
        //     Button('OK')
        //       .onClick((event: ClickEvent) => {
        //         this.bottom_bar_is_open = !this.bottom_bar_is_open;
        //       })
        //   }.size({ width: '100%', height: 100 })
        // }
      }
      .size({ width: '100%', height: `${this.bottom_bar_height_px}px` })
      .border({
        width: {
          left: 0,
          right: 0,
          top: 1,
          bottom: 0
        }, color: $r('app.color.list_divider_color'), radius: 18
      })
      .align(Alignment.Top)
      .backgroundColor(this.bottom_bar_color)
      .backdropBlur(this.bottom_bar_blur)
      .shadow(ShadowStyle.OUTER_DEFAULT_MD)
      .animation({ curve: curves.springMotion() })
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