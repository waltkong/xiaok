<?php
namespace app\api\logic\music;

use app\admin\model\music\Message_model;
use app\admin\model\User;
use app\common\util\UrlUtil;

class ActionLogic{

    public function add_message($input,$userInfo){
        $singer_id = $input['singer_id']?? '';
        $cd_id = $input['cd_id']?? '';
        $song_id = $input['song_id']?? '';
        $msg_id = $input['msg_id']?? '';   //所回复的消息id

        //对象类型 1歌手2cd3歌曲
        $obj_id = '';
        $obj_type = '';
        if(!empty($singer_id)){
            $obj_id = $singer_id;
            $obj_type = 1;
        }
        if(!empty($cd_id)){
            $obj_id = $cd_id;
            $obj_type = 2;
        }
        if(!empty($song_id)){
            $obj_id = $song_id;
            $obj_type = 3;
        }
        if(empty($obj_id) || empty($obj_type)){
            return [
                'code' => -1, 'msg' => '缺少数据','data'=>[]
            ];
        }
        $group_number = $this->getGroupNumber($msg_id);
        $data = [
            'msg' => $input['msg'] ?? '',
            'user_id' => $userInfo['id'] ?? '',
            'parent_id' => empty($msg_id) ?0 : (int)$msg_id,
            'group_number' => $group_number,
            'obj_type' => $obj_type,
            'obj_id' => $obj_id,
            'createtime' => time(),
        ];
        (new Message_model())->insert($data);
        return [
            'code' => 1, 'msg' => 'ok','data'=>[]
        ];
    }

    private function getGroupNumber($msg_id){
        $group_number = '';
        if(!empty($msg_id)){
            $group_number = (new Message_model())->where('id',$msg_id)->value('group_number','');
        }
        if(empty($group_number)){
            $group_number = date('YmdHis').rand(10000,99999);
        }
        return $group_number;
    }


    public function message_list($input,$pageIndex,$eachPage){
        $default = [
            'data' => [],
            'count' => 0,
            'total' => 0,
        ];
        $pageOffset = ($pageIndex-1)*$eachPage;
        $objFunc = function () use($input){
            $obj = new Message_model();
            $singer_id = $input['singer_id']?? '';
            $cd_id = $input['cd_id']?? '';
            $song_id = $input['song_id']?? '';
            $msg_id = $input['msg_id']?? '';   //所回复的消息id
            //对象类型 1歌手2cd3歌曲
            $obj_id = '';
            $obj_type = '';
            if(!empty($singer_id)){
                $obj_id = $singer_id;
                $obj_type = 1;
            }
            if(!empty($cd_id)){
                $obj_id = $cd_id;
                $obj_type = 2;
            }
            if(!empty($song_id)){
                $obj_id = $song_id;
                $obj_type = 3;
            }
            $obj = $obj->where('obj_type','=',$obj_type)
                ->where('obj_id',$obj_id);

            if(empty($msg_id)){
                $obj = $obj->where('parent_id',0);
            }else{
                $group_number = (new Message_model())->where('id',$msg_id)->value('group_number','');
                $obj = $obj->where('parent_id','<>',0)
                    ->where('group_number',$group_number);
            }

            return $obj;
        };
        $default['total'] = $objFunc()->count();
        $list = $objFunc()
            ->order('id', 'desc')
            ->limit($pageOffset,$eachPage)->select();
        $list = collection($list)->toArray();

        $userIds = array_column($list,'user_id');
        $userMap = ( new User)->getMap($userIds);

        foreach ($list as $k => $item){
            $list[$k]['username'] = $userMap[$item['user_id']]['username'] ?? '--';

            $avatar = $userMap[$item['user_id']]['avatar'] ?? '--';

            $list[$k]['createtime'] = date('Y-m-d H:i',$item['createtime']);

            $list[$k]['avatar'] = UrlUtil::getFullUrl($avatar);

        }
        $default['data'] = $list;
        $default['count'] = count($list);
        return $default;
    }




}