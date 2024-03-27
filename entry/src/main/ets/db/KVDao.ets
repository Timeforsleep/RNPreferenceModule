import { BusinessError } from '@ohos.base';
import distributedKVStore from '@ohos.data.distributedKVStore';
import { KVStoreSingleton } from './KVStoreSingleton';
import { ifaa } from '@kit.OnlineAuthenticationKit';

export class KVDao {
  private constructor() {
  }

  static put(key: string, value: string): Promise<void> {
    return new Promise((resolve, reject) => {
      if (!KVStoreSingleton.instance) {
        return reject(new Error('KVStoreSingleton instance not available.'));
      }

      try {
        KVStoreSingleton.instance.put(key, value, (err) => {
          if (err !== undefined) {
            reject(err);
          } else {
            console.info('Succeeded in putting data.');
            resolve();
          }
        });
      } catch (e) {
        // 捕获同步异常并拒绝Promise
        let error = e as BusinessError;
        console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
        reject(error);
      }
    });
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

  static delete(key: string): Promise<void> {
    return new Promise((resolve, reject) => {
      if (!KVStoreSingleton.instance) {
        // 如果没有实例，直接拒绝Promise
        return reject(new Error('KVStoreSingleton instance not available.'));
      }

      try {
        KVStoreSingleton.instance.delete(key, (err) => {
          if (err !== undefined) {
            console.error(`Failed to delete data. Code:${err.code},message:${err.message}`);
            // 使用错误信息拒绝Promise
            reject(err);
          } else {
            console.info('Succeeded in deleting data.');
            // 成功执行了操作，解决Promise
            resolve();
          }
        });
      } catch (e) {
        // 捕获同步异常并拒绝Promise
        let error = e as BusinessError;
        console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
        reject(error);
      }
    });
  }

  static backup(version: string): Promise<void> {
    return new Promise((resolve, reject) => {
      if (!KVStoreSingleton.instance) {
        // 如果没有KVStoreSingleton实例，则直接拒绝Promise
        return reject(new Error('KVStoreSingleton instance not available.'));
      }

      let file = `BK${version}`;
      try {
        KVStoreSingleton.instance.backup(file, (err) => {
          if (err) {
            console.error(`Fail to backup data. Code:${err.code},message:${err.message}`);
            // 使用错误信息拒绝Promise
            reject(err);
          } else {
            console.info(`Succeeded in backing up data: ${version}`);
            // 成功执行了操作，解决Promise
            resolve();
          }
        });
      } catch (e) {
        // 捕获同步异常并拒绝Promise
        console.error(`An unexpected error occurred. Code:${e.code},message:${e.message}`);
        reject(e);
      }
    });
  }

  static restore(version: string): Promise<void> {
    return new Promise((resolve, reject) => {
      if (!KVStoreSingleton.instance) {
        // 如果没有KVStoreSingleton实例，则直接拒绝Promise
        return reject(new Error('KVStoreSingleton instance not available.'));
      }

      let file = `BK${version}`;
      try {
        KVStoreSingleton.instance.restore(file, (err) => {
          if (err) {
            console.error(`Fail to restore data. Code:${err.code},message:${err.message}`);
            // 使用错误信息拒绝Promise
            reject(err);
          } else {
            console.info(`Succeeded in restoring data version ${version}`);
            // 成功执行了操作，解决Promise
            resolve();
          }
        });
      } catch (e) {
        // 捕获同步异常并拒绝Promise
        console.error(`An unexpected error occurred. Code:${e.code},message:${e.message}`);
        reject(e);
      }
    });
  }
}