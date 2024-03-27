import { KVDao } from '../db/KVDao'
import { KVStoreSingleton } from '../db/KVStoreSingleton'

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World';
  @State data:string | number | boolean | Uint8Array | undefined = undefined

  aboutToAppear(): void {
    KVStoreSingleton.initKvStore()
  }

  build() {
    Row() {
      Column({space:5}) {
        if (typeof this.data==='string'){
          Text(this.data)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
        Button("put[郭逸楷:帅哥]").onClick(()=>{
          KVDao.put("郭逸楷","帅哥").then(()=>{
            KVDao.get("郭逸楷").then(data=>{
              this.data = data
            })
          })
        })
        Button("get[郭逸楷]").onClick(()=>{
          KVDao.get("郭逸楷").then(data=>{
            this.data = data
          })
        })
        Button("delete[郭逸楷]").onClick(()=>{
          KVDao.delete("郭逸楷").then(()=>{
            KVDao.get("郭逸楷").then(data=>{
              this.data = data
            })
          })
        })
        Button("backup[版本0.0.1]").onClick(()=>{
          KVDao.backup("0.0.1").then(()=>{
            KVDao.get("郭逸楷").then(data=>{
              this.data = data
            })
          })
        })
        Button("backup[版本0.0.2]").onClick(()=>{
          KVDao.backup("0.0.2").then(()=>{
            KVDao.get("郭逸楷").then(data=>{
              this.data = data
            })
          })
        })
        Button("restore[版本0.0.1]").onClick(()=>{
          KVDao.restore("0.0.1").then(()=>{
            KVDao.get("郭逸楷").then(data=>{
              this.data = data
            })
          })
        })
        Button("restore[版本0.0.2]").onClick(()=>{
          KVDao.restore("0.0.2").then(()=>{
            KVDao.get("郭逸楷").then(data=>{
              this.data = data
            })
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}