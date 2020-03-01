<?php

namespace app\admin\model\music;

use think\Model;
use traits\model\SoftDelete;

class Singer_model extends Model
{

    use SoftDelete;

    

    // 表名
    protected $table = 'music_singer';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';

    // 追加属性
    protected $append = [

    ];

    // 前台表单下拉列表
    public static function getOptions(){
        $list =  self::where([])->select();
        $list = collection($list)->toArray();
        $ret = [];
        foreach ($list as $k => $v){
            $ret[$v['id']] = $v['name'];
        }
        return $ret;
    }
    







}
