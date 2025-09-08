import { router } from '@kit.ArkUI'

@Entry
@Component
struct MainPage {

  build() {
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

  private deleteRequestContent = () => {
    router.pushUrl({ url: 'pages/DeleteRequestContent' });
  }
  private getRequestContent = () => {
    router.pushUrl({ url: 'pages/GetRequestContent' });
  }
  private postRequestContent = () => {
    router.pushUrl({ url: 'pages/PostRequestContent' });
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