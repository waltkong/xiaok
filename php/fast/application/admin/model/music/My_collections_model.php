<?php

namespace app\admin\model\music;

use think\Model;
use traits\model\SoftDelete;

class My_collections_model extends Model
{

    use SoftDelete;

    

    // 表名
    protected $table = 'music_my_collections';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';

    // 追加属性
    protected $append = [

    ];
    

    







    public function user()
    {
        return $this->belongsTo('app\admin\model\User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
