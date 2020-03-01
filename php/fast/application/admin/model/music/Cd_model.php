<?php

namespace app\admin\model\music;

use think\Model;
use traits\model\SoftDelete;

class Cd_model extends Model
{

    use SoftDelete;

    

    // 表名
    protected $table = 'music_cd';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = 'deletetime';

    // 追加属性
    protected $append = [
        'publishtime_text'
    ];
    

    



    public function getPublishtimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['publishtime']) ? $data['publishtime'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setPublishtimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }


    public function musicsinger()
    {
        return $this->belongsTo('app\admin\model\music\Singer_model', 'singer_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


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
