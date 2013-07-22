[{$smarty.block.parent}]
[{oxstyle include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/css/dd_oxmodernizr.min.css')}]

[{assign var="oConfig" value=$oViewConf->getConfig()}]

[{if $oConfig->getConfigParam('dd_blMiniBasketAmount') || $oConfig->getConfigParam('dd_blBasketAmount')}]
    [{* jQuery-UI laden *}]
    [{if $oConfig->getConfigParam('dd_blMiniBasketjQueryUiConfirm') || $oConfig->getConfigParam('dd_blBasketjQueryUiConfirm')}]
        [{oxstyle include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/css/jquery-ui-1.10.3.custom.min.css')}]
    [{/if}]
[{/if}]