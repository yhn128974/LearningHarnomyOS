import { WorkExpressionModel } from './moduls'

@Entry
@Component
struct ForEashCase {
  @State message: string = 'Hello World';
  @State MyWorkExpressionModel: WorkExpressionModel[] = [new WorkExpressionModel({
    companyName: 'Deloitte',
    workDate: new Date(),
    workSalary: '7k',
    workContent: 'coding',
    workTtitle: 'softwareEngery'
  })]

  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.MyWorkExpressionModel, (item: WorkExpressionModel, index: number) => {
            ListItem() {
              Column({
                space: 10
              }) {
                Text(item.companyName)
                  .fontSize(30)
                  .fontWeight(FontWeight.Bold).width('100%')
                Text(item.workDate.toString())
                  .maxLines(1)
                  .textOverflow({
                    overflow: TextOverflow.Ellipsis
                  })
                  .fontSize(30)
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
                Text(item.workSalary)
                  .fontSize(30)
                  .fontWeight(FontWeight.Bold).width('100%')
                Text(item.workContent)
                  .fontSize(30)
                  .fontWeight(FontWeight.Bold).width('100%')
                Text(item.workTtitle)
                  .fontSize(30)
                  .fontWeight(FontWeight.Bold).width('100%')
              }
            }
          })

        }

      }
      .width('100%')
    }
    .height('100%')
  }
}