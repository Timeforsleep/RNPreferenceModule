import { KVDao } from '../db/KVDao'
import { KVStoreSingleton } from '../db/KVStoreSingleton'

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World';

  aboutToAppear(): void {
    KVStoreSingleton.initKvStore()
  }

  build() {
    Row() {
      Column() {
        Button("put").onClick(()=>{
          KVDao.put("郭逸楷","帅哥")
        })
        Button("get").onClick(()=>{
          KVDao.get("郭逸楷")
        })
        Button("delete").onClick(()=>{
          KVDao.delete("郭逸楷")
        })
        Button("backup").onClick(()=>{
          KVDao.backup()
        })
        Button("restore").onClick(()=>{
          KVDao.restore()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}