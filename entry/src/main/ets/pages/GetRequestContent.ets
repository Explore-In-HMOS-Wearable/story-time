import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Books } from '../components/Books';
import { ArcList, ArcListItem, ArcListAttribute, ArcListItemAttribute } from '@kit.ArkUI';

@Component
export struct GetRequestContent {
  @State content: string = '';
  @State breeds: Books[] = [];
  @State currentIndex: number = 1;
  @State message: string = '';
  @Consume('NavPathStack') pageStack: NavPathStack;
  private scroller: Scroller = new Scroller();

  async aboutToAppear() {
    this.getTransferSynEx();
  }

  @Builder
  itemStart() {
    Button({ type: ButtonType.Circle }) {
      Image($r('app.media.post'))
        .width(20)
        .height(20)
    }
    .onClick(() => {
      this.pageStack.pushPathByName('PostRequestContent', null);
    })
    .padding(8)
  }

  @Builder
  itemEnd() {
    Button({ type: ButtonType.Circle }) {
      Image($r('app.media.trash'))
        .width(20)
        .height(20)
    }
    .backgroundColor(Color.Orange)
    .onClick(() => {
      this.pageStack.pushPathByName('DeleteRequestContent', null);
    })
    .padding(8)
  }

  build() {
    NavDestination() {
      Column() {
        ArcList({ initialIndex: 0, scroller: this.scroller }) {
          ForEach(this.breeds, (breed: Books, index: number) => {
            ArcListItem() {
              Column() {
                Text(`User Id: ${breed.userId}`)
                  .fontColor(Color.Black)
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
                Text(`Author Id: ${breed.id}`)
                  .fontColor(Color.Black)
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
                Text(`Description: ${breed.title}`)
                  .fontColor(Color.Black)
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
              }
            }
            .backgroundColor('#fff8f1e3')
            .padding(4)
            .margin(4)
            .borderRadius(12)
            .borderWidth(1)
            .borderColor('#0A59F7')
            .width('100%')
            .swipeAction({
              start: {
                builder: () => {
                  this.itemStart()
                },
              },
              end: {
                builder: () => {
                  this.itemEnd()
                },
              }
            })
          }, (breed: Books) => breed.id)
        }
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .backgroundColor(Color.White)
    }
    .hideTitleBar(true)
    .hideBackButton(true)
  }

  private getTransferSynEx = async () => {
    const getURL = 'https://' + $r('app.string.service_url');

    const sessions = rcp.createSession();
    sessions.get(getURL)
      .then((responses) => {
        const responseText = `${JSON.stringify(responses)}`;
        const data: Books[] = JSON.parse(responseText);
        this.breeds = data;
        this.content = '';
        data.forEach((breed: Books, index: number) => {
          this.content += `#${index + 1}\n`;
          this.content += `User Id: ${breed.userId}\n`;
          this.content += `Id: ${breed.id}\n`;
          this.content += `Title: ${breed.title}\n`;
          this.content += `Completed: ${breed.completed}\n\n`;
        });
      })
      .catch((err: BusinessError) => {
        this.content = `API request failed: ${JSON.stringify(err)}`;
      });
  };
}
