import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct DeleteRequestContent {
  @State ids: string = '';
  @State deletedDataUrl: string = '';
  @State postStatus: string = '';

  build() {
    RelativeContainer() {
      Column() {
        Text(this.postStatus)
          .fontColor(Color.Black)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)
          .width('100%')
          .height('10%')
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)

        this.getText('Deleting Books for User Id')

        Text(this.deletedDataUrl)
          .fontColor(Color.Black)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)
          .width('100%')
          .height('10%')
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)

        this.getText('is successful')

        Row() {
          Text('Id')
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Bold)
            .fontSize(14)
            .width('30%')
          TextInput({ placeholder: 'id' })
            .fontSize(14)
            .fontColor(Color.Black)
            .caretColor(Color.Blue)
            .type(InputType.Number)
            .backgroundColor(Color.Transparent)
            .width('95%')
            .backgroundColor(Color.Transparent)
            .height('30vp')
            .margin(9)
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .borderWidth(1)
            .width('50%')
            .height('15%')
            .onChange(val => this.ids = val)
        }
        .align(Alignment.Center)
        .padding({
          bottom: '2%'
        })

        Button('Delete Books')
          .fontSize(14)
          .height('35vp')
          .onClick(() => this.deleteTransferSyn())
      }
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
    }
    .width('100%')
    .backgroundColor('#fff8f1e3')
  }

  @Builder
  getText(text: string) {
    Text(text)
      .fontColor(Color.Black)
      .fontSize(14)
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.Black)
      .width('100%')
      .height('10%')
      .textAlign(TextAlign.Center)
      .align(Alignment.Center)
  }

  private deleteTransferSyn = async () => {

    const deleteURL = 'https://' + getContext(this)
      .resourceManager
      .getStringSync($r('app.string.serviceurl').id) + '/' + this.ids;

    const sessions = rcp.createSession();

    sessions.delete(deleteURL)
      .then((response) => {
        this.postStatus = 'Success!';
        this.deletedDataUrl = this.ids;
        console.error(`DELETE success: ${JSON.stringify(response)}`);
      })
      .catch((err: BusinessError) => {
        console.error('DELETE error:', err.message);
      });
  };
}
