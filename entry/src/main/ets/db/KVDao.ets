import { BusinessError } from '@ohos.base';
import distributedKVStore from '@ohos.data.distributedKVStore';
import { KVStoreSingleton } from './KVStoreSingleton';
import { ifaa } from '@kit.OnlineAuthenticationKit';

export class KVDao {
  private constructor() {
  }

  static put(key: string, value: string) {
    if (KVStoreSingleton.instance) {
      // const KEY_TEST_STRING_ELEMENT = 'key_test_string';
      // const VALUE_TEST_STRING_ELEMENT = 'value_test_string';
      try {
        KVStoreSingleton.instance.put(key, value, (err) => {
          if (err !== undefined) {
            console.error(`Failed to put data. Code:${err.code},message:${err.message}`);
            return;
          }
          console.info('Succeeded in putting data.');
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
      }
    }
  }

  static get(key: string): Promise<string | number | boolean | Uint8Array | undefined> {
    return new Promise((resolve, reject) => {
      if (!KVStoreSingleton.instance) {
        return resolve(undefined);
      }

      KVStoreSingleton.instance.get(key, (err, data) => {
        if (err != undefined) {
          console.error(`Failed to get data. Code:${err.code},message:${err.message}`);
          resolve(undefined); // or reject(err) if you want to propagate the error
        } else {
          console.info(`Succeeded in getting data. Data:${data}`);
          resolve(data);
        }
      });
    });
  }

  static delete(key: string) {
    if (KVStoreSingleton.instance) {
      try {

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
        console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
      }
    }
  }

  static backup(version: string) {
    let file = `BK${version}`;
    if (KVStoreSingleton.instance) {
      try {
        KVStoreSingleton.instance.backup(file, (err) => {
          if (err) {
            console.error(`Fail to backup data.code:${err.code},message:${err.message}`);
          } else {
            console.info('Succeeded in backupping data'+version);
          }
        });
      } catch (e) {
        console.error(`An unexpected error occurred. Code:${e.code},message:${e.message}`);
      }
    }
  }

  static restore(version: string) {
    if (KVStoreSingleton.instance) {
      let file = `BK${version}`;
      try {
        KVStoreSingleton.instance.restore(file, (err) => {
          if (err) {
            console.error(`Fail to restore data. Code:${err.code},message:${err.message}`);
          } else {
            console.info('Succeeded in restoring data version'+version);
          }
        });
      } catch (e) {
        console.error(`An unexpected error occurred. Code:${e.code},message:${e.message}`);
      }
    }
  }
}