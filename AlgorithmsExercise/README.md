# 总结每种题型的解法

### 两数之和

#### 暴力枚举法
    通过两层 for 循环，进行 index， index + 1 的取值，进行和运算，使之等于目标数 target。
    
#### Hashtable 解法
    for 循环遍历数组，判断 hash 表中是否存在 target - num[i] 的值，如果存在直接返回，如果不存在，将 num[i] 存入 hash 表中。
    需要注意的点是，hash 表中 nums 值作为 key，index 作为 value 进行存储。
