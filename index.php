<?php

        $conn = mysqli_connect("127.0.0.1","root","","schedular");
        date_default_timezone_set('Asia/Kolkata');
        $currentDate = date('Y-m-d H:i:s');
        $sql = "SELECT * FROM `scheduler` WHERE end is NULL limit 1";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_object()) {
                $time = strtotime($currentDate)- strtotime($row->start_time);
                if(strtotime($row->time) < strtotime($currentDate) && $row->end==0 && round(abs($time) / 60)>=5){
                    $conn->query("UPDATE scheduler SET start_time='".$currentDate."' where id=".$row->id);
                    $limit=2;
                   if(getSubscriberCount($conn,$row->campaign_id)){

                        $subscribers = getListSubscriber($conn,$row->campaign_id,$limit);
                        foreach($subscribers as $subscriber){
                           //need to send mail
                            $message = "mail sent to".$subscriber->email." at ".$currentDate;
                            $file = "mail-log.txt";
                            file_put_contents($file, $message . PHP_EOL, FILE_APPEND);
                            $userHash = md5(mt_rand(1000,9999));
                            $conn->query("update `campaign_users` set sent = 1, user_hash='".$userHash."', sent_time='".$currentDate."' where campaign_id=".$subscriber->campaign_id." and subscriber_id=".$subscriber->subscriber_id);
                        
                        }   

                   }

                }
            }

        }    

        function getSubscriberCount($conn,$campaign_id){
            $result = $conn->query("SELECT * FROM `campaign_users` where campaign_id=".$campaign_id." and sent=0");
            if($result->num_rows > 0){
                return 1;
            }else{
                return 0;
            }
        }

        function getListSubscriber($conn,$campaign_id,$limit){
            $result = $conn->query("SELECT * FROM `campaign_users` where campaign_id=".$campaign_id." and sent=0 limit ".$limit);
            $list = array();
            while($row = $result->fetch_object()) {
                $list[]=$row;
            }
            return $list;
        }

        

?>
