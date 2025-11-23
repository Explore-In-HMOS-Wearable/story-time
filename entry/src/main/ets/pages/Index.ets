import { DeleteRequestContent } from './DeleteRequestContent'
import { GetRequestContent } from './GetRequestContent'
import { PostRequestContent } from './PostRequestContent'

@Entry
@Component
struct MainPage {
  @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack()

  @Builder
  PagesMap(name: string) {
    if (name === 'DeleteRequestContent') {
      DeleteRequestContent()
    } else if (name === 'GetRequestContent') {
      GetRequestContent()
    } else if (name === 'PostRequestContent') {
      PostRequestContent()
    }
  }

  build() {
    Navigation(this.pageStack) {
      RelativeContainer() {
        Column() {
          this.button('Delete Books', this.deleteRequestContent)
          this.button('Get Book List', this.getRequestContent)
          this.button('Add Book', this.postRequestContent)
        }
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      }
      .width('100%')
      .backgroundColor(Color.White)
    }
    .hideTitleBar(true)
    .navDestination(this.PagesMap)
    .hideBackButton(true)
    .ignoreLayoutSafeArea()
  }

  private deleteRequestContent = () => {
    this.pageStack.pushPathByName('DeleteRequestContent', null);
  }
  private getRequestContent = () => {
    this.pageStack.pushPathByName('GetRequestContent', null);
  }
  private postRequestContent = () => {
    this.pageStack.pushPathByName('PostRequestContent', null);
  }

  @Builder
  button(text: string, onClick: () => void) {
    Button({ type: ButtonType.Normal }) {
      Row() {
        Column() {
          Text(text)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#000000')
          Rect()
            .radius(1)
            .fill('#0A59F7')
            .height(2)
            .width(75)
        }
      }
    }
    .width('70%')
    .height('15%')
    .backgroundColor('#fff8f1e3')
    .borderRadius(24)
    .onClick(onClick)
    .margin({
      bottom: '5%'
    })
  }
}