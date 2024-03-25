import { KVStoreSingleton } from './KVStoreSingleton';
import { BusinessError } from '@ohos.base';
import distributedKVStore from '@ohos.data.distributedKVStore';

export class KVDao {
  private constructor() {
  }

  static put() {
    const KEY_TEST_STRING_ELEMENT = 'key_test_string';
    const VALUE_TEST_STRING_ELEMENT = 'value_test_string';
    try {
      if (KVStoreSingleton.instance) {
        KVStoreSingleton.instance.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, (err) => {
          if (err !== undefined) {
            console.error(`Failed to put data. Code:${err.code},message:${err.message}`);
            return;
          }
          console.info('Succeeded in putting data.');
        });
      }
    } catch (e) {
      let error = e as BusinessError;
      console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  }

  static get(key:string,value:string) {
    const KEY_TEST_STRING_ELEMENT = 'key_test_string';
    const VALUE_TEST_STRING_ELEMENT = 'value_test_string';
    try {
      if (KVStoreSingleton.instance) {
        KVStoreSingleton.instance.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, (err) => {
          if (err !== undefined) {
            console.error(`Failed to put data. Code:${err.code},message:${err.message}`);
            return;
          }
          console.info('Succeeded in putting data.');
          KVStoreSingleton.instance = KVStoreSingleton.instance as distributedKVStore.SingleKVStore;
          KVStoreSingleton.instance.get(KEY_TEST_STRING_ELEMENT, (err, data) => {
            if (err != undefined) {
              console.error(`Failed to get data. Code:${err.code},message:${err.message}`);
              return;
            }
            console.info(`Succeeded in getting data. Data:${data}`);
          });
        });
      }
    } catch (e) {
      let error = e as BusinessError;
      console.error(`Failed to get data. Code:${error.code},message:${error.message}`);
    }
  }

  static delete(){

  }
}