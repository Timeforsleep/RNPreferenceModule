import { distributedKVStore } from '@kit.ArkData';
import { BusinessError } from '@ohos.base';

export class KVDatabase {
  static instance: distributedKVStore.KVManager | undefined = undefined; //数据库单例

  static initDataBase(context: Context) {
    const kvManagerConfig: distributedKVStore.KVManagerConfig = {
      context: context,
      bundleName: 'com.example.datamanagertest'
    }
    try {
      // 创建KVManager实例
      KVDatabase.instance = distributedKVStore.createKVManager(kvManagerConfig);
      console.info('Succeeded in creating KVManager.');
    } catch (e) {
      let error = e as BusinessError;
      console.error(`Failed to create KVManager. Code:${error.code},message:${error.message}`);
    }
  }

  private constructor() {

  }
}
