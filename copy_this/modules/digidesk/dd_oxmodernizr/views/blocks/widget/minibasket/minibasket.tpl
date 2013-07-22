<div id="[{$_prefix}]miniBasket" class="basketBox">
    [{if $_prefix != "modal"}]
        [{if $oxcmp_basket->getItemsCount() > 0}]
            <span class="counter FXgradOrange">
                [{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
                <span id="[{$_prefix}]countValue">
                    [{$oxcmp_basket->getItemsCount()}]
                </span>
            </span>
        [{/if}]
        <img src="[{$oViewConf->getImageUrl('basket.png')}]" id="[{$_prefix}]minibasketIcon" alt="Basket" class="basket">
    [{/if}]
</div>

[{if $oxcmp_basket->getProductsCount()}]
    [{oxhasrights ident="TOBASKET"}]
        [{assign var="oConfig" value=$oViewConf->getConfig()}]
        [{assign var="sTopActiveClassName" value=$oViewConf->getTopActiveClassName()}]
        [{assign var="currency" value=$oView->getActCurrency()}]

        
        [{if $oxcmp_basket->getProductsCount() gte 8}]
            [{assign var="scrollableBasket" value=true}]
        [{/if}]

        <div id="[{$_prefix}]basketFlyout" class="basketFlyout corners[{if $scrollableBasket}] scrollable[{/if}] dd_oxModernizr_basketFlyout[{if $oConfig->getConfigParam('dd_blMiniBasketAmount')}] dd_blMiniBasketAmount[{/if}][{if $oConfig->getConfigParam('dd_blMiniBasketThumbs')}] dd_oxModernizr_basketThumbs[{/if}]"[{if !$oConfig->getRequestParameter('prevent_open_minibasket') && ( $oConfig->getRequestParameter('open_minibasket') || $_newitem )}] style="display:block;"[{/if}]>

            [{if $oConfig->getConfigParam('dd_blMiniBasketAjax')}]
                <div class="ajaxLoading"></div>
            [{/if}]

            <p class="title">
                [{if $_prefix != "modal"}]
                    <strong>[{$oxcmp_basket->getItemsCount()}] [{oxmultilang ident="WIDGET_MINIBASKET_ITEMS_IN_BASKET"}]</strong>
                [{else}]
                    <strong class="note">[{oxmultilang ident="WIDGET_NEWBASKETITEMMSG"}]</strong>
                [{/if}]
                <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
            </p>
            [{if $_prefix != "modal"}]
                [{if $oxcmp_basket->getItemsCount() > 0}]
                    <span class="counter FXgradOrange">
                        [{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
                        <span id="[{$_prefix}]countValue">[{$oxcmp_basket->getItemsCount()}]</span>
                    </span>
                [{/if}]
                <img src="[{$oViewConf->getImageUrl('basket.png')}]" id="[{$_prefix}]minibasketIcon" alt="Basket" class="basket">
            [{/if}]

            [{if $scrollableBasket}]
                <div class="scrollbarBox">
                    <div class="basketItems">
                        <hr>
            [{/if}]

            [{if $sTopActiveClassName != 'order' && ( $oConfig->getConfigParam('dd_blMiniBasketAmount') || $oConfig->getConfigParam('dd_blMiniBasketDelete') )}]
                <form name="basket[{$sItemKey}]" action="[{$oViewConf->getSelfActionLink()}]" method="post">
                    [{$oViewConf->getHiddenSid()}]
                    <input type="hidden" name="cl" value="">
                    <input type="hidden" name="fnc" value="changebasket">
                    [{if !$oConfig->getRequestParameter('prevent_open_minibasket')}]
                        <input type="hidden" name="open_minibasket" value="1">
                    [{/if}]
                    [{if $oConfig->getConfigParam('dd_blMiniBasketAjax')}]
                        <input type="hidden" name="renderPartial" value="1">
                    [{/if}]
            [{/if}]

                <ul>
                    [{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
                        [{if $sTopActiveClassName != 'order'  && $oConfig->getConfigParam('dd_blMiniBasketAmount')}]
                            [{* Dem Basket-Flyout (Mini-Basket) eine Klasse für CSS-Overrides *}]
                            [{oxscript add="$('#header .basketFlyout').addClass('dd_oxModernizr_basketFlyout');"}]

                            [{assign var="oProduct" value=$_product->getArticle()}]
                            [{assign var="sItemKey" value=$oxcmp_basket->getItemKey($oProduct->getProductId(),$_product->getSelList(),$_product->getPersParams(),$_product->isBundle())}]
                            [{assign var="minibasketItemTitle" value=$_product->getTitle()}]
                            <li>

                                [{if $oConfig->getConfigParam('dd_blMiniBasketThumbs')}]
                                    <a href="[{$_product->getLink()}]" rel="nofollow" class="thumb">
                                        <img src="[{$_product->getIconUrl()}]" alt="[{$_product->getTitle()|strip_tags}]">
                                    </a>
                                [{/if}]

                                <a href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]" class="titleLink">
                                    <span class="item">[{$minibasketItemTitle|strip_tags}]</span>
                                </a>

                                <div class="changeAmount">
                                    <i class="ctrl down submitButton">-</i>

                                    <input type="hidden" name="aproducts[[{$sItemKey}]][aid]" value="[{$_product->getProductId()}]">
                                    <input type="hidden" name="aproducts[[{$sItemKey}]][basketitemid]" value="[{$sItemKey}]">
                                    <input type="hidden" name="aproducts[[{$sItemKey}]][override]" value="1">
                                    [{if $_product->isBundle()}]
                                        <input type="hidden" name="aproducts[[{$sItemKey}]][bundle]" value="1">
                                    [{/if}]
                                    <input type="text" class="amount no_oxModernizr" name="aproducts[[{$sItemKey}]][am]" value="[{$_product->getAmount()}]" size="2">

                                    <i class="ctrl up submitButton">+</i>
                                </div>

                                [{if $oConfig->getConfigParam('dd_blMiniBasketDelete')}]
                                    <a href="javascript:;" class="deleteProduct" title="[{oxmultilang ident="DD_REMOVE_ITEM_FROM_BASKET"}]"></a>
                                [{/if}]

                                <a href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]" class="priceLink">
                                    <strong class="price">[{$_product->getFTotalPrice()}] [{$currency->sign}]</strong>
                                </a>
                            </li>
                        [{else}]
                            [{assign var="minibasketItemTitle" value=$_product->getTitle()}]
                            <li>

                                [{if $oConfig->getConfigParam('dd_blMiniBasketThumbs')}]
                                    <a href="[{$_product->getLink()}]" rel="nofollow" class="thumb">
                                        <img src="[{$_product->getIconUrl()}]" alt="[{$_product->getTitle()|strip_tags}]">
                                    </a>
                                [{/if}]

                                <a href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]">
                                    <span class="item">
                                        [{if $_product->getAmount() gt 1}]
                                            [{$_product->getAmount()}] x
                                        [{/if}]
                                        [{$minibasketItemTitle|strip_tags}]
                                    </span>
                                    <strong class="price">[{$_product->getFTotalPrice()}] [{$currency->sign}]</strong>
                                </a>

                                [{if $sTopActiveClassName != 'order' && $oConfig->getConfigParam('dd_blMiniBasketDelete')}]
                                    <a href="javascript:;" class="deleteProduct" title="[{oxmultilang ident="DD_REMOVE_ITEM_FROM_BASKET"}]"></a>
                                [{/if}]

                            </li>
                        [{/if}]
                    [{/foreach}]
                </ul>
                <p class="totals">
                    <span class="item">[{oxmultilang ident="WIDGET_MINIBASKET_TOTAL"}]</span>
                    <strong class="price">
                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                        [{$oxcmp_basket->getProductsNetPrice()}]
                    [{else}]
                        [{$oxcmp_basket->getFProductsPrice()}]
                    [{/if}]
                    [{$currency->sign}]</strong>
                </p>

            [{if $sTopActiveClassName != 'order' && ( $oConfig->getConfigParam('dd_blMiniBasketAmount') || $oConfig->getConfigParam('dd_blMiniBasketDelete') )}]
                </form>
            [{/if}]

            [{if $scrollableBasket}]
                    </div>
                </div>
                <hr>
            [{/if}]

            <hr>
            [{include file="widget/minibasket/countdown.tpl"}]
            <p class="functions clear">
               [{if $oxcmp_user}]
                   <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=payment"}]" class="submitButton largeButton">[{oxmultilang ident="WIDGET_MINIBASKET_CHECKOUT"}]</a>
               [{else}]
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]" class="submitButton largeButton">[{oxmultilang ident="WIDGET_MINIBASKET_CHECKOUT"}]</a>
               [{/if}]
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" class="textButton">[{oxmultilang ident="WIDGET_MINIBASKET_DISPLAY_BASKET"}]</a>
            </p>
        </div>
    [{/oxhasrights}]
[{/if}]