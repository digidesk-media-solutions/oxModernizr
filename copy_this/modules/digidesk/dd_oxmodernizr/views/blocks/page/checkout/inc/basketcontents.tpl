[{assign var="oConfig" value=$oViewConf->getConfig()}]

[{if !$oConfig->getConfigParam('dd_blBasketAmount') && !$oConfig->getConfigParam('dd_blBasketDelete') }]
    [{$smarty.block.parent}]
[{else}]
    [{* product quantity manager *}]
    <td class="quantity">
        <input type="hidden" name="aproducts[[{ $basketindex }]][aid]" value="[{ $basketitem->getProductId() }]">
        <input type="hidden" name="aproducts[[{ $basketindex }]][basketitemid]" value="[{ $basketindex }]">
        <input type="hidden" name="aproducts[[{ $basketindex }]][override]" value="1">
        [{if $basketitem->isBundle() }]
            <input type="hidden" name="aproducts[[{ $basketindex }]][bundle]" value="1">
        [{/if}]

        [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
            [{* <<START>> oxModernizr *}]
            <div class="changeAmount">
                [{if $oConfig->getConfigParam('dd_blBasketAmount') && $editable}]
                    <i class="ctrl down submitButton">-</i>
                [{/if}]
                <input id="am_[{$smarty.foreach.basketContents.iteration}]" type="text" class="textbox amount no_oxModernizr" name="aproducts[[{ $basketindex }]][am]" value="[{ $basketitem->getAmount() }]" size="2">
                [{if $oConfig->getConfigParam('dd_blBasketAmount') && $editable}]
                    <i class="ctrl up submitButton">+</i>
                [{/if}]
            </div>
            [{if $oConfig->getConfigParam('dd_blBasketAmount') && $editable}]
                <a href="javascript:;" class="deleteProduct" title="[{oxmultilang ident="DD_REMOVE_ITEM_FROM_BASKET"}]"></a>
            [{/if}]
            [{* <<ENDE>> oxModernizr *}]
        [{/if}]
        [{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle()) }]
            +[{ $basketitem->getdBundledAmount() }]
        [{/if}]
    </td>
[{/if}]