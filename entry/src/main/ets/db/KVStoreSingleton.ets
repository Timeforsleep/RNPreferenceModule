// 导入模块
import distributedKVStore from '@ohos.data.distributedKVStore';
import { KVDatabase } from './KVDatabase';
import { BusinessError } from '@ohos.base'

class KVStoreSingleton {
  static instance: distributedKVStore.SingleKVStore | undefined = undefined;

  private constructor() {

  }

  static initKvStore() {
    try {
      const options: distributedKVStore.Options = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: false,
        // kvStoreType不填时，默认创建多设备协同数据库
        kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
        // 多设备协同数据库：kvStoreType: distributedKVStore.KVStoreType.DEVICE_COLLABORATION,
        securityLevel: distributedKVStore.SecurityLevel.S1
      };
      if (KVDatabase.instance) {
        KVDatabase.instance.getKVStore<distributedKVStore.SingleKVStore>('storeId', options, (err, store: distributedKVStore.SingleKVStore) => {
          if (err) {
            console.error(`Failed to get KVStore: Code:${err.code},message:${err.message}`);
            return;
          }
          console.info('Succeeded in getting KVStore.');
          KVStoreSingleton.instance = store;
          // 请确保获取到键值数据库实例后，再进行相关数据操作
        });
      }
    } catch (e) {
      let error = e as BusinessError;
      console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  }
}

export { KVStoreSingleton }

