本文件夹下存储container数据，示例格式如下：

```json
{
	"id": "foe2:container/safe",
	"locale": "foe2:container/safe",
	"lock_chance": 0.5,
	"alarm_chance": 0.2,
	"mine_chance": 0.1,
	"texture": {
		"normal": "foe2:container/safe",
		"open": "foe2:container/safe_open"
	},
	"loot_table": "foe2:loot_table/safe_common"
}
```

- id: 容器的唯一标识符
- locale(可选): 容器对应的本地化键名，若未提供则默认与id一致
- lock_chance/alarm_chance/mine_chance(可选): 基础锁定/附带警报器/诡雷几率，为0-1之间的整数，0为从不上锁/附带，1为始终上锁/附带，会受到玩家幸运值，地图难度系数等影响
  **注意：** 每个容器上面三者可以存在两个及以上
- texture(可选)：容器的纹理，若未提供则仅自动生成一个normal纹理，键名与id一致。目前texture可选值有normal，open
