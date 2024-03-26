import { BusinessError } from '@ohos.base';
import distributedKVStore from '@ohos.data.distributedKVStore';
import { KVStoreSingleton } from './KVStoreSingleton';
import { ifaa } from '@kit.OnlineAuthenticationKit';

export class KVDao {
  private constructor() {
  }

  static async put(key: string, value: string) {
    if (KVStoreSingleton.instance) {
      try {
        await KVStoreSingleton.instance.startTransaction()
        // .then((result) => {
        //   console.log(`gyk${result}`)
        // }).catch((error: undefined) => {
        //   console.error(`gyk${error}`)
        // })
        KVStoreSingleton.instance.put(key, value, (err) => {
          if (err !== undefined) {
            console.error(`Failed to put data. Code:${err.code},message:${err.message}`);
            return;
          }
          console.info('Succeeded in putting data.');
        });
      }
      catch (e) {
        await KVStoreSingleton.instance.rollback()
        let error = e as BusinessError;
        console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
      }
    }
  }


  static async get(key: string) {
    if (KVStoreSingleton.instance) {
      try {
        await KVStoreSingleton.instance.startTransaction()
        // KVStoreSingleton.instance.put(key, value, (err) => {
        //   if (err !== undefined) {
        //     console.error(`Failed to put data. Code:${err.code},message:${err.message}`);
        //     return;
        //   }
        //   console.info('Succeeded in putting data.');
        //   KVStoreSingleton.instance = KVStoreSingleton.instance as distributedKVStore.SingleKVStore;
        KVStoreSingleton.instance.get(key, (err, data) => {
          if (err != undefined) {
            console.error(`Failed to get data. Code:${err.code},message:${err.message}`);
            return;
          }
          console.info(`Succeeded in getting data. Data:${data}`);
        });
        // });

      } catch (e) {
        let error = e as BusinessError;
        await KVStoreSingleton.instance.rollback()
        console.error(`Failed to get data. Code:${error.code},message:${error.message}`);
      }
    }
  }

  static async delete(key: string) {
    if (KVStoreSingleton.instance) {
      try {
        await KVStoreSingleton.instance.startTransaction()
        // KVStoreSingleton.instance.put(key, value, (err) => {
        //   if (err !== undefined) {
        //     console.error(`Failed to put data. Code:${err.code},message:${err.message}`);
        //     return;
        //   }
        //   console.info('Succeeded in putting data.');
        // KVStoreSingleton.instance = KVStoreSingleton.instance as distributedKVStore.SingleKVStore;
        KVStoreSingleton.instance.delete(key, (err) => {
          if (err !== undefined) {
            console.error(`Failed to delete data. Code:${err.code},message:${err.message}`);
            return;
          }
          console.info('Succeeded in deleting data.');
        });
        // });

      } catch (e) {
        let error = e as BusinessError;
        await KVStoreSingleton.instance.rollback()
        console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
      }
    }
  }

  static async backup() {
    let file = 'BK001';
    if (KVStoreSingleton.instance) {
      try {
        await KVStoreSingleton.instance.startTransaction()
        KVStoreSingleton.instance.backup(file, (err) => {
          if (err) {
            console.error(`Fail to backup data.code:${err.code},message:${err.message}`);
          } else {
            console.info('Succeeded in backupping data.');
          }
        });
      } catch (e) {
        await KVStoreSingleton.instance.rollback()
        console.error(`An unexpected error occurred. Code:${e.code},message:${e.message}`);
      }
    }
  }

  static async restore() {
    if (KVStoreSingleton.instance) {
      await KVStoreSingleton.instance.startTransaction()
      let file = 'BK001';
      try {
        KVStoreSingleton.instance.restore(file, (err) => {
          if (err) {
            console.error(`Fail to restore data. Code:${err.code},message:${err.message}`);
          } else {
            console.info('Succeeded in restoring data.');
          }
        });
      } catch (e) {
        await KVStoreSingleton.instance.rollback()
        console.error(`An unexpected error occurred. Code:${e.code},message:${e.message}`);
      }
    }
  }
}