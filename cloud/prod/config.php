<?php 
$CONFIG = array (
  'trusted_domains' =>
    array (
    0 => 'cloud.quentinburgniard.fr',
    1 => 'cloud.quentinburgniard.com'
  ),
  'knowledgebaseenabled' => false,
  'allow_user_to_change_display_name' => false,
  'mail_from_address' => 'cloud',
  'overwriteprotocol' => 'htpps',
  'config_is_read_only' => true,
  'objectstore' => array(
    'class' => '\\OC\\Files\\ObjectStore\\S3',
    'arguments' => array(
      'bucket' => 'cloud.quentinburgniard.com',
       'autocreate' => true,
       'key'    => 'EJ39ITYZEUH5BGWDRUFY',
       'secret' => 'M5MrXTRjkyMaxXPe2FRXMTfTfbKEnZCu+7uRTVSj',
       'use_ssl' => true
    ),
  ),
);