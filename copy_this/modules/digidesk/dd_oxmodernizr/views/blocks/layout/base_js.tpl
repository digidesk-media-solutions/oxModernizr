[{$smarty.block.parent}]

[{assign var="sDate" value="YmdHis"|@date}]
[{assign var="sActiveClass" value=$oViewConf->getActiveClassName()}]


[{* <<START>> dd_oxModernizr Config-Objekt erstellen *}]
[{assign var="aModuleSettings" value=$oViewConf->getModuleSettings()}]
[{assign var="sModuleSettings" value=$aModuleSettings|@json_encode}]
[{oxscript add="dd_oxModernizr = { oVars: {}, oSettings: `$sModuleSettings`, oLangStrings: {} };"}]
[{oxscript add="dd_oxModernizr.oVars.sActiveClassName = '`$sActiveClass`';
                dd_oxModernizr.oVars.sSelfActionLink = '"|cat:$oViewConf->getSelfActionLink()|cat:"';"}]

[{if $aModuleSettings.dd_blMiniBasketAjax || $aModuleSettings.dd_blBasketAjax}]
    [{oxscript add="awsmInfiniteLoopPr0tect0r = 0"}]
[{/if}]
[{* <<ENDE>> dd_oxModernizr Config-Objekt erstellen *}]


[{* <<START>> allgemeine Benutzerfreundlichkeit *}]
[{if $aModuleSettings.dd_blEnabledClearInput}]
    [{if $aModuleSettings.dd_blEnabledMinJs}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/forms.min.js')|cat:'?'|cat:$sDate priority=20}]
    [{else}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/forms.js')|cat:'?'|cat:$sDate priority=20}]
    [{/if}]
[{/if}]
[{* <<ENDE>> allgemeine Benutzerfreundlichkeit *}]


[{* <<START>> Effekte *}]
[{if $aModuleSettings.dd_blToBasketAnimation}]
    [{if $aModuleSettings.dd_blEnabledMinJs}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/effects.min.js')|cat:'?'|cat:$sDate priority=20}]
    [{else}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/effects.js')|cat:'?'|cat:$sDate priority=20}]
    [{/if}]
[{/if}]
[{* <<ENDE>> allgemeine Benutzerfreundlichkeit *}]


[{* <<START>> Mini-Warenkorb *}]
[{if $aModuleSettings.dd_blMiniBasketAmount }]

    [{* jQuery-UI laden *}]
    [{if $aModuleSettings.dd_blMiniBasketjQueryUiConfirm}]
        [{assign var="bljQueryUiLoaded" value=true}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/jquery-ui.min.js')|cat:'?'|cat:$sDate priority=18}]
    [{/if}]

    [{* AJAX-Warenkorb *}]
    [{if $aModuleSettings.dd_blMiniBasketAjax}]
        [{if $aModuleSettings.dd_blEnabledMinJs}]
            [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/minibasket_ajax.min.js')|cat:'?'|cat:$sDate priority=19}]
        [{else}]
            [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/minibasket_ajax.js')|cat:'?'|cat:$sDate priority=19}]
        [{/if}]
    [{/if}]

    [{* Produktmengenänderungen im Mini-Warenkorb *}]
    [{if $aModuleSettings.dd_blEnabledMinJs}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/minibasket_amount.min.js')|cat:'?'|cat:$sDate priority=20}]
    [{else}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/minibasket_amount.js')|cat:'?'|cat:$sDate priority=20}]
    [{/if}]
[{/if}]
[{* <<ENDE>> Mini-Warenkorb *}]


[{* <<START>> Warenkorb *}]
[{* Lang-Strings für Confirm-Dialoge *}]
[{if $aModuleSettings.dd_blMiniBasketAmount || $aModuleSettings.dd_blBasketAmount || $aModuleSettings.dd_blBasketjQueryUiConfirm}]
    <script type="text/javascript">
        checkReadyStateInterval = null;
        function checkReadyState() {
            if ( document.readyState !== 'complete' ) { return; }

            dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET       = '[{oxmultilang ident="DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET"}]'
            dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_TITLE = '[{oxmultilang ident="DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_TITLE"}]'
            dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_YES   = '[{oxmultilang ident="DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_YES"}]'
            dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_NO    = '[{oxmultilang ident="DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_NO"}]'

            dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET       = '[{oxmultilang ident="DD_CONFIRM_REMOVE_ITEM_FROM_BASKET"}]'
            dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_TITLE = '[{oxmultilang ident="DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_TITLE"}]'
            dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_YES   = '[{oxmultilang ident="DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_YES"}]'
            dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_NO    = '[{oxmultilang ident="DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_NO"}]'

            clearInterval( checkReadyStateInterval );
        }
        checkReadyStateInterval = setInterval(checkReadyState, 100);
    </script>
[{/if}]

[{* jQuery-UI laden *}]
[{if !$bljQueryUiLoaded && $aModuleSettings.dd_blBasketjQueryUiConfirm}]
    [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/jquery-ui.min.js')|cat:'?'|cat:$sDate priority=18}]
[{/if}]

[{* Produktmengenänderungen im Warenkorb *}]
[{if $aModuleSettings.dd_blBasketAmount}]
    [{* Produktmengenänderungen im Mini-Warenkorb *}]
    [{if $aModuleSettings.dd_blEnabledMinJs}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/basket_amount.min.js')|cat:'?'|cat:$sDate priority=20}]
    [{else}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/basket_amount.js')|cat:'?'|cat:$sDate priority=20}]
    [{/if}]
[{/if}]

[{* AJAX-Warenkorb *}]
[{if $aModuleSettings.dd_blBasketAjax}]
    [{if $aModuleSettings.dd_blEnabledMinJs}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/basket_ajax.min.js')|cat:'?'|cat:$sDate priority=19}]
    [{else}]
        [{oxscript include=$oViewConf->getModuleUrl('digidesk','dd_oxmodernizr/out/src/js/basket_ajax.js')|cat:'?'|cat:$sDate priority=19}]
    [{/if}]
[{/if}]
[{* <<ENDE>> Mini-Warenkorb *}]