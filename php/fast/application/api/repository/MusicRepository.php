<?php
namespace app\api\repository;

use app\admin\model\music\Cd_model;
use app\admin\model\music\Singer_model;
use app\admin\model\music\Tag_model;

class MusicRepository{

    public static  function getSingerIdNameMap($ids){
        if(!is_array($ids)){
            $ids = explode(',',trim($ids,','));
        }
        $list = Singer_model::whereIn('id',$ids)->select();
        $list = collection($list)->toArray();
        $ret = [];
        foreach ($list as $k => $item){
            $ret[$item['id']] = $item['name'];
        }
        return $ret;
    }

    public static function getTagIdNameMap($ids='',$ifAll=false){
        if(!is_array($ids)){
            $ids = explode(',',trim($ids,','));
        }
        if($ifAll){
            $list = Tag_model::select();
        }else{
            $list = Tag_model::whereIn('id',$ids)->select();
        }
        $list = collection($list)->toArray();
        $ret = [];
        foreach ($list as $k => $item){
            $ret[$item['id']] = $item['name'];
        }
        return $ret;
    }


    public static function getCdIdNameMap($ids){
        if(!is_array($ids)){
            $ids = explode(',',trim($ids,','));
        }
        $list = Cd_model::whereIn('id',$ids)->select();
        $list = collection($list)->toArray();
        $ret = [];
        foreach ($list as $k => $item){
            $ret[$item['id']] = $item['name'];
        }
        return $ret;
    }




}