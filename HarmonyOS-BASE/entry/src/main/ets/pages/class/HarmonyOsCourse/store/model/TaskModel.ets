// import relationalStore from '@ohos.data.relationalStore';
//
// class TaskModel {
//   private rdbStore: relationalStore.RdbStore
//   private tableName: string = 'TASK'
//
//   //   初始化任务列表
//   initTaskDB() {
//     const config: relationalStore.StoreConfig = {
//       name: 'MyApplication.db',
//       securityLevel: relationalStore.SecurityLevel.S1
//     }
//     const sql = `CREATE TABLE IF NOT EXISTS TASK(
//     ID INTEGER PRIMARY KEY AUTOINCREMENT,
//     NAME TEXT NOT NULL,
//     FINISHED bit
//     )`
//
//     //   获取rdb
//     relationalStore.getRdbStore(this.context, config, (err, rdbStore) => {
//       if (err) {
//         console.log('err 获取rdbStore失败')
//         return
//       }
//       rdbStore.executeSql(sql)
//       console.log('testTag  创建task表成功')
//       //
//       this.rdbStore = rdbStore
//     })
//   }
//
//   //   查询
//   async getTasksList() {
//     // 简构建查询条件
//     let predicates = new relationalStore.RdbPredicates(this.tableName)
//     //   查询
//     let result = await this.rdbStore.query(predicates, ['ID', 'NAME', 'FINISHED'])
//     //解析查询结果
//     //  定义一个数组，封装查询结果
//     let tasks: TaskInfo[] = []
//     //  遍历封装
//     while (!result.isAtFirstRow) {
//       result.goToNextRow()
//       //   获取数据
//       let id = result.getLong(result.getColumnIndex('ID'))
//       let name = result.getLong(result.getColumnIndex('NAME'))
//       let finished = result.getLong(result.getColumnIndex('FINISHED'))
//       //    封装数组
//       tasks.push({ id, name, finished: !!finished })
//     }
//     console.log('testTag', '查询数据', JSON.stringify(tasks))
//     return tasks;
//   }
//
//   //   添加
//   addTask(name: string): Promise<number> {
//
//     this.rdbStore.insert(this.tableName, { name, finished: false });
//   }
//
//   // 更新
//   updateTaskStatus(id: number, finished: boolean) {
//     let deta = { finished }
//     // 更新条件
//     let predicates = new relationalStore.RdbPredicates(this.tableName)
//     predicates.equalTo('ID', id)
//     // 更新操作
//     return this.rdbStore.update(deta, predicates)
//   }
//
//   // 删除
//   deleteTaskById(id: number) {
//     let predicates = new relationalStore.RdbPredicates(this.tableName)
//     predicates.equalTo('ID', id)
//     //   删除操作
//     return this.rdbStore.delete(predicates)
//   }
// }




