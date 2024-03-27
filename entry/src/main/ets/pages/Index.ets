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
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        Button("put[person:AutoHome]").onClick(()=>{
          KVDao.setItem("person","AutoHome").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("get[person]").onClick(()=>{
          KVDao.getItem("person").then(data=>{
            this.data = data
          })
        })
        Button("delete[person]").onClick(()=>{
          KVDao.removeItem("person").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("backup[版本0.0.1]").onClick(()=>{
          KVDao.backup("0.0.1").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("backup[版本0.0.2]").onClick(()=>{
          KVDao.backup("0.0.2").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("rollback[版本0.0.1]").onClick(()=>{
          KVDao.rollback("0.0.1").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("rollback[版本0.0.2]").onClick(()=>{
          KVDao.rollback("0.0.2").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("rollback[版本0.0.3]").onClick(()=>{
          KVDao.rollback("0.0.3").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("backup[版本0.0.3]").onClick(()=>{
          KVDao.backup("0.0.3").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("backup[版本0.0.a]").onClick(()=>{
          KVDao.backup("0.0.a").then(()=>{
            KVDao.getItem("person").then(data=>{
              this.data = data
            })
          })
        })
        Button("rollback[版本0.0.1a]").onClick(()=>{
          KVDao.rollback("0.0.1a").then(()=>{
            KVDao.getItem("person").then(data=>{
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