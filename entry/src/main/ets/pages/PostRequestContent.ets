import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct PostRequestContent {
  @State userId: string = '';
  @State ids: string = '';
  @State title: string = '';
  @State completed: string = '';
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

        this.getText('User Id', val => this.userId = val);
        this.getText('Author Id', val => this.userId = val);
        this.getText('Description', val => this.userId = val);

        Button('Add Book')
          .fontSize(14)
          .height('35vp')
          .width('55%')
          .onClick(() => this.postTransferSyn())
          .margin({ top: '5vp' })
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
  getText(text: string, onChangeCallback: (val: string) => void) {
    Row() {
      Text(text)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .fontSize(14)
        .width('35%')
      TextInput()
        .fontSize(14)
        .fontColor(Color.Black)
        .backgroundColor(Color.Transparent)
        .borderWidth(1)
        .width('50%')
        .height('15%')
        .onChange(onChangeCallback)
    }
    .align(Alignment.Center)
    .padding({ bottom: '3%', top: '3%' })
  }

  private postTransferSyn = async () => {

    const postURL = 'https://' + getContext(this)
      .resourceManager
      .getStringSync($r('app.string.serviceurl').id);

    const postContent: rcp.RequestContent = {
      fields: {
        'userId': this.userId,
        'id': this.ids,
        'title': this.title,
        'completed': this.completed
      }
    }
    const sessions = rcp.createSession();
    sessions.post(postURL, postContent)
      .then((responses) => {
        this.postStatus = 'Success!';
        console.error(`POST data: ${JSON.stringify(postContent)}`);
        console.error('Response data:', JSON.stringify(responses));
      })
      .catch((err: BusinessError) => {
        this.postStatus = `Failed!!!`;
      })
  };
}
