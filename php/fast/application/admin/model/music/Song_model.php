<?php

namespace app\admin\model\music;

use think\Model;
use traits\model\SoftDelete;

class Song_model extends Model
{

    use SoftDelete;

    

    // 表名
    protected $table = 'music_song';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';

    // 追加属性
    protected $append = [

    ];
    

    







    public function musicsinger()
    {
        return $this->belongsTo('app\admin\model\music\Singer_model', 'singer_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function musiccd()
    {
        return $this->belongsTo('app\admin\model\music\Cd_model', 'cd_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
