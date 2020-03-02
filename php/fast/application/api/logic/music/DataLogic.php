<?php
namespace app\api\logic\music;

use app\admin\model\music\Ad_model;
use app\admin\model\music\Banner_model;
use app\admin\model\music\Cd_model;
use app\common\util\UrlUtil;

class DataLogic{

    public function banner_list($pageIndex=1, $eachPage=10){
        $pageOffset = ($pageIndex-1)*$eachPage;
        $list = (new Banner_model())->where([])
            ->order('id', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();
        foreach ($list as $k => $v){
            $list[$k]['image'] = UrlUtil::getFullUrl($v['image']);
        }
        return $list;
    }

    public function ad_list($pageIndex=1, $eachPage=10){
        $pageOffset = ($pageIndex-1)*$eachPage;
        $list = (new Ad_model())->where([])
            ->order('id', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();
        foreach ($list as $k => $v){
            $list[$k]['image'] = UrlUtil::getFullUrl($v['image']);
        }
        return $list;
    }

    public function cd_list($input,$pageIndex,$eachPage){
        $default = [
            'data' => [],
            'count' => 0,
            'total' => 0,
        ];
        $pageOffset = ($pageIndex-1)*$eachPage;
        $objFunc = function () use($input){
            $obj = new Cd_model();
            if(!empty($input['is_recommend'])){
                $obj = $obj->where('is_recommend',$input['is_recommend']);
            }
            return $obj;
        };
        $default['total'] = $objFunc()->count();
        $list = $objFunc()
            ->order('createtime', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();

        foreach ($list as $k => $item){

        }
        $default['data'] = $list;
        $default['count'] = count($list);
        return $default;
    }




}

